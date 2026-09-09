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

import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';

enum FlowbiteBadgeTheme { gray, white, brand, danger, warning, success }

enum FlowbiteBadgeSize { sm, lg }

class FlowbiteBadge extends StatelessWidget {
  const FlowbiteBadge({
    required this.child,
    this.theme = FlowbiteBadgeTheme.brand,
    this.size = FlowbiteBadgeSize.sm,
    this.onTap,
    super.key,
  });

  final Widget child;
  final FlowbiteBadgeTheme theme;
  final FlowbiteBadgeSize size;
  final VoidCallback? onTap;

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      Theme.of(context).extension<FlowbiteColorsExtension>() ??
      FlowbiteTheme.lightThemeColors;

  double get _height => switch (size) {
    FlowbiteBadgeSize.sm => 20.0,
    FlowbiteBadgeSize.lg => 24.0,
  };

  double get _horizontalPadding => switch (size) {
    FlowbiteBadgeSize.sm => 4.0,
    FlowbiteBadgeSize.lg => 6.0,
  };

  Color _getBackgroundColor(BuildContext context) {
    return switch (theme) {
      FlowbiteBadgeTheme.gray => _colorExt(context).bgNeutralSecondary,
      FlowbiteBadgeTheme.white => _colorExt(context).bgNeutralPrimarySoft,
      FlowbiteBadgeTheme.brand => _colorExt(context).bgBrandSofter,
      FlowbiteBadgeTheme.danger => _colorExt(context).bgDangerSoft,
      FlowbiteBadgeTheme.warning => _colorExt(context).bgWarningSoft,
      FlowbiteBadgeTheme.success => _colorExt(context).bgSuccessSoft,
    };
  }

  Color _getBorderColor(BuildContext context) {
    return switch (theme) {
      FlowbiteBadgeTheme.gray => _colorExt(context).borderBaseMedium,
      FlowbiteBadgeTheme.white => _colorExt(context).borderBase,
      FlowbiteBadgeTheme.brand => _colorExt(context).borderBrandSubtle,
      FlowbiteBadgeTheme.danger => _colorExt(context).borderDangerSubtle,
      FlowbiteBadgeTheme.warning => _colorExt(context).borderWarningSubtle,
      FlowbiteBadgeTheme.success => _colorExt(context).borderSuccessSubtle,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _getBackgroundColor(context),
      borderRadius: BorderRadius.circular(6.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(
              color: _getBorderColor(context),
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
          height: _height,
          alignment: Alignment.center,
          padding: EdgeInsetsGeometry.symmetric(horizontal: _horizontalPadding),
          child: child,
        ),
      ),
    );
  }

  factory FlowbiteBadge.icon({
    required String text,
    required IconData icon,
    FlowbiteBadgeTheme theme = FlowbiteBadgeTheme.brand,
    FlowbiteBadgeSize size = FlowbiteBadgeSize.sm,
    VoidCallback? onTap,
  }) {
    double iconSize = switch (size) {
      FlowbiteBadgeSize.sm => 12.0,
      FlowbiteBadgeSize.lg => 14.0,
    };
    return FlowbiteBadge(
      theme: theme,
      size: size,
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4.0,
        children: [
          _FlowbiteBadgeIcon(icon: icon, size: iconSize, theme: theme),
          _FlowbiteBadgeText(text: text, size: size, theme: theme),
          _FlowbiteBadgeIcon(
            icon: FlowbiteOutlineIcons.x,
            size: iconSize,
            theme: theme,
          ),
        ],
      ),
    );
  }
}

class _FlowbiteBadgeIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final FlowbiteBadgeTheme theme;

  const new({required this.icon, required this.size, required this.theme});

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      Theme.of(context).extension<FlowbiteColorsExtension>() ??
      FlowbiteTheme.lightThemeColors;

  Color _getColor(BuildContext context) {
    return switch (theme) {
      FlowbiteBadgeTheme.gray => _colorExt(context).textHeading,
      FlowbiteBadgeTheme.white => _colorExt(context).textHeading,
      FlowbiteBadgeTheme.brand => _colorExt(context).textFgBrandStrong,
      FlowbiteBadgeTheme.danger => _colorExt(context).textFgDangerStrong,
      FlowbiteBadgeTheme.warning => _colorExt(context).textFgWarning,
      FlowbiteBadgeTheme.success => _colorExt(context).bgSuccessStrong,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: size, color: _getColor(context));
  }
}

class _FlowbiteBadgeText extends StatelessWidget {
  final String text;
  final FlowbiteBadgeSize size;
  final FlowbiteBadgeTheme theme;

  const new({required this.text, required this.size, required this.theme});

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      Theme.of(context).extension<FlowbiteColorsExtension>() ??
      FlowbiteTheme.lightThemeColors;

  Color _getColor(BuildContext context) {
    return switch (theme) {
      FlowbiteBadgeTheme.gray => _colorExt(context).textHeading,
      FlowbiteBadgeTheme.white => _colorExt(context).textHeading,
      FlowbiteBadgeTheme.brand => _colorExt(context).textFgBrandStrong,
      FlowbiteBadgeTheme.danger => _colorExt(context).textFgDangerStrong,
      FlowbiteBadgeTheme.warning => _colorExt(context).textFgWarning,
      FlowbiteBadgeTheme.success => _colorExt(context).bgSuccessStrong,
    };
  }

  FlowbiteFontSize get fontSize => switch (size) {
    FlowbiteBadgeSize.sm => FlowbiteFontSize.textXs,
    FlowbiteBadgeSize.lg => FlowbiteFontSize.textSm,
  };

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: FlowbiteFontFamily.inter(
        fontSize: fontSize.value,
        fontWeight: FlowbiteFontWeight.medium.value,
        color: _getColor(context),
      ),
    );
  }
}

@FlowbitePreview(
  name: 'Badge - Light',
  group: 'Badge',
  brightness: Brightness.light,
)
@FlowbitePreview(
  name: 'Badge - Dark',
  group: 'Badge',
  brightness: Brightness.dark,
)
Widget previewFlowbiteBadge() {
  return Row(
    spacing: 6.0,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: FlowbiteBadgeSize.values
        .map(
          (size) => Column(
            spacing: 6.0,
            children: FlowbiteBadgeTheme.values
                .map(
                  (theme) => FlowbiteBadge.icon(
                    text: 'Badge text',
                    icon: FlowbiteOutlineIcons.clock,
                    theme: theme,
                    size: size,
                  ),
                )
                .toList(),
          ),
        )
        .toList(),
  );
}
