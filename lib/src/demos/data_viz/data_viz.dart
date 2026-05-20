import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

/// The Rive widget for the DataViz file.
class DataViz extends StatefulWidget {
  /// Creates a new [DataViz].
  const DataViz({super.key});

  @override
  State<DataViz> createState() => _DataVizState();
}

class _DataVizState extends State<DataViz> {
  late final _fileLoader = FileLoader.fromAsset(
    'assets/riv/data_viz/data_viz_demo_v2.riv',
    riveFactory: Factory.rive,
  );

  /// Create random slices for the percentages.
  _SliceDistribution _generateSliceDistribution({
    int sliceCount = 6,
    int minTotal = 100,
    int maxTotal = 1000,
    double minSlicePercent = 8,
  }) {
    final random = Random();
    final total = minTotal + random.nextInt(maxTotal - minTotal + 1);
    final minSliceValue = (total * minSlicePercent / 100).ceil();
    final values = <int>[];
    var remainingTotal = total;

    for (var i = 0; i < sliceCount - 1; i++) {
      final remainingSlices = sliceCount - i;
      final maxSliceValue =
          remainingTotal - (remainingSlices - 1) * minSliceValue;
      final nextValue =
          minSliceValue + random.nextInt(maxSliceValue - minSliceValue + 1);
      values.add(nextValue);
      remainingTotal -= nextValue;
    }

    values.add(remainingTotal);
    return _SliceDistribution(total: total, values: values);
  }

  @override
  void dispose() {
    _fileLoader.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RiveWidgetBuilder(
      fileLoader: _fileLoader,
      dataBind: DataBind.auto(),
      artboardSelector: ArtboardSelector.byName('Main'),
      builder: (context, state) {
        if (state is! RiveLoaded) {
          return const Center(child: CircularProgressIndicator());
        }

        final vmi = state.viewModelInstance!;
        vmi.trigger('autoAnimate')!.addListener((value) {
          final distribution = _generateSliceDistribution();

          for (var i = 0; i < distribution.values.length; i++) {
            final value = distribution.values[i].toDouble();
            final percentage = value / distribution.total * 100;
            final itemIndex = i + 1;
            vmi.number('item$itemIndex/value')!.value = value;
            vmi.number('item$itemIndex/percentage')!.value = percentage;
          }
        });

        return RiveWidget(
          controller: state.controller,
          fit: Fit.layout,
        );
      },
    );
  }
}

class _SliceDistribution {
  const _SliceDistribution({required this.total, required this.values});

  final int total;
  final List<int> values;
}
