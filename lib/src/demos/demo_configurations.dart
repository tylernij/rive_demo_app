import 'package:flutter/cupertino.dart';
import 'package:rive_demo_app/src/demos/avatar_creator/rive_screen.dart';

/// The demo configurations.
const demoConfigurations = <DemoConfiguration>[
  // Avatar Creator Demo.
  DemoConfiguration(
    displayName: 'Avatar Creator',
    entryPoint: RiveScreen(),
  ),
];

/// The configuration profile for each demo.
class DemoConfiguration {
  /// Creates a new [DemoConfiguration].
  const DemoConfiguration({
    required this.displayName,
    required this.entryPoint,
  });

  /// The demo display name.
  final String displayName;

  /// The demo entry point.
  final Widget entryPoint;
}
