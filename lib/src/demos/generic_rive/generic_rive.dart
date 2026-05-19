import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

/// A generic .riv file builder.
class GenericRive extends StatefulWidget {
  /// Creates a new [GenericRive].
  const GenericRive({
    required this.assetPath,
    this.artboardName,
    this.stateMachineName,
    this.fit = Fit.layout,
    this.layoutScaleFactor = RiveDefaults.layoutScaleFactor,
    this.dataBind,
    super.key,
  });

  /// The path to the .riv file.
  final String assetPath;

  /// The name of the artboard to load.
  final String? artboardName;

  /// The name of the state machine to use.
  final String? stateMachineName;

  /// The fit to use.
  final Fit fit;

  /// The layout scale factor to use.
  final double layoutScaleFactor;

  /// The data binding mode.
  final DataBind? dataBind;

  @override
  State<GenericRive> createState() => _GenericRiveState();
}

class _GenericRiveState extends State<GenericRive> {
  late final _fileLoader = FileLoader.fromAsset(
    widget.assetPath,
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
      artboardSelector: widget.artboardName == null
          ? const ArtboardDefault()
          : ArtboardSelector.byName(widget.artboardName!),
      stateMachineSelector: widget.stateMachineName == null
          ? const StateMachineDefault()
          : StateMachineSelector.byName(widget.stateMachineName!),
      dataBind: widget.dataBind,
      builder: (context, state) {
        if (state is! RiveLoaded) {
          return const Center(child: CircularProgressIndicator());
        }

        return RiveWidget(
          controller: state.controller,
          fit: widget.fit,
          layoutScaleFactor: widget.layoutScaleFactor,
        );
      },
    );
  }
}
