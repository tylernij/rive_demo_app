import 'package:flutter/material.dart';

/// The container around a generic .riv file to provide extra functionality.
class RiveHarness extends StatefulWidget {
  /// Creates a new [RiveHarness].
  const RiveHarness({
    required this.entryPoint,
    this.showBackButton = true,
    this.backButtonLocation = FloatingActionButtonLocation.miniStartFloat,
    super.key,
  });

  /// The demo entry point.
  final Widget entryPoint;

  /// Whether or not to add a back button.
  final bool showBackButton;

  /// The positioning of the back button.
  final FloatingActionButtonLocation backButtonLocation;

  @override
  State<RiveHarness> createState() => _HarnessState();
}

class _HarnessState extends State<RiveHarness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(bottom: false, child: widget.entryPoint),
      floatingActionButton: widget.showBackButton
          ? FloatingActionButton.small(
              child: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }
}
