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

import 'package:flowbite_icons/flowbite_outline_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

/// [FlowbiteIconShape]'s size variant.
enum FlowbiteIconShapeSize {
  /// Extra extra large size variant.
  xl2,

  /// Extra large size variant.
  xl,

  /// Large size variant.
  lg,

  /// Base/default size variant.
  base,

  /// Small size variant.
  sm,

  /// Extra small size variant.
  xs,
}

/// [FlowbiteIconShape]'s color variant.
enum FlowbiteIconShapeColor {
  /// Green color variant.
  green,

  /// Red color variant.
  red,

  /// Brand color variant.
  brand,

  /// Yellow color variant.
  yellow,

  /// Gray color variant.
  gray,

  /// Dark color variant.
  dark,

  /// White color variant.
  white,

  /// Disabled color variant.
  ///
  /// Used by [FlowbiteStepperNavLink].
  disabled,
}

/// [FlowbiteIconShape]'s type variant.
enum FlowbiteIconShapeType {
  /// Circle type variant.
  circle,

  /// Square type variant.
  square,
}

/// Icon Shape component.
class FlowbiteIconShape extends StatelessWidget {
  /// Constructor.
  const FlowbiteIconShape({
    required this.icon,
    this.size = .base,
    this.color = .brand,
    this.type = .circle,
    this.backgroundColor,
    super.key,
  });

  /// The icon data.
  final IconData icon;

  /// The icon shape's size.
  ///
  /// Defaults to [FlowbiteIconShapeSize.base].
  final FlowbiteIconShapeSize size;

  /// The icon shape's color.
  ///
  /// Defaults to [FlowbiteIconShapeColor.brand].
  final FlowbiteIconShapeColor color;

  /// The icon shape's type.
  ///
  /// Defaults to [FlowbiteIconShapeType.circle].
  final FlowbiteIconShapeType type;

  /// The icon shape's override background color.
  ///
  /// This is used by [FlowbiteRadioInputCard].
  final Color? backgroundColor;

  double get _containerSize => switch (size) {
    .xl2 => 96.0,
    .xl => 64.0,
    .lg => 48.0,
    .base => 36.0,
    .sm => 24.0,
    .xs => 16.0,
  };

  double get _iconSize => switch (size) {
    .xl2 => 56.0,
    .xl => 36.0,
    .lg => 28.0,
    .base => 20.0,
    .sm => 16.0,
    .xs => 10.0,
  };
  double get _borderRadius => switch (type) {
    .circle => 9999.0,
    .square => 12.0,
  };

  Color _getIconColor(BuildContext context) {
    return switch (color) {
      .green => FlowbiteTheme.of(context).textFgSuccessStrong,
      .red => FlowbiteTheme.of(context).textFgDangerStrong,
      .brand => FlowbiteTheme.of(context).textFgBrand,
      .yellow => FlowbiteTheme.of(context).textFgWarning,
      .gray => FlowbiteTheme.of(context).textBody,
      .dark => FlowbiteTheme.of(context).textWhite,
      .white => FlowbiteTheme.of(context).textBody,
      .disabled => FlowbiteTheme.of(context).textFgDisabled,
    };
  }

  Color _getContainerColor(BuildContext context) {
    return backgroundColor ??
        switch (color) {
          .green => FlowbiteTheme.of(context).bgSuccessSoft,
          .red => FlowbiteTheme.of(context).bgDangerSoft,
          .brand => FlowbiteTheme.of(context).bgBrandSofter,
          .yellow => FlowbiteTheme.of(context).bgWarningSoft,
          .gray => FlowbiteTheme.of(context).bgNeutralTertiary,
          .dark => FlowbiteTheme.of(context).bgDark,
          .white => FlowbiteTheme.of(context).bgNeutralPrimaryMedium,
          .disabled => FlowbiteTheme.of(context).bgNeutralTertiary,
        };
  }

  Border? _getContainerBorder(BuildContext context) {
    return switch (color) {
      .white => .all(color: FlowbiteTheme.of(context).borderBaseMedium),
      _ => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: .scaleDown,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: .circular(_borderRadius),
          color: _getContainerColor(context),
          border: _getContainerBorder(context),
        ),
        alignment: .center,
        height: _containerSize,
        width: _containerSize,
        child: Icon(icon, size: _iconSize, color: _getIconColor(context)),
      ),
    );
  }
}

@FlowbitePreview(
  name: 'Icon Shape - Light',
  group: 'Icon Shape',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Icon Shape - Dark',
  group: 'Icon Shape',
  brightness: .dark,
)
/// Widget preview for [FlowbiteIconShape].
Widget previewFlowbiteIconShape() {
  return Column(
    spacing: 12.0,
    children: FlowbiteIconShapeType.values
        .map(
          (type) => Row(
            spacing: 6.0,
            children: FlowbiteIconShapeColor.values
                .map(
                  (color) => Column(
                    spacing: 6.0,
                    children: FlowbiteIconShapeSize.values
                        .map(
                          (size) => FlowbiteIconShape(
                            icon: FlowbiteOutlineIcons.fire,
                            type: type,
                            color: color,
                            size: size,
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
        )
        .toList(),
  );
}
