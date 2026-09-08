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

enum FlowbiteIconShapeSize { xl2, xl, lg, base, sm, xs }

enum FlowbiteIconShapeColor { green, red, brand, yellow, gray, dark, white }

enum FlowbiteIconShapeType { circle, square }

class FlowbiteIconShape extends StatelessWidget {
  const FlowbiteIconShape({
    required this.icon,
    this.size = FlowbiteIconShapeSize.base,
    this.color = FlowbiteIconShapeColor.brand,
    this.type = FlowbiteIconShapeType.circle,
    super.key,
  });

  final IconData icon;
  final FlowbiteIconShapeSize size;
  final FlowbiteIconShapeColor color;
  final FlowbiteIconShapeType type;

  double get _containerSize => switch (size) {
    FlowbiteIconShapeSize.xl2 => 96.0,
    FlowbiteIconShapeSize.xl => 64.0,
    FlowbiteIconShapeSize.lg => 48.0,
    FlowbiteIconShapeSize.base => 36.0,
    FlowbiteIconShapeSize.sm => 24.0,
    FlowbiteIconShapeSize.xs => 16.0,
  };

  double get _iconSize => switch (size) {
    FlowbiteIconShapeSize.xl2 => 56.0,
    FlowbiteIconShapeSize.xl => 36.0,
    FlowbiteIconShapeSize.lg => 28.0,
    FlowbiteIconShapeSize.base => 20.0,
    FlowbiteIconShapeSize.sm => 16.0,
    FlowbiteIconShapeSize.xs => 10.0,
  };
  double get _borderRadius => switch (type) {
    FlowbiteIconShapeType.circle => 9999.0,
    FlowbiteIconShapeType.square => 12.0,
  };

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      Theme.of(context).extension<FlowbiteColorsExtension>()!;

  Color _getIconColor(BuildContext context) {
    return switch (color) {
      FlowbiteIconShapeColor.green => _colorExt(context).textFgSuccessStrong,
      FlowbiteIconShapeColor.red => _colorExt(context).textFgDangerStrong,
      FlowbiteIconShapeColor.brand => _colorExt(context).textFgBrand,
      FlowbiteIconShapeColor.yellow => _colorExt(context).textFgWarning,
      FlowbiteIconShapeColor.gray => _colorExt(context).textBody,
      FlowbiteIconShapeColor.dark => _colorExt(context).textWhite,
      FlowbiteIconShapeColor.white => _colorExt(context).textBody,
    };
  }

  Color _getContainerColor(BuildContext context) {
    return switch (color) {
      FlowbiteIconShapeColor.green => _colorExt(context).bgSuccessSoft,
      FlowbiteIconShapeColor.red => _colorExt(context).bgDangerSoft,
      FlowbiteIconShapeColor.brand => _colorExt(context).bgBrandSofter,
      FlowbiteIconShapeColor.yellow => _colorExt(context).bgWarningSoft,
      FlowbiteIconShapeColor.gray => _colorExt(context).bgNeutralTertiary,
      FlowbiteIconShapeColor.dark => _colorExt(context).bgDark,
      FlowbiteIconShapeColor.white => _colorExt(context).bgNeutralPrimaryMedium,
    };
  }

  Border? _getContainerBorder(BuildContext context) {
    return switch (color) {
      FlowbiteIconShapeColor.white => Border.all(
        color: _colorExt(context).borderBaseMedium,
      ),
      _ => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_borderRadius),
          color: _getContainerColor(context),
          border: _getContainerBorder(context),
        ),
        alignment: Alignment.center,
        height: _containerSize,
        width: _containerSize,
        child: Icon(icon, size: _iconSize, color: _getIconColor(context)),
      ),
    );
  }
}
