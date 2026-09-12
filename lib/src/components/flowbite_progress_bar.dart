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

/// [FlowbiteProgressBar] color variant.
enum FlowbiteProgressBarColor {
  /// Primary color variant.
  primary,

  /// Gray color variant.
  gray,

  /// Dark color variant.
  dark,

  /// Success color variant.
  success,

  /// Danger color variant.
  danger,

  /// Warning color variant.
  warning,
}

/// [FlowbiteProgressBar] size variant.
enum FlowbiteProgressBarSize {
  /// Base size variant.
  base,

  /// Large size variant.
  lg,
}

/// [FlowbiteProgressBar] label position variant.
enum FlowbiteProgressBarLabelPosition {
  /// Top label position variant.
  top,

  /// Side label position variant.
  side,

  /// Bottom label position variant.
  bottom,
}

/// Progress Bar component.
class FlowbiteProgressBar extends StatelessWidget {
  /// The progress bar's size.
  ///
  /// Defaults to [FlowbiteProgressBarSize.base].
  final FlowbiteProgressBarSize size;

  /// The progress bar's color.
  ///
  /// Defaults to [FlowbiteProgressBarColor.primary].
  final FlowbiteProgressBarColor color;

  /// The progress bar's label position.
  ///
  /// Defaults to [FlowbiteProgressBarLabelPosition.top].
  final FlowbiteProgressBarLabelPosition labelPosition;

  /// The progress bar's value.
  final double? value;

  /// The progress bar's start label.
  final String? startLabel;

  /// The progress bar's end label.
  final String? endLabel;

  /// Constructor.
  const FlowbiteProgressBar({
    this.startLabel,
    this.endLabel,
    this.value,
    this.size = .base,
    this.color = .primary,
    this.labelPosition = .top,
    super.key,
  });

  double get _height => switch (size) {
    .base => 6.0,
    .lg => 10.0,
  };

  Color _getColor(BuildContext context) => switch (color) {
    .primary => FlowbiteTheme.extension(context).bgBrand,
    .gray => FlowbiteTheme.extension(context).bgGray,
    .dark => FlowbiteTheme.extension(context).bgDark,
    .success => FlowbiteTheme.extension(context).bgSuccess,
    .danger => FlowbiteTheme.extension(context).bgDanger,
    .warning => FlowbiteTheme.extension(context).bgWarning,
  };

  @override
  Widget build(BuildContext context) {
    if (labelPosition == .top || labelPosition == .bottom) {
      Widget? labels;
      if (startLabel != null || endLabel != null) {
        labels = Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            if (startLabel != null)
              Text(
                startLabel!,
                style: FlowbiteFontFamily.inter(
                  fontSize: .textXs,
                  fontWeight: .medium,
                  color: FlowbiteTheme.extension(context).textBody,
                ),
              ),
            if (endLabel != null)
              Text(
                endLabel!,
                style: FlowbiteFontFamily.inter(
                  fontSize: .textXs,
                  fontWeight: .medium,
                  color: FlowbiteTheme.extension(context).textBody,
                ),
              ),
          ],
        );
      }
      return Column(
        spacing: 6.0,
        children: [
          if (labelPosition == .top) ?labels,
          LinearProgressIndicator(
            minHeight: _height,
            value: value,
            color: _getColor(context),
            backgroundColor: FlowbiteTheme.extension(context)
                .bgNeutralQuaternary,
            borderRadius: BorderRadius.circular(12.0),
          ),
          if (labelPosition == .bottom) ?labels,
        ],
      );
    }
    return Row(
      spacing: 6.0,
      children: [
        if (startLabel != null)
          Text(
            startLabel!,
            style: FlowbiteFontFamily.inter(
              fontSize: .textXs,
              fontWeight: .medium,
              color: FlowbiteTheme.extension(context).textBody,
            ),
          ),
        Expanded(
          child: LinearProgressIndicator(
            minHeight: _height,
            value: value,
            color: _getColor(context),
            backgroundColor: FlowbiteTheme.extension(context)
                .bgNeutralQuaternary,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        if (endLabel != null)
          Text(
            endLabel!,
            style: FlowbiteFontFamily.inter(
              fontSize: .textXs,
              fontWeight: .medium,
              color: FlowbiteTheme.extension(context).textBody,
            ),
          ),
      ],
    );
  }
}

/// Preview class for [FlowbiteProgressBar].
///
/// Only used for documentation purpose.
class PreviewFlowbiteProgressBar extends StatelessWidget {
  /// Constructor.
  const PreviewFlowbiteProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.0,
      child: Column(
        crossAxisAlignment: .start,
        spacing: 32.0,
        children: FlowbiteProgressBarSize.values
            .map(
              (size) => Column(
                crossAxisAlignment: .start,
                spacing: 16.0,
                children: FlowbiteProgressBarColor.values
                    .map(
                      (color) => Column(
                        crossAxisAlignment: .start,
                        spacing: 8.0,
                        children: FlowbiteProgressBarLabelPosition.values
                            .map(
                              (labelPosition) => FlowbiteProgressBar(
                                startLabel: '100%',
                                endLabel: '100%',
                                size: size,
                                color: color,
                                labelPosition: labelPosition,
                                value: 0.5,
                              ),
                            )
                            .toList(),
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(),
      ),
    );
  }
}

@FlowbitePreview(
  name: 'Progress Bar - Light',
  group: 'Progress Bar',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Progress Bar - Dark',
  group: 'Progress Bar',
  brightness: .dark,
)
/// Widget preview for [FlowbiteToast].
Widget previewFlowbiteProgressBar() {
  return const PreviewFlowbiteProgressBar();
}
