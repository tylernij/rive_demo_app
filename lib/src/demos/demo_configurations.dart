import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';
import 'package:rive_demo_app/src/demos/data_viz/data_viz.dart';
import 'package:rive_demo_app/src/demos/duelist/duelist.dart';
import 'package:rive_demo_app/src/demos/generic_rive/generic_rive.dart';
import 'package:rive_demo_app/src/demos/treasure_chest/treasure_chest.dart';
import 'package:rive_demo_app/src/screens/rive_harness/rive_harness.dart';

/// The demo configurations.
final demoConfigurations = <DemoConfiguration>[
  // Avatar Creator Demo.
  // const DemoConfiguration(
  //   displayName: 'Avatar Creator',
  //   harness: RiveHarness(
  //     entryPoint: AvatarCreator(),
  //     showBackButton: false, // We handle this internally.
  //   ),
  // ),

  // Treasure Chest Demo.
  const DemoConfiguration(
    displayName: 'Rewards Demo',
    harness: RiveHarness(entryPoint: TreasureChest()),
  ),

  // Responsive Layouts Demo.
  // const DemoConfiguration(
  //   displayName: 'Responsive Layouts',
  //   harness: RiveHarness(
  //     entryPoint: GenericRive(
  //       assetPath: 'assets/riv/responsive_layouts/layouts_demo.riv',
  //     ),
  //   ),
  // ),

  // Duelist.
  const DemoConfiguration(
    displayName: 'Duelist',
    harness: RiveHarness(
      entryPoint: Duelist(),
      showBackButton: false,
    ),
  ),

  // Feathering Button Demo.
  DemoConfiguration(
    displayName: 'Feathering Button',
    harness: RiveHarness(
      entryPoint: GenericRive(
        assetPath: 'assets/riv/feathering_button/push_button.riv',
        dataBind: DataBind.auto(),
      ),
    ),
  ),

  // Feathering Coin Demo.
  const DemoConfiguration(
    displayName: 'Feathering Coin',
    harness: RiveHarness(
      entryPoint: GenericRive(
        assetPath: 'assets/riv/feathering_coin/coin_demo_feathering.riv',
        layoutScaleFactor: 0.5,
      ),
    ),
  ),

  // Data Visualization Demo.
  const DemoConfiguration(
    displayName: 'Data Viz',
    harness: RiveHarness(
      entryPoint: DataViz(),
    ),
  ),

  // Amazon Ad Demo.
  DemoConfiguration(
    displayName: 'Amazon Ad',
    harness: RiveHarness(
      entryPoint: GenericRive(
        assetPath: 'assets/riv/amazon_ad/amazon_ad-demo_2025.riv',
        dataBind: DataBind.auto(),
        fit: Fit.contain,
      ),
    ),
  ),

  // RTL Language Layout Demo.
  DemoConfiguration(
    displayName: 'RTL Language Layout',
    harness: RiveHarness(
      entryPoint: GenericRive(
        assetPath: 'assets/riv/rtl_language_layout/rtllanguagelayout.riv',
        dataBind: DataBind.auto(),
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
