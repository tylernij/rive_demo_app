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
    description: 'Set my description, please!',
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
    description: 'Set my description, please!',
    harness: RiveHarness(
      entryPoint: Duelist(),
      showBackButton: false,
    ),
  ),

  // Feathering Button Demo.
  DemoConfiguration(
    displayName: 'Feathering Button',
    description: 'Set my description, please!',
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
    description: 'Set my description, please!',
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
    description: 'Set my description, please!',
    harness: RiveHarness(
      entryPoint: DataViz(),
    ),
  ),

  // Ad Widget Demo.
  DemoConfiguration(
    displayName: 'Ad Widget',
    description: 'Set my description, please!',
    harness: RiveHarness(
      entryPoint: GenericRive(
        assetPath: 'assets/riv/ad_widget/amazon_ad-demo_2026.riv',
        dataBind: DataBind.auto(),
      ),
    ),
  ),

  // RTL Language Layout Demo.
  DemoConfiguration(
    displayName: 'RTL Language Layout',
    description: 'Set my description, please!',
    harness: RiveHarness(
      entryPoint: GenericRive(
        assetPath: 'assets/riv/rtl_language_layout/rtllanguagelayout.riv',
        dataBind: DataBind.auto(),
      ),
    ),
  ),

  // Liquid Download Demo.
  DemoConfiguration(
    displayName: 'Liquid Download',
    description: 'Set my description, please!',
    harness: RiveHarness(
      entryPoint: GenericRive(
        assetPath: 'assets/riv/liquid_download/liquid_download.riv',
        dataBind: DataBind.auto(),
        fit: Fit.contain,
      ),
    ),
  ),

  // Scrollytelling Demo.
  const DemoConfiguration(
    displayName: 'Scrollytelling',
    description: 'Set my description, please!',
    harness: RiveHarness(
      entryPoint: GenericRive(
        assetPath:
            'assets/riv/scrollytelling/scrolly-telling-vertical-responsive.riv',
      ),
    ),
  ),

  // Scrollytelling Raster Demo.
  const DemoConfiguration(
    displayName: 'Scrollytelling Raster',
    description: 'Set my description, please!',
    harness: RiveHarness(
      entryPoint: GenericRive(
        assetPath:
            'assets/riv/scrollytelling_raster/scrolly-telling-raster.riv',
      ),
    ),
  ),

  // Car Widget Demo.
  const DemoConfiguration(
    displayName: 'Car Widget',
    description: 'Set my description, please!',
    harness: RiveHarness(
      entryPoint: GenericRive(
        assetPath: 'assets/riv/car_widget/car_widgets_v01.riv',
      ),
    ),
  ),

  // Fintech Demo.
  const DemoConfiguration(
    displayName: 'Fintech',
    description: 'Set my description, please!',
    harness: RiveHarness(
      entryPoint: GenericRive(
        assetPath: 'assets/riv/fintech/fintech_data_viz_v03.riv',
      ),
    ),
  ),

  // Game Character Demo.
  const DemoConfiguration(
    displayName: 'Game Character',
    description: 'Set my description, please!',
    harness: RiveHarness(
      entryPoint: GenericRive(
        assetPath: 'assets/riv/game_character/game_character_demo.riv',
      ),
    ),
  ),

  // Car Component Demo.
  const DemoConfiguration(
    displayName: 'Car Component',
    description: 'Set my description, please!',
    harness: RiveHarness(
      entryPoint: GenericRive(
        assetPath: 'assets/riv/car_component/car_component_demo.riv',
      ),
    ),
  ),

  // Music Player Demo.
  const DemoConfiguration(
    displayName: 'Music Player',
    description: 'Set my description, please!',
    harness: RiveHarness(
      entryPoint: GenericRive(
        assetPath: 'assets/riv/music_player/music_player.riv',
      ),
    ),
  ),

  // Slot Machine Demo.
  const DemoConfiguration(
    displayName: 'Slot Machine',
    description: 'Set my description, please!',
    harness: RiveHarness(
      entryPoint: GenericRive(
        assetPath: 'assets/riv/slot_machine/slot_machine.riv',
      ),
    ),
  ),

  // Inventory Demo.
  const DemoConfiguration(
    displayName: 'Inventory',
    description: 'Set my description, please!',
    harness: RiveHarness(
      entryPoint: GenericRive(
        assetPath: 'assets/riv/inventory/inventory_demo_test_v2.riv',
      ),
    ),
  ),

  // Sports Broadcast Demo.
  const DemoConfiguration(
    displayName: 'Sports Broadcast',
    description: 'Set my description, please!',
    harness: RiveHarness(
      entryPoint: GenericRive(
        assetPath: 'assets/riv/sports_broadcast/sports_broadcaat.riv',
      ),
    ),
  ),
];

/// The configuration profile for each demo.
class DemoConfiguration {
  /// Creates a new [DemoConfiguration].
  const DemoConfiguration({
    required this.displayName,
    required this.description,
    required this.harness,
  });

  /// The demo display name.
  final String displayName;

  /// The demo description.
  final String description;

  /// The demo entry point, typically in a harness.
  /// See [RiveHarness] for advanced configuration.
  final Widget harness;
}
