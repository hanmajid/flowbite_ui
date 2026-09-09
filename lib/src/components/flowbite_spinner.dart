// Copyright 2026 hanmajid (Muhammad Farhan Majid)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';

enum FlowbiteSpinnerSize { xs, small, medium, base, large }

class FlowbiteSpinner extends StatelessWidget {
  final FlowbiteSpinnerSize size;
  final bool showTrack;
  final double? value;

  /// Used by [FlowbiteBadge.spinner] method.
  final FlowbiteBadgeTheme badgeTheme;

  const FlowbiteSpinner({
    this.value,
    this.size = FlowbiteSpinnerSize.base,
    this.showTrack = true,
    this.badgeTheme = .gray,
    super.key,
  });

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      Theme.of(context).extension<FlowbiteColorsExtension>() ??
      FlowbiteTheme.lightThemeColors;

  double get _size => switch (size) {
    FlowbiteSpinnerSize.xs => 12.0,
    FlowbiteSpinnerSize.small => 24.0,
    FlowbiteSpinnerSize.medium => 50.0,
    FlowbiteSpinnerSize.base => 75.0,
    FlowbiteSpinnerSize.large => 100.0,
  };
  double get _strokeWidth => switch (size) {
    FlowbiteSpinnerSize.xs => _size / 2 * 0.3,
    FlowbiteSpinnerSize.small => _size / 2 * 0.3,
    FlowbiteSpinnerSize.medium => _size / 2 * 0.1816,
    FlowbiteSpinnerSize.base => _size / 2 * 0.1816,
    FlowbiteSpinnerSize.large => _size / 2 * 0.1816,
  };
  Color _getColor(BuildContext context) => switch (badgeTheme) {
    .gray => _colorExt(context).bgBrand,
    .white => _colorExt(context).bgBrand,
    .brand => _colorExt(context).bgBrand,
    .danger => _colorExt(context).bgDanger,
    .warning => _colorExt(context).bgWarning,
    .success => _colorExt(context).bgSuccess,
  };

  Color _getTrackColor(BuildContext context) => switch (badgeTheme) {
    .gray => _colorExt(context).bgNeutralQuaternary,
    .white => _colorExt(context).bgNeutralQuaternary,
    .brand => _colorExt(context).bgBrandSoft,
    .danger => _colorExt(context).bgDangerMedium,
    .warning => _colorExt(context).bgWarningMedium,
    .success => _colorExt(context).bgSuccessMedium,
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _size,
      width: _size,
      child: CircularProgressIndicator(
        value: value,
        color: _getColor(context),
        backgroundColor: showTrack ? _getTrackColor(context) : null,
        strokeWidth: _strokeWidth,
        strokeCap: StrokeCap.round,
      ),
    );
  }
}

@FlowbitePreview(
  name: 'Spinner - Light',
  group: 'Spinner',
  brightness: Brightness.light,
)
@FlowbitePreview(
  name: 'Spinner - Dark',
  group: 'Spinner',
  brightness: Brightness.dark,
)
Widget previewFlowbiteSpinner() {
  return Column(
    spacing: 24.0,
    children: [
      // value!=null && showTrack=true
      Row(
        spacing: 12.0,
        children: FlowbiteSpinnerSize.values
            .map((size) => FlowbiteSpinner(size: size, value: 0.3))
            .toList(),
      ),
      // value!=null && showTrack=false
      Row(
        spacing: 12.0,
        children: FlowbiteSpinnerSize.values
            .map(
              (size) =>
                  FlowbiteSpinner(size: size, showTrack: false, value: 0.3),
            )
            .toList(),
      ),
      // value==null && showTrack=true
      Row(
        spacing: 12.0,
        children: FlowbiteSpinnerSize.values
            .map((size) => FlowbiteSpinner(size: size))
            .toList(),
      ),
      // value==null && showTrack=false
      Row(
        spacing: 12.0,
        children: FlowbiteSpinnerSize.values
            .map((size) => FlowbiteSpinner(size: size, showTrack: false))
            .toList(),
      ),
    ],
  );
}
