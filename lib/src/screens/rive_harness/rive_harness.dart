import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive_demo_app/src/model/safe_area_layout.dart';

/// The container around a generic .riv file to provide extra functionality.
class RiveHarness extends StatefulWidget {
  /// Creates a new [RiveHarness].
  const RiveHarness({
    required this.entryPoint,
    this.showBackButton = true,
    this.backButtonPlatforms = const {
      TargetPlatform.linux,
      TargetPlatform.windows,
      TargetPlatform.macOS,
    },
    this.backButtonLocation = FloatingActionButtonLocation.miniStartFloat,
    this.useSafeArea = false,
    this.backgroundColor,
    this.safeAreaLayouts = const {
      SafeAreaLayout.left,
      SafeAreaLayout.right,
      SafeAreaLayout.bottom,
      SafeAreaLayout.top,
    },
    this.orientations,
    super.key,
  });

  /// The demo entry point.
  final Widget entryPoint;

  /// Whether or not to add a back button.
  final bool showBackButton;

  /// Which platforms to show the back button for.
  final Set<TargetPlatform> backButtonPlatforms;

  /// The positioning of the back button.
  final FloatingActionButtonLocation backButtonLocation;

  /// Avoid display cut-outs.
  final bool useSafeArea;

  /// Background color to display behind the Rive widget.
  final Color? backgroundColor;

  /// Which sides to use for the [SafeArea].
  final Set<SafeAreaLayout> safeAreaLayouts;

  /// The list of accepted orientations.
  final Set<DeviceOrientation>? orientations;

  @override
  State<RiveHarness> createState() => _HarnessState();
}

class _HarnessState extends State<RiveHarness> {
  @override
  void initState() {
    super.initState();

    // Lock orientation if needed.
    if (widget.orientations != null) {
      unawaited(
        SystemChrome.setPreferredOrientations(widget.orientations!.toList()),
      );
    }
  }

  @override
  void dispose() {
    // Unlock orientation if needed.
    if (widget.orientations != null) {
      unawaited(SystemChrome.setPreferredOrientations([]));
    }

    super.dispose();
  }

  Widget _backButton() {
    return FloatingActionButton.small(
      shape: const CircleBorder(),
      backgroundColor: Colors.black,
      onPressed: () => Navigator.pop(context),
      child: const Icon(
        Icons.arrow_back,
        color: Color(0xffffa31c),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var entryPoint = widget.entryPoint;

    // Protect from device cut-outs if specified.
    if (widget.useSafeArea) {
      entryPoint = ColoredBox(
        color: widget.backgroundColor ?? Colors.black,
        child: SafeArea(
          left: widget.safeAreaLayouts.contains(SafeAreaLayout.left),
          right: widget.safeAreaLayouts.contains(SafeAreaLayout.right),
          top: widget.safeAreaLayouts.contains(SafeAreaLayout.top),
          bottom: widget.safeAreaLayouts.contains(SafeAreaLayout.bottom),
          child: widget.entryPoint,
        ),
      );
    }

    // Check if our current platform should show the back button.
    final targetPlatform = Theme.of(context).platform;
    final shouldShowBackButton =
        widget.showBackButton &&
        widget.backButtonPlatforms.contains(
          targetPlatform,
        );

    return Scaffold(
      body: entryPoint,
      floatingActionButton: shouldShowBackButton ? _backButton() : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }
}
