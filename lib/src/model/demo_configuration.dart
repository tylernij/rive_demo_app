import 'package:flutter/material.dart';
import 'package:rive_demo_app/src/screens/rive_harness/rive_harness.dart';

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
