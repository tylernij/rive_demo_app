import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:rive_demo_app/src/demos/configs.dart';
import 'package:rive_demo_app/src/model/demo_configuration.dart';

/// The demo selection home screen.
class HomeScreen extends StatefulWidget {
  /// Creates a new [HomeScreen].
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final _fileLoader = FileLoader.fromAsset(
    'assets/riv/home/rive_demo_app_v02.riv',
    riveFactory: Factory.rive,
  );

  /// Lock the orientation on the home screen.
  Future<void> _lockOrientation() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void initState() {
    super.initState();
    unawaited(_lockOrientation());
  }

  @override
  void dispose() {
    _fileLoader.dispose();
    super.dispose();
  }

  ViewModelInstance _createListItemInstance(
    File file,
    DemoConfiguration config,
  ) {
    final instance = file.viewModelByName('Item')!.createDefaultInstance()!;
    final nameProp = instance.string('name')!;
    final descriptionProp = instance.string('description')!;
    nameProp.value = config.displayName;
    descriptionProp.value = config.description;

    return instance;
  }

  void _bindTriggerToConfig(
    ViewModelInstanceTrigger trigger,
    DemoConfiguration config,
  ) {
    trigger.addListener((value) async {
      await Navigator.push(
        context,
        MaterialPageRoute<void>(builder: (context) => config.harness),
      );

      // Restore locked orientation.
      await _lockOrientation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RiveWidgetBuilder(
      fileLoader: _fileLoader,
      dataBind: DataBind.empty(),
      onLoaded: (state) {
        // Bind list entries to entries.
        final vmi = state.viewModelInstance!;
        final listProp = vmi.list('listProperty')!;
        for (final config in demoConfigurations) {
          final listItemInstance = _createListItemInstance(state.file, config);
          listProp.add(listItemInstance);

          // Bind to already-created instance so trigger fires.
          final realListItemInstance = listProp.instanceAt(listProp.length - 1);
          final selectProp = realListItemInstance.trigger('select')!;
          _bindTriggerToConfig(selectProp, config);
        }
      },
      builder: (context, state) {
        if (state is! RiveLoaded) {
          return const Center(child: CircularProgressIndicator());
        }

        return ColoredBox(
          color: Colors.black,
          child: SafeArea(
            child: RiveWidget(
              controller: state.controller,
              fit: Fit.layout,
              layoutScaleFactor: 0.35,
            ),
          ),
        );
      },
    );
  }
}
