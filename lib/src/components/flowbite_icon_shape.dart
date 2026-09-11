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

enum FlowbiteIconShapeSize { xl2, xl, lg, base, sm, xs }

enum FlowbiteIconShapeColor { green, red, brand, yellow, gray, dark, white }

enum FlowbiteIconShapeType { circle, square }

class FlowbiteIconShape extends StatelessWidget {
  const FlowbiteIconShape({
    required this.icon,
    this.size = .base,
    this.color = .brand,
    this.type = .circle,
    super.key,
  });

  final IconData icon;
  final FlowbiteIconShapeSize size;
  final FlowbiteIconShapeColor color;
  final FlowbiteIconShapeType type;

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

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      FlowbiteTheme.extension(context);

  Color _getIconColor(BuildContext context) {
    return switch (color) {
      .green => _colorExt(context).textFgSuccessStrong,
      .red => _colorExt(context).textFgDangerStrong,
      .brand => _colorExt(context).textFgBrand,
      .yellow => _colorExt(context).textFgWarning,
      .gray => _colorExt(context).textBody,
      .dark => _colorExt(context).textWhite,
      .white => _colorExt(context).textBody,
    };
  }

  Color _getContainerColor(BuildContext context) {
    return switch (color) {
      .green => _colorExt(context).bgSuccessSoft,
      .red => _colorExt(context).bgDangerSoft,
      .brand => _colorExt(context).bgBrandSofter,
      .yellow => _colorExt(context).bgWarningSoft,
      .gray => _colorExt(context).bgNeutralTertiary,
      .dark => _colorExt(context).bgDark,
      .white => _colorExt(context).bgNeutralPrimaryMedium,
    };
  }

  Border? _getContainerBorder(BuildContext context) {
    return switch (color) {
      .white => .all(color: _colorExt(context).borderBaseMedium),
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
