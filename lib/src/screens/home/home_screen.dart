import 'package:flutter/material.dart';
import 'package:rive_demo_app/src/demos/demo_configurations.dart';
import 'package:rive_demo_app/src/screens/rive_harness/rive_harness.dart';

/// The home screen displaying the demo list.
class HomeScreen extends StatefulWidget {
  /// Creates a new [HomeScreen].
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _showDemo(DemoConfiguration config) async {
    await Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => config.harness,
      ),
    );
  }

  Widget _demoListItem(DemoConfiguration config) {
    return ListTile(
      title: Text(config.displayName),
      onTap: () async => _showDemo(config),
    );
  }

  @override
  Widget build(BuildContext context) {
    final demoListItems = demoConfigurations.map(_demoListItem).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Picker'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => demoListItems[index],
        separatorBuilder: (_, _) => const Divider(),
        itemCount: demoListItems.length,
      ),
    );
  }
}
