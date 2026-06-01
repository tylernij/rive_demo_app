import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_demo_app/src/demos/avatar_creator/avatar_display_screen.dart';

/// The avatar creator demo entry.
class AvatarCreator extends StatefulWidget {
  /// Creates a new [AvatarCreator].
  const AvatarCreator({super.key});

  @override
  State<AvatarCreator> createState() => _AvatarCreatorState();
}

class _AvatarCreatorState extends State<AvatarCreator> {
  late final fileLoader = FileLoader.fromAsset(
    'assets/riv/avatar_creator/avatarcreatordevice_attemptinghaircolorfix.riv',
    riveFactory: Factory.rive,
  );
  ViewModelInstance? vmi;

  @override
  void dispose() {
    fileLoader.dispose();
    super.dispose();
  }

  Future<void> _xListener(bool clicked) async {
    // final exited = await FlutterExitApp.exitApp();
    // if (!exited) SystemNavigator.pop();

    // For the demo, just go back.
    Navigator.pop(context);
  }

  Future<void> _doneListener(bool clicked) async {
    await Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => AvatarDisplayScreen(parentVmi: vmi!),
      ),
    );
  }

  void _registerListeners() {
    vmi
        ?.viewModel('propertyOfVMX')!
        .trigger('xPressed')!
        .addListener(_xListener);
    vmi
        ?.viewModel('propertyOfVMDone')!
        .trigger('donePressed')!
        .addListener(_doneListener);
  }

  @override
  Widget build(BuildContext context) {
    return RiveWidgetBuilder(
      fileLoader: fileLoader,
      artboardSelector: ArtboardSelector.byName('MainArtboard'),
      dataBind: DataBind.auto(),
      builder: (context, state) {
        if (state is! RiveLoaded) {
          return const Center(child: CircularProgressIndicator());
        }

        vmi = state.viewModelInstance;
        _registerListeners();

        return RiveWidget(
          controller: state.controller,
          fit: Fit.layout,
          layoutScaleFactor: 0.75,
        );
      },
    );
  }
}
