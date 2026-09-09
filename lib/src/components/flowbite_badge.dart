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
    this.theme = .brand,
    this.size = .sm,
    this.onTap,
    this.isCircle = false,
    super.key,
  });

  final Widget child;
  final FlowbiteBadgeTheme theme;
  final FlowbiteBadgeSize size;
  final VoidCallback? onTap;
  final bool isCircle;

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      Theme.of(context).extension<FlowbiteColorsExtension>() ??
      FlowbiteTheme.lightThemeColors;

  double get _height => switch (size) {
    .sm => 20.0,
    .lg => 24.0,
  };

  double get _horizontalPadding => switch (size) {
    .sm => 4.0,
    .lg => 6.0,
  };

  Color _getBackgroundColor(BuildContext context) {
    return switch (theme) {
      .gray => _colorExt(context).bgNeutralSecondary,
      .white => _colorExt(context).bgNeutralPrimarySoft,
      .brand => _colorExt(context).bgBrandSofter,
      .danger => _colorExt(context).bgDangerSoft,
      .warning => _colorExt(context).bgWarningSoft,
      .success => _colorExt(context).bgSuccessSoft,
    };
  }

  Color _getBorderColor(BuildContext context) {
    return switch (theme) {
      .gray => _colorExt(context).borderBaseMedium,
      .white => _colorExt(context).borderBase,
      .brand => _colorExt(context).borderBrandSubtle,
      .danger => _colorExt(context).borderDangerSubtle,
      .warning => _colorExt(context).borderWarningSubtle,
      .success => _colorExt(context).borderSuccessSubtle,
    };
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = .circular(isCircle ? 9999.0 : 6.0);
    return Material(
      color: _getBackgroundColor(context),
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: .all(
              color: _getBorderColor(context),
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
          height: _height,
          width: isCircle ? _height : null,
          alignment: .center,
          padding: isCircle ? null : .symmetric(horizontal: _horizontalPadding),
          child: child,
        ),
      ),
    );
  }

  factory FlowbiteBadge.icon({
    required String text,
    required IconData icon,
    String? secondaryText,
    FlowbiteBadgeTheme theme = .brand,
    FlowbiteBadgeSize size = .sm,
    VoidCallback? onTap,
  }) {
    double iconSize = switch (size) {
      .sm => 12.0,
      .lg => 14.0,
    };
    double horizontalSpacing = switch (size) {
      .sm => 4.0,
      .lg => 6.0,
    };
    return FlowbiteBadge(
      theme: theme,
      size: size,
      onTap: onTap,
      child: Row(
        mainAxisSize: .min,
        spacing: horizontalSpacing,
        children: [
          _FlowbiteBadgeIcon(icon: icon, size: iconSize, theme: theme),
          _FlowbiteBadgeText(
            text: text,
            secondaryText: secondaryText,
            size: size,
            theme: theme,
          ),
          _FlowbiteBadgeIcon(
            icon: FlowbiteOutlineIcons.x,
            size: iconSize,
            theme: theme,
          ),
        ],
      ),
    );
  }

  factory FlowbiteBadge.dot({
    required String text,
    FlowbiteBadgeTheme theme = .brand,
    FlowbiteBadgeSize size = .sm,
    VoidCallback? onTap,
  }) {
    double iconSize = switch (size) {
      .sm => 12.0,
      .lg => 14.0,
    };
    double horizontalSpacing = switch (size) {
      .sm => 4.0,
      .lg => 6.0,
    };
    return FlowbiteBadge(
      theme: theme,
      size: size,
      onTap: onTap,
      child: Row(
        mainAxisSize: .min,
        spacing: horizontalSpacing,
        children: [
          _FlowbiteBadgeDot(theme: theme),
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

  factory FlowbiteBadge.avatar({
    required String text,
    required FlowbiteAvatar avatar,
    FlowbiteBadgeTheme theme = .brand,
    FlowbiteBadgeSize size = .sm,
    VoidCallback? onTap,
  }) {
    double iconSize = switch (size) {
      .sm => 12.0,
      .lg => 14.0,
    };
    double horizontalSpacing = switch (size) {
      .sm => 4.0,
      .lg => 6.0,
    };
    return FlowbiteBadge(
      theme: theme,
      size: size,
      onTap: onTap,
      child: Row(
        mainAxisSize: .min,
        spacing: horizontalSpacing,
        children: [
          FlowbiteAvatar(
            size: .xs,
            image: avatar.image,
            placeholder: avatar.placeholder,
          ),
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

  factory FlowbiteBadge.spinner({
    required String text,
    required FlowbiteSpinner spinner,
    FlowbiteBadgeTheme theme = .brand,
    FlowbiteBadgeSize size = .sm,
    VoidCallback? onTap,
  }) {
    double iconSize = switch (size) {
      .sm => 12.0,
      .lg => 14.0,
    };
    double horizontalSpacing = switch (size) {
      .sm => 4.0,
      .lg => 6.0,
    };
    return FlowbiteBadge(
      theme: theme,
      size: size,
      onTap: onTap,
      child: Row(
        mainAxisSize: .min,
        spacing: horizontalSpacing,
        children: [
          FlowbiteSpinner(size: .xs, value: spinner.value, badgeTheme: theme),
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

  factory FlowbiteBadge.iconOnly({
    required IconData icon,
    FlowbiteBadgeTheme theme = .brand,
    FlowbiteBadgeSize size = .sm,
    VoidCallback? onTap,
  }) {
    double iconSize = switch (size) {
      .sm => 12.0,
      .lg => 14.0,
    };
    return FlowbiteBadge(
      theme: theme,
      size: size,
      onTap: onTap,
      isCircle: true,
      child: _FlowbiteBadgeIcon(icon: icon, size: iconSize, theme: theme),
    );
  }

  factory FlowbiteBadge.textOnly({
    required String text,
    FlowbiteBadgeTheme theme = .brand,
    FlowbiteBadgeSize size = .sm,
    VoidCallback? onTap,
  }) {
    return FlowbiteBadge(
      theme: theme,
      size: size,
      onTap: onTap,
      isCircle: true,
      child: _FlowbiteBadgeText(
        text: text,
        size: size,
        theme: theme,
        fontSize: .textXs,
      ),
    );
  }
}

class _FlowbiteBadgeDot extends StatelessWidget {
  final FlowbiteBadgeTheme theme;

  const new({required this.theme});

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      Theme.of(context).extension<FlowbiteColorsExtension>() ??
      FlowbiteTheme.lightThemeColors;

  Color _getColor(BuildContext context) {
    return switch (theme) {
      .gray => _colorExt(context).textHeading,
      .white => _colorExt(context).textHeading,
      .brand => _colorExt(context).textFgBrandStrong,
      .danger => _colorExt(context).textFgDangerStrong,
      .warning => _colorExt(context).textFgWarning,
      .success => _colorExt(context).textFgSuccessStrong,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: .scaleDown,
      child: Container(
        height: 6.0,
        width: 6.0,
        decoration: BoxDecoration(color: _getColor(context), shape: .circle),
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
      .gray => _colorExt(context).textHeading,
      .white => _colorExt(context).textHeading,
      .brand => _colorExt(context).textFgBrandStrong,
      .danger => _colorExt(context).textFgDangerStrong,
      .warning => _colorExt(context).textFgWarning,
      .success => _colorExt(context).textFgSuccessStrong,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: size, color: _getColor(context));
  }
}

class _FlowbiteBadgeText extends StatelessWidget {
  final String text;
  final String? secondaryText;
  final FlowbiteBadgeSize size;
  final FlowbiteBadgeTheme theme;
  final FlowbiteFontSize? fontSize;

  const new({
    required this.text,
    required this.size,
    required this.theme,
    this.secondaryText,
    this.fontSize,
  });

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      Theme.of(context).extension<FlowbiteColorsExtension>() ??
      FlowbiteTheme.lightThemeColors;

  Color _getTextColor(BuildContext context) {
    return switch (theme) {
      .gray => _colorExt(context).textHeading,
      .white => _colorExt(context).textHeading,
      .brand => _colorExt(context).textFgBrandStrong,
      .danger => _colorExt(context).textFgDangerStrong,
      .warning => _colorExt(context).textFgWarning,
      .success => _colorExt(context).textFgSuccessStrong,
    };
  }

  Color _getSecondaryTextColor(BuildContext context) {
    return switch (theme) {
      .gray => _colorExt(context).textBody,
      .white => _colorExt(context).textBody,
      .brand => _colorExt(context).textFgBrandStrong,
      .danger => _colorExt(context).textFgDangerStrong,
      .warning => _colorExt(context).textFgWarning,
      .success => _colorExt(context).textFgSuccessStrong,
    };
  }

  Color _getBorderColor(BuildContext context) {
    return switch (theme) {
      .gray => _colorExt(context).borderBaseMedium,
      .white => _colorExt(context).borderBase,
      .brand => _colorExt(context).borderBrandSubtle,
      .danger => _colorExt(context).borderDangerSubtle,
      .warning => _colorExt(context).borderWarningSubtle,
      .success => _colorExt(context).borderSuccessSubtle,
    };
  }

  FlowbiteFontSize get _fontSize => switch (size) {
    .sm => .textXs,
    .lg => .textSm,
  };

  FlowbiteFontWeight get _secondaryFontWeight => switch (size) {
    .sm => .normal,
    .lg => .medium,
  };

  double get _horizontalSpacing => switch (size) {
    .sm => 6.0,
    .lg => 8.0,
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: _horizontalSpacing,
      mainAxisAlignment: .center,
      children: [
        Text(
          text,
          style: FlowbiteFontFamily.inter(
            fontSize: fontSize ?? _fontSize,
            fontWeight: .medium,
            color: _getTextColor(context),
          ),
        ),
        if (secondaryText != null) ...[
          Container(height: 12.0, width: 1.0, color: _getBorderColor(context)),
          Text(
            secondaryText!,
            style: FlowbiteFontFamily.inter(
              fontSize: fontSize ?? _fontSize,
              fontWeight: _secondaryFontWeight,
              color: _getSecondaryTextColor(context),
            ),
          ),
        ],
      ],
    );
  }
}

@FlowbitePreview(name: 'Badge - Light', group: 'Badge', brightness: .light)
@FlowbitePreview(name: 'Badge - Dark', group: 'Badge', brightness: .dark)
Widget previewFlowbiteBadge() {
  return Column(
    spacing: 18.0,
    crossAxisAlignment: .start,
    children: [
      // With icon
      Column(
        spacing: 6.0,
        crossAxisAlignment: .start,
        children: FlowbiteBadgeSize.values
            .map(
              (size) => Row(
                spacing: 6.0,
                mainAxisSize: .min,
                children: FlowbiteBadgeTheme.values
                    .map(
                      (theme) => FlowbiteBadge.icon(
                        text: 'Badge text',
                        icon: FlowbiteOutlineIcons.clock,
                        theme: theme,
                        size: size,
                        onTap: () {},
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(),
      ),
      // With avatar
      Column(
        spacing: 6.0,
        crossAxisAlignment: .start,
        children: FlowbiteBadgeSize.values
            .map(
              (size) => Row(
                spacing: 6.0,
                mainAxisSize: .min,
                children: FlowbiteBadgeTheme.values
                    .map(
                      (theme) => FlowbiteBadge.avatar(
                        text: 'Badge text',
                        avatar: FlowbiteAvatar(
                          image: FlowbiteAvatarDefaultAssets.bonnieGreen
                              .toAssetImage(),
                        ),
                        theme: theme,
                        size: size,
                        onTap: () {},
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(),
      ),
      // With dot
      Column(
        spacing: 6.0,
        crossAxisAlignment: .start,
        children: FlowbiteBadgeSize.values
            .map(
              (size) => Row(
                spacing: 6.0,
                mainAxisSize: .min,
                children: FlowbiteBadgeTheme.values
                    .map(
                      (theme) => FlowbiteBadge.dot(
                        text: 'Badge text',
                        theme: theme,
                        size: size,
                        onTap: () {},
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(),
      ),
      // With spinner
      Column(
        spacing: 6.0,
        crossAxisAlignment: .start,
        children: FlowbiteBadgeSize.values
            .map(
              (size) => Row(
                spacing: 6.0,
                mainAxisSize: .min,
                children: FlowbiteBadgeTheme.values
                    .map(
                      (theme) => FlowbiteBadge.spinner(
                        text: 'Badge text',
                        spinner: const FlowbiteSpinner(value: 0.3),
                        theme: theme,
                        size: size,
                        onTap: () {},
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(),
      ),
      // With icon + secondary text
      Column(
        spacing: 6.0,
        crossAxisAlignment: .start,
        children: FlowbiteBadgeSize.values
            .map(
              (size) => Row(
                spacing: 6.0,
                mainAxisSize: .min,
                children: FlowbiteBadgeTheme.values
                    .map(
                      (theme) => FlowbiteBadge.icon(
                        text: 'Badge text',
                        secondaryText: 'Secondary text',
                        icon: FlowbiteOutlineIcons.clock,
                        theme: theme,
                        size: size,
                        onTap: () {},
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(),
      ),
      // Icon only
      Column(
        spacing: 6.0,
        crossAxisAlignment: .start,
        children: FlowbiteBadgeSize.values
            .map(
              (size) => Row(
                spacing: 6.0,
                mainAxisSize: .min,
                children: FlowbiteBadgeTheme.values
                    .map(
                      (theme) => FlowbiteBadge.iconOnly(
                        icon: FlowbiteOutlineIcons.clock,
                        theme: theme,
                        size: size,
                        onTap: () {},
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(),
      ),
      // Text only
      Column(
        spacing: 6.0,
        crossAxisAlignment: .start,
        children: FlowbiteBadgeSize.values
            .map(
              (size) => Row(
                spacing: 6.0,
                mainAxisSize: .min,
                children: FlowbiteBadgeTheme.values
                    .map(
                      (theme) => FlowbiteBadge.textOnly(
                        text: '1',
                        theme: theme,
                        size: size,
                        onTap: () {},
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(),
      ),
    ],
  );
}
