import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:rive_demo_app/src/screens/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Rive.
  await RiveNative.init();

  // Fullscreen mode.
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const RiveDemoApp());
}

/// App entry point.
class RiveDemoApp extends StatelessWidget {
  /// Creates a new [RiveDemoApp].
  const RiveDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rive Demo App',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.blue),
      ),
      home: const HomeScreen(),
    );
  }
}
