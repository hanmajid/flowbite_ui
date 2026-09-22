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

/// [FlowbiteToggleSwitch]'s size variant.
enum FlowbiteToggleSwitchSize {
  /// Base/default size variant.
  base,

  /// Large size variant.
  lg,
}

/// Toggle Switch component.
class FlowbiteToggleSwitch extends StatefulWidget {
  /// The switch's size.
  ///
  /// Defaults to [FlowbiteToggleSwitchSize.base].
  final FlowbiteToggleSwitchSize size;

  /// Whether the switch is checked.
  ///
  /// Defaults to false.
  final bool isChecked;

  /// The switch's on change callback.
  final ValueChanged<bool>? onChanged;

  /// The switch's animation duration.
  ///
  /// Defaults to 100 ms.
  final Duration duration;

  /// Constructor.
  const FlowbiteToggleSwitch({
    this.isChecked = false,
    this.size = .base,
    this.duration = const Duration(milliseconds: 100),
    this.onChanged,
    super.key,
  });

  @override
  State<FlowbiteToggleSwitch> createState() => _FlowbiteToggleSwitchState();
}

class _FlowbiteToggleSwitchState extends State<FlowbiteToggleSwitch> {
  bool get _isDisabled => widget.onChanged == null;
  bool _isFocused = false;

  double get _height => switch (widget.size) {
    .base => 20.0,
    .lg => 24.0,
  };

  double get _width => switch (widget.size) {
    .base => 36.0,
    .lg => 44.0,
  };

  double get _thumbSize => switch (widget.size) {
    .base => 16.0,
    .lg => 20.0,
  };

  double get _activeOffset => switch (widget.size) {
    .base => 18.0,
    .lg => 21.0,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: .circular(9999.0),
        boxShadow: _isFocused
            ? [
                BoxShadow(
                  color: FlowbiteColors.bgBrandMedium,
                  spreadRadius: 2.0,
                  blurRadius: 0.0,
                  offset: const Offset(0.0, 0.0),
                ),
              ]
            : null,
      ),
      child: Material(
        color: _isDisabled
            ? FlowbiteTheme.of(context).bgNeutralTertiaryMedium
            : (widget.isChecked
                  ? FlowbiteTheme.of(context).bgBrand
                  : FlowbiteTheme.of(context).bgNeutralTertiaryMedium),
        borderRadius: .circular(9999.0),
        child: InkWell(
          onTap: widget.onChanged != null
              ? () {
                  widget.onChanged!(!widget.isChecked);
                }
              : null,
          borderRadius: .circular(9999.0),
          onFocusChange: (value) {
            setState(() {
              _isFocused = value;
            });
          },
          child: AnimatedContainer(
            duration: widget.duration,
            height: _height,
            width: _width,
            decoration: BoxDecoration(
              border: .all(
                color: _isDisabled
                    ? FlowbiteTheme.of(context).borderLightMedium
                    : (widget.isChecked
                          ? FlowbiteTheme.of(context).borderBrandLight
                          : FlowbiteTheme.of(context).borderBaseStrong),
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              borderRadius: .circular(9999.0),
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: widget.duration,
                  left: widget.isChecked ? _activeOffset : 2.0,
                  top: 2.0,
                  child: Container(
                    height: _thumbSize,
                    width: _thumbSize,
                    decoration: BoxDecoration(
                      borderRadius: .circular(40.0),
                      color: _isDisabled
                          ? FlowbiteTheme.of(context).bgNeutralSecondarySoft
                          : FlowbiteTheme.of(context).bgWhite,
                      boxShadow: [
                        BoxShadow(
                          color: FlowbiteColors.slate.shade800.withValues(
                            alpha: 0.02,
                          ),
                          spreadRadius: 0.05,
                          blurRadius: 0.5,
                          offset: const Offset(0.0, 1.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Preview class for [FlowbiteToggleSwitch].
///
/// Only used for documentation purpose.
class PreviewFlowbiteToggleSwitch extends StatefulWidget {
  /// Constructor.
  const PreviewFlowbiteToggleSwitch({super.key});

  @override
  State<PreviewFlowbiteToggleSwitch> createState() =>
      _PreviewFlowbiteToggleSwitchState();
}

class _PreviewFlowbiteToggleSwitchState
    extends State<PreviewFlowbiteToggleSwitch> {
  bool _isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.0,
      mainAxisSize: .min,
      children: FlowbiteToggleSwitchSize.values
          .map(
            (size) => Column(
              spacing: 6.0,
              children: [
                FlowbiteToggleSwitch(size: size, onChanged: (value) {}),
                FlowbiteToggleSwitch(
                  size: size,
                  isChecked: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value;
                    });
                  },
                ),
                FlowbiteToggleSwitch(size: size, isChecked: _isChecked),
              ],
            ),
          )
          .toList(),
    );
  }
}

@FlowbitePreview(
  name: 'Toggle Switch - Light',
  group: 'Toggle Switch',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Toggle Switch - Dark',
  group: 'Toggle Switch',
  brightness: .dark,
)
/// Widget preview for [FlowbiteToggleSwitch].
Widget previewFlowbiteToggleSwitch() => const PreviewFlowbiteToggleSwitch();
