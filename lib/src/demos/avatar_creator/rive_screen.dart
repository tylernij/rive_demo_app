import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_demo_app/src/demos/avatar_creator/avatar_display_screen.dart';

class RiveScreen extends StatefulWidget {
  const RiveScreen({super.key});

  @override
  State<RiveScreen> createState() => _RiveScreenState();
}

class _RiveScreenState extends State<RiveScreen> {
  late final fileLoader = FileLoader.fromAsset(
    'assets/riv/avatar_creator/avatar_creator.riv',
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
          return CircularProgressIndicator();
        }

        vmi = state.viewModelInstance!;
        _registerListeners();

        return RiveWidget(controller: state.controller, fit: Fit.layout);
      },
    );
  }
}
