# Contributions

Adding, updating, and polishing demos is welcomed to the project. Please see the instructions below.

## Add the assets

Under [assets/riv](assets/riv), create a new folder for your demo and add the necessary files.

```
- assets/
    - riv/
        - my_demo/
            - my_demo.riv
            - my_asset.png
            - ...
```

## pubspec.yaml

Add the asset path to the `pubspec.yaml` so that it can be used in the project.

```yaml
flutter:
  assets:
    # Place .riv files under assets/riv/my_demo_name/ and add the directory below:
    - assets/riv/avatar_creator/
    - assets/riv/duelist/
    - ...
    - assets/riv/my_demo/
```

Then run `flutter pub get` to update the list.

## Configurations

The list of runtime demos is stored under [lib/src/demos/configs.dart](lib/src/demos/configs.dart). It is made up of
`DemoConfiguration` models. Configs have some core properties:

- `displayName`: The name of the demo.
- `description`: The text to display below the name on the home screen.
- `harness`: The widget (typically a `RiveHarness`) that presents the Rive file.

After adding a demo configuration, add the config to the `demoConfigurations` list.

### Rive Harness

The harness provides extra functionality for the demo, so that it does not have to be manually implemented for each one.

- `entryPoint`: The widget that points to the actual demo widget.
- `showBackButton`: Whether we should add a back button to the screen or not.
- `backButtonPlatforms`: Which device platforms should see the back button.
- `backButtonLocation`: Where the back button should be positioned.
- `useSafeArea`: Whether we should add padding around the device cut-outs.
- `backgroundColor`: The background color to display behind the safe area.
- `safeAreaLayouts`: Which directions to consider the safe area to be.
- `orientations`: Which screen orientations the demo supports.

The `entryPoint` can be a dedicated widget that initializes and displays the rive file, but it can also be a
`GenericRive` if the Rive file is simple.

### Generic Rive

The `GenericRive` widget is typically set as the `entryPoint` for a `RiveHarness` for simple Rive files, such as:

- Files with no data-binding from the runtime.
- Files with self-contained interaction.
- Files with no external assets.

The configuration is simple:

- `assetPath`: The asset path to the Rive file (ex: 'assets/riv/my_demo/my_demo.riv').
- `artboardName`: The name of the artboard to choose.
- `stateMachineName`: The name of the state machine to choose.
- `fit`: The Rive fit to use.
- `layoutScaleFactor`: The scale factor to use, if desired.
- `dataBind`: The data binding configuration to use (ex: auto, none, etc.).

# Example

- Add `assets/riv/my_demo/my_demo.riv`.
- Edit `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/riv/my_demo/
```

- Run `flutter pub get`.
- Edit `configs.yaml`:

```dart

final myDemoConfig = DemoConfiguration(
  displayName: 'My Demo',
  description: 'Set my description, please!',
  harness: RiveHarness(
    entryPoint: GenericRive(
      assetPath: 'assets/riv/my_demo/my_demo.riv',
      dataBind: DataBind.auto(),
    ),
  ),
);
// ...
final demoConfigurations = <DemoConfiguration>[
  myDemoConfig,
];

```

- Run application.
