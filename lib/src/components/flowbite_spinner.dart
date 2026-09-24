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

/// [FlowbiteSpinner]'s size variant.
enum FlowbiteSpinnerSize {
  /// Extra small size variant.
  xs,

  /// Small size variant.
  small,

  /// Medium size variant.
  medium,

  /// Base/default size variant.
  base,

  /// Large size variant.
  large,
}

/// Spinner component.
class FlowbiteSpinner extends StatelessWidget {
  /// The spinner's size.
  ///
  /// Defaults to [FlowbiteSpinnerSize.base].
  final FlowbiteSpinnerSize size;

  /// Whether to show the spinner's track.
  ///
  /// Defaults to true.
  final bool showTrack;

  /// The spinner's value.
  final double? value;

  /// Used by [FlowbiteBadge.spinner] method.
  final FlowbiteBadgeTheme badgeTheme;

  /// Constructor.
  const FlowbiteSpinner({
    this.value,
    this.size = .base,
    this.showTrack = true,
    this.badgeTheme = .gray,
    super.key,
  });

  double get _size => switch (size) {
    .xs => 12.0,
    .small => 24.0,
    .medium => 50.0,
    .base => 75.0,
    .large => 100.0,
  };
  double get _strokeWidth => switch (size) {
    .xs => _size / 2 * 0.3,
    .small => _size / 2 * 0.3,
    .medium => _size / 2 * 0.1816,
    .base => _size / 2 * 0.1816,
    .large => _size / 2 * 0.1816,
  };
  Color _getColor(BuildContext context) => switch (badgeTheme) {
    .gray => FlowbiteTheme.of(context).bgBrand,
    .white => FlowbiteTheme.of(context).bgBrand,
    .brand => FlowbiteTheme.of(context).bgBrand,
    .danger => FlowbiteTheme.of(context).bgDanger,
    .warning => FlowbiteTheme.of(context).bgWarning,
    .success => FlowbiteTheme.of(context).bgSuccess,
  };

  Color _getTrackColor(BuildContext context) => switch (badgeTheme) {
    .gray => FlowbiteTheme.of(context).bgNeutralQuaternary,
    .white => FlowbiteTheme.of(context).bgNeutralQuaternary,
    .brand => FlowbiteTheme.of(context).bgBrandSoft,
    .danger => FlowbiteTheme.of(context).bgDangerMedium,
    .warning => FlowbiteTheme.of(context).bgWarningMedium,
    .success => FlowbiteTheme.of(context).bgSuccessMedium,
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
        strokeCap: .round,
      ),
    );
  }
}

@FlowbitePreview(name: 'Spinner - Light', group: 'Spinner', brightness: .light)
@FlowbitePreview(name: 'Spinner - Dark', group: 'Spinner', brightness: .dark)
/// Widget preview for [FlowbiteSpinner].
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
