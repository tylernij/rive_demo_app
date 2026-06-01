import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rive/rive.dart';
import 'package:rive_demo_app/src/demos/avatar_creator/save_file.dart';

/// Display the final avatar icon for download and viewing.
class AvatarDisplayScreen extends StatefulWidget {
  /// Creates a new [AvatarDisplayScreen].
  const AvatarDisplayScreen({
    required this.parentVmi,
    super.key,
  });

  /// The top-level view model instance.
  final ViewModelInstance parentVmi;

  @override
  State<AvatarDisplayScreen> createState() => _AvatarDisplayScreenState();
}

class _AvatarDisplayScreenState extends State<AvatarDisplayScreen> {
  final GlobalKey _screenshotKey = GlobalKey();

  late final fileLoader = FileLoader.fromAsset(
    'assets/riv/avatar_creator/avatarcreatordevice_attemptinghaircolorfix.riv',
    riveFactory: Factory.rive,
  );

  @override
  void dispose() {
    fileLoader.dispose();
    super.dispose();
  }

  Future<void> _postSavePopUp() async {
    final dialog = AlertDialog(
      title: const Text('Image saved'),
      content: const Text('The avatar image has been saved to your gallery!'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Dismiss'),
        ),
      ],
    );
    await showDialog<void>(context: context, builder: (context) => dialog);
  }

  Future<void> _saveAvatar() async {
    final boundary =
        _screenshotKey.currentContext!.findRenderObject()!
            as RenderRepaintBoundary;

    final image = await boundary.toImage(pixelRatio: 3);
    final byteData = await image.toByteData(format: ImageByteFormat.png);

    final pngBytes = byteData!.buffer.asUint8List();

    final saved = await SaveFile(pngBytes: pngBytes).save();
    if (saved) await _postSavePopUp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: _saveAvatar,
            child: const Text('Save'),
          ),
        ],
      ),
      body: Center(
        child: RiveWidgetBuilder(
          fileLoader: fileLoader,
          dataBind: DataBind.auto(),
          artboardSelector: ArtboardSelector.byName('PreviewArtboard'),
          builder: (context, state) {
            if (state is! RiveLoaded) {
              return const Center(child: CircularProgressIndicator());
            }

            state.controller.artboard.bindViewModelInstance(widget.parentVmi);

            return RepaintBoundary(
              key: _screenshotKey,
              child: RiveWidget(
                controller: state.controller,
                layoutScaleFactor: 0.75,
              ),
            );
          },
        ),
      ),
    );
  }
}
