import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

/// The Rive widget for the Duelist file.
class Duelist extends StatefulWidget {
  /// Creates a new [Duelist].
  const Duelist({super.key});

  @override
  State<Duelist> createState() => _DuelistState();
}

class _DuelistState extends State<Duelist> {
  late final _fileLoader = FileLoader.fromAsset(
    'assets/riv/duelist/duelist_xo_update.riv',
    riveFactory: Factory.rive,
  );

  @override
  void dispose() {
    _fileLoader.dispose();
    super.dispose();
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

        return RiveWidget(
          controller: state.controller,
          fit: Fit.layout,
          layoutScaleFactor: 0.5,
        );
      },
    );
  }
}
