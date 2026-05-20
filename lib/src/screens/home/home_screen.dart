import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_demo_app/src/demos/demo_configurations.dart';

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

  @override
  void dispose() {
    _fileLoader.dispose();
    super.dispose();
  }

  DemoConfiguration? _getConfigFromName(String name) {
    final matches = demoConfigurations.where(
      (config) => config.displayName.toLowerCase() == name.toLowerCase(),
    );
    if (matches.isEmpty) return null;
    return matches.first;
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return RiveWidgetBuilder(
      fileLoader: _fileLoader,
      dataBind: DataBind.auto(),
      builder: (context, state) {
        if (state is! RiveLoaded) {
          return const Center(child: CircularProgressIndicator());
        }

        // Bind list entries to entries.

        final vmi = state.viewModelInstance!;
        final list = vmi.list('listProperty')!;
        for (var i = 0; i < list.length; i++) {
          final item = list.instanceAt(i);
          final name = item.string('name')!.value;
          final select = item.trigger('select')!;
          final config = _getConfigFromName(name);

          if (config != null) _bindTriggerToConfig(select, config);
        }

        return ColoredBox(
          color: const Color(0xffE0E0E0),
          child: SafeArea(
            bottom: false,
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
