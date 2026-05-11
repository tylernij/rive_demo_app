import 'package:flutter/cupertino.dart';
import 'package:rive_demo_app/src/demos/avatar_creator/rive_screen.dart';
import 'package:rive_demo_app/src/demos/generic_rive/generic_rive.dart';
import 'package:rive_demo_app/src/demos/treasure_chest/treasure_chest.dart';
import 'package:rive_demo_app/src/screens/rive_harness/rive_harness.dart';

/// The demo configurations.
const demoConfigurations = <DemoConfiguration>[
  // Avatar Creator Demo.
  DemoConfiguration(
    displayName: 'Avatar Creator',
    harness: RiveHarness(
      entryPoint: RiveScreen(),
      showBackButton: false, // We handle this internally.
    ),
  ),

  // Treasure Chest Demo.
  DemoConfiguration(
    displayName: 'Treasure Chest',
    harness: RiveHarness(entryPoint: TreasureChest()),
  ),

  // Responsive Layouts Demo.
  DemoConfiguration(
    displayName: 'Responsive Layouts',
    harness: RiveHarness(
      entryPoint: GenericRive(
        assetPath: 'assets/riv/responsive_layouts/layouts_demo.riv',
      ),
    ),
  ),
];

/// The configuration profile for each demo.
class DemoConfiguration {
  /// Creates a new [DemoConfiguration].
  const DemoConfiguration({
    required this.displayName,
    required this.harness,
  });

  /// The demo display name.
  final String displayName;

  /// The demo entry point, typically in a harness.
  /// See [RiveHarness] for advanced configuration.
  final Widget harness;
}
