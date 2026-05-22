import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:rive_demo_app/src/demos/avatar_creator/avatar_creator.dart';
import 'package:rive_demo_app/src/demos/data_viz/data_viz.dart';
import 'package:rive_demo_app/src/demos/duelist/duelist.dart';
import 'package:rive_demo_app/src/demos/generic_rive/generic_rive.dart';
import 'package:rive_demo_app/src/demos/treasure_chest/treasure_chest.dart';
import 'package:rive_demo_app/src/model/demo_configuration.dart';
import 'package:rive_demo_app/src/model/safe_area_layout.dart';
import 'package:rive_demo_app/src/screens/rive_harness/rive_harness.dart';

/// The demo configurations, ordered.
final demoConfigurations = <DemoConfiguration>[
  duelistConfig,
  avatarCreatorConfig,
  characterCardConfig,
  slotMachineConfig,
  aiDjConfig,
  scrollytellingConfig,
  treasureChestConfig,
  fintechConfig,
  adWidgetConfig,
  // carWidgetConfig,
  dataVizConfig,
  rtlLanguageLayoutConfig,
  featheringButtonConfig,
  featheringCoinConfig,
  sportsBroadcastConfig,

  // Not done, might not include
  //
  // liquidDownloadConfig,
  // scrollytellingRasterConfig,
  // gameCharacterConfig,
  // carComponentConfig,
  // musicPlayerConfig,
  // inventoryConfig,
];

/// Treasure Chest Demo.
const treasureChestConfig = DemoConfiguration(
  displayName: 'Treasure Chest',
  description:
      'Responsive game reward screen where values, reward types, and animations are driven by data.',
  harness: RiveHarness(
    entryPoint: TreasureChest(),
    useSafeArea: true,
    safeAreaLayouts: {SafeAreaLayout.top},
    backgroundColor: Color(0xFF312030),
  ),
);

/// Duelist Demo.
const duelistConfig = DemoConfiguration(
  displayName: 'Duelist',
  description:
      'Explore an interactive game-style menu complete with navigation, animations, and responsive layouts. Different menu selections trigger unique character reactions and audio feedback.',
  harness: RiveHarness(
    entryPoint: Duelist(),
    showBackButton: false,
  ),
);

/// Feathering Button Demo.
final featheringButtonConfig = DemoConfiguration(
  displayName: 'Feathering Button',
  description:
      'A simple button showcasing how Feathering can add depth, lighting, and polish to everyday UI elements.',
  harness: RiveHarness(
    entryPoint: GenericRive(
      assetPath: 'assets/riv/feathering_button/push_button.riv',
      dataBind: DataBind.auto(),
    ),
  ),
);

/// AI DJ Demo.
final aiDjConfig = DemoConfiguration(
  displayName: 'AI DJ Music Player',
  description:
      'Experience an interactive onboarding flow for a music app that combines motion, data, and polished transitions.',
  harness: RiveHarness(
    entryPoint: GenericRive(
      assetPath: 'assets/riv/ai_dj/ai_dj_demo.riv',
      dataBind: DataBind.auto(),
      layoutScaleFactor: 0.5,
    ),
    orientations: {
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    },
  ),
);

/// Avatar Creator Demo.
const avatarCreatorConfig = DemoConfiguration(
  displayName: 'Avatar Creator',
  description: '''
Build and customize a character in real time.

When you are done, save your creation as an image.''',
  harness: RiveHarness(
    entryPoint: AvatarCreator(),
    orientations: {
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    },
  ),
);

/// Character Cards Demo.
final characterCardConfig = DemoConfiguration(
  displayName: 'Character Cards',
  description:
      'Explore a collection of characters organized into different tabs, with each character displaying its own unique details and content.',
  harness: RiveHarness(
    entryPoint: GenericRive(
      assetPath: 'assets/riv/character_card/game_character_cards_demo.riv',
      dataBind: DataBind.auto(),
      layoutScaleFactor: 0.3,
    ),
    orientations: {
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    },
  ),
);

/// Feathering Coin Demo.
const featheringCoinConfig = DemoConfiguration(
  displayName: 'Feathering Coin',
  description: '''Create realistic shadows and depth using Vector Feathering.

Move your finger to see lighting and volume respond in real time.''',
  harness: RiveHarness(
    entryPoint: GenericRive(
      assetPath: 'assets/riv/feathering_coin/coin_demo_feathering.riv',
      layoutScaleFactor: 0.5,
    ),
  ),
);

/// Data Viz Demo.
const dataVizConfig = DemoConfiguration(
  displayName: 'Data Viz',
  description: '''
Explore animated charts and graphs that respond dynamically to changing data.

Tap the pie chart see it update in real time.''',
  harness: RiveHarness(
    entryPoint: DataViz(),
  ),
);

/// Ad Widget Demo.
final adWidgetConfig = DemoConfiguration(
  displayName: 'Ad Widget',
  description:
      'See how Rive can power engaging, interactive ads that go beyond static banners — from product showcases to rich experiences.',
  harness: RiveHarness(
    entryPoint: GenericRive(
      assetPath: 'assets/riv/ad_widget/amazon_ad-demo_2026.riv',
      dataBind: DataBind.auto(),
    ),
  ),
);

/// RTL Language Layout Demo.
final rtlLanguageLayoutConfig = DemoConfiguration(
  displayName: 'RTL Language Layout',
  description: '''
See how experiences can adapt across languages with dynamic font swapping and layout changes.''',
  harness: RiveHarness(
    useSafeArea: true,
    safeAreaLayouts: const {SafeAreaLayout.bottom},
    backgroundColor: const Color(0xFFCCCCCC),
    entryPoint: GenericRive(
      assetPath: 'assets/riv/rtl_language_layout/rtllanguagelayout.riv',
      dataBind: DataBind.auto(),
    ),
    orientations: {
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    },
  ),
);

/// Liquid Download Demo.
final liquidDownloadConfig = DemoConfiguration(
  displayName: 'Liquid Download',
  description: 'Set my description, please!',
  harness: RiveHarness(
    entryPoint: GenericRive(
      assetPath: 'assets/riv/liquid_download/liquid_download.riv',
      dataBind: DataBind.auto(),
      fit: Fit.contain,
    ),
  ),
);

/// Scrollytelling Demo.
final scrollytellingConfig = DemoConfiguration(
  displayName: 'Scrollytelling',
  description:
      'Explore an interactive storytelling experience built entirely in Rive, combining scrolling, animation, and user interaction into a seamless flow.',
  harness: RiveHarness(
    entryPoint: GenericRive(
      assetPath:
          'assets/riv/scrollytelling/scrolly-telling-vertical-responsive.riv',
      dataBind: DataBind.auto(),
    ),
  ),
);

/// Scrollytelling Raster Demo.
const scrollytellingRasterConfig = DemoConfiguration(
  displayName: 'Scrollytelling Raster',
  description: 'Set my description, please!',
  harness: RiveHarness(
    entryPoint: GenericRive(
      assetPath: 'assets/riv/scrollytelling_raster/scrolly-telling-raster.riv',
    ),
  ),
);

/// Car Widget Demo.
const carWidgetConfig = DemoConfiguration(
  displayName: 'Car Widget',
  description: 'Set my description, please!',
  harness: RiveHarness(
    entryPoint: GenericRive(
      assetPath: 'assets/riv/car_widget/car_widgets_v01.riv',
    ),
  ),
);

/// Fintech Demo.
final fintechConfig = DemoConfiguration(
  displayName: 'Fintech',
  description:
      'Explore a financial dashboard with cards displaying live market information and changing values.',
  harness: RiveHarness(
    entryPoint: GenericRive(
      assetPath: 'assets/riv/fintech/fintech_data_viz_v03.riv',
      dataBind: DataBind.auto(),
      layoutScaleFactor: 0.5,
    ),
  ),
);

/// Game Character Demo.
final gameCharacterConfig = DemoConfiguration(
  displayName: 'Game Character',
  description: 'Set my description, please!',
  harness: RiveHarness(
    entryPoint: GenericRive(
      assetPath: 'assets/riv/game_character/game_character_demo.riv',
      dataBind: DataBind.auto(),
      layoutScaleFactor: 0.5,
    ),
    orientations: {
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    },
  ),
);

/// Car Component Demo.
const carComponentConfig = DemoConfiguration(
  displayName: 'Car Component',
  description: 'Set my description, please!',
  harness: RiveHarness(
    entryPoint: GenericRive(
      assetPath: 'assets/riv/car_component/car_component_demo.riv',
    ),
  ),
);

/// Music Player Demo.
const musicPlayerConfig = DemoConfiguration(
  displayName: 'Music Player',
  description: 'Set my description, please!',
  harness: RiveHarness(
    entryPoint: GenericRive(
      assetPath: 'assets/riv/music_player/music_player.riv',
    ),
  ),
);

/// Slot Machine Demo.
final slotMachineConfig = DemoConfiguration(
  displayName: 'Slot Machine',
  description:
      'Play a fully interactive slot machine game built entirely inside Rive using scripting.',
  harness: RiveHarness(
    entryPoint: GenericRive(
      assetPath: 'assets/riv/slot_machine/slot_machine.riv',
      dataBind: DataBind.auto(),
    ),
    orientations: const {DeviceOrientation.portraitUp},
  ),
);

/// Inventory Demo.
const inventoryConfig = DemoConfiguration(
  displayName: 'Inventory',
  description: 'Set my description, please!',
  harness: RiveHarness(
    entryPoint: GenericRive(
      assetPath: 'assets/riv/inventory/inventory_demo_test_v2.riv',
    ),
  ),
);

/// Sports Broadcast Demo.
final sportsBroadcastConfig = DemoConfiguration(
  displayName: 'Sports Broadcast',
  description: '''
Create dynamic broadcast graphics where player information can update instantly, including images, names, team details, and colors.

Tap anywhere to swap players.''',
  harness: RiveHarness(
    entryPoint: GenericRive(
      assetPath: 'assets/riv/sports_broadcast/sports_broadcaat.riv',
      dataBind: DataBind.auto(),
    ),
  ),
);
