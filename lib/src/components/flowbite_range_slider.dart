// Copyright 2026 hanmajid (Muhammad Farhan Majid)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// This file contains code adapted and ported from the open-source
// Flowbite library (Copyright (c) Bergside Inc.), which is licensed
// under the MIT License.

import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

/// Range Slider component.
class FlowbiteRangeSlider extends StatelessWidget {
  /// The slider's values.
  final RangeValues values;

  /// The slider's minimum value.
  ///
  /// Defaults to 0.0.
  final double min;

  /// The slider's maximum value.
  ///
  /// Defaults to 1.0.
  final double max;

  /// The number of discrete divisions.
  ///
  /// Typically used with [labels] to show the current discrete values.
  /// If null, the slider is continuous.
  final int? divisions;

  /// The slider's on change callback.
  final ValueChanged<RangeValues>? onChanged;

  /// Constructor.
  const FlowbiteRangeSlider({
    required this.values,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 8.0,
          activeTrackColor: FlowbiteTheme.of(context).bgBrand,
          inactiveTrackColor: FlowbiteTheme.of(context).bgNeutralQuaternary,
          thumbColor: FlowbiteTheme.of(context).bgNeutralPrimaryMedium,
          overlayColor: FlowbiteTheme.of(context).borderBrand,
          thumbSize: const WidgetStatePropertyAll(Size(20.0, 20.0)),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 21.0 / 2),
        ),
        child: RangeSlider(
          padding: .zero,
          onChanged: onChanged,
          values: values,
          min: min,
          max: max,
          divisions: divisions,
        ),
      ),
    );
  }
}

/// Slider component.
class FlowbiteSlider extends StatelessWidget {
  /// The slider's value.
  final double value;

  /// The slider's minimum value.
  ///
  /// Defaults to 0.0.
  final double min;

  /// The slider's maximum value.
  ///
  /// Defaults to 1.0.
  final double max;

  /// The number of discrete divisions.
  ///
  /// Typically used with [labels] to show the current discrete values.
  /// If null, the slider is continuous.
  final int? divisions;

  /// The slider's on change callback.
  final ValueChanged<double>? onChanged;

  /// Constructor.
  const FlowbiteSlider({
    required this.value,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 8.0,
          activeTrackColor: FlowbiteTheme.of(context).bgBrand,
          inactiveTrackColor: FlowbiteTheme.of(context).bgNeutralQuaternary,
          thumbColor: FlowbiteTheme.of(context).bgNeutralPrimaryMedium,
          overlayColor: FlowbiteTheme.of(context).borderBrand,
          thumbSize: const WidgetStatePropertyAll(Size(20.0, 20.0)),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 21.0 / 2),
        ),
        child: Slider(
          padding: .zero,
          value: value,
          onChanged: onChanged,
          min: min,
          max: max,
          divisions: divisions,
        ),
      ),
    );
  }
}

/// Preview class for [FlowbiteSlider] and [FlowbiteRangeSlider].
///
/// Only used for documentation purpose.
class PreviewFlowbiteRangeSlider extends StatefulWidget {
  /// Constructor.
  const PreviewFlowbiteRangeSlider({super.key});

  @override
  State<PreviewFlowbiteRangeSlider> createState() =>
      _PreviewFlowbiteRangeSliderState();
}

class _PreviewFlowbiteRangeSliderState
    extends State<PreviewFlowbiteRangeSlider> {
  double _value = 0.3;
  RangeValues _values = const RangeValues(0.3, 0.5);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      padding: const .symmetric(vertical: 32.0),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 32.0,
        children: [
          FlowbiteSlider(
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
          FlowbiteRangeSlider(
            values: _values,
            onChanged: (value) {
              setState(() {
                _values = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

@FlowbitePreview(
  name: 'Range Slider - Light',
  group: 'Range Slider',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Range Slider - Dark',
  group: 'Range Slider',
  brightness: .dark,
)
/// Widget preview for [FlowbiteSlider] and [FlowbiteRangeSlider].
Widget previewFlowbiteRangeSlider() {
  return const PreviewFlowbiteRangeSlider();
}
