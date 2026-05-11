import 'package:flutter/cupertino.dart';
import 'package:rive_demo_app/src/demos/avatar_creator/rive_screen.dart';
import 'package:rive_demo_app/src/demos/treasure_chest/treasure_chest.dart';

/// The demo configurations.
const demoConfigurations = <DemoConfiguration>[
  // Avatar Creator Demo.
  DemoConfiguration(
    displayName: 'Avatar Creator',
    entryPoint: RiveScreen(),
  ),

  // Treasure Chest Demo.
  DemoConfiguration(
    displayName: 'Treasure Chest',
    entryPoint: TreasureChest(),
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
