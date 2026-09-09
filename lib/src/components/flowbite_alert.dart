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

enum FlowbiteAlertColor { success, danger, warning, info, normal }

enum FlowbiteAlertType { normal, complex, small, borderTop }

class FlowbiteAlert extends StatelessWidget {
  const FlowbiteAlert({
    required this.text,
    this.color = FlowbiteAlertColor.normal,
    this.type = FlowbiteAlertType.normal,
    this.heading,
    this.child,
    this.onTapClose,
    this.onTap,
    super.key,
  });

  final String text;
  final FlowbiteAlertColor color;
  final FlowbiteAlertType type;
  final String? heading;
  final Widget? child;
  final VoidCallback? onTapClose;
  final VoidCallback? onTap;

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      Theme.of(context).extension<FlowbiteColorsExtension>() ??
      FlowbiteTheme.lightThemeColors;

  Color _getTextColor(BuildContext context) {
    return switch (color) {
      FlowbiteAlertColor.success => _colorExt(context).textFgSuccessStrong,
      FlowbiteAlertColor.danger => _colorExt(context).textFgDangerStrong,
      FlowbiteAlertColor.warning => _colorExt(context).textFgDangerStrong,
      FlowbiteAlertColor.info => _colorExt(context).textFgBrandStrong,
      FlowbiteAlertColor.normal => _colorExt(context).textHeading,
    };
  }

  Color _getBackgroundColor(BuildContext context) {
    return switch (color) {
      FlowbiteAlertColor.success => _colorExt(context).bgSuccessSoft,
      FlowbiteAlertColor.danger => _colorExt(context).bgDangerSoft,
      FlowbiteAlertColor.warning => _colorExt(context).bgWarningSoft,
      FlowbiteAlertColor.info => _colorExt(context).bgBrandSofter,
      FlowbiteAlertColor.normal => _colorExt(context).bgNeutralSecondaryMedium,
    };
  }

  Color _getBorderColor(BuildContext context) {
    return switch (color) {
      FlowbiteAlertColor.success => _colorExt(context).borderSuccessSubtle,
      FlowbiteAlertColor.danger => _colorExt(context).borderDangerSubtle,
      FlowbiteAlertColor.warning => _colorExt(context).borderWarningSubtle,
      FlowbiteAlertColor.info => _colorExt(context).borderBrandSubtle,
      FlowbiteAlertColor.normal => _colorExt(context).borderBaseMedium,
    };
  }

  factory FlowbiteAlert.borderTop({
    required String text,
    FlowbiteAlertColor color = FlowbiteAlertColor.normal,
    VoidCallback? onTapClose,
  }) {
    return FlowbiteAlert(
      text: text,
      type: FlowbiteAlertType.borderTop,
      color: color,
      onTapClose: onTapClose,
    );
  }

  factory FlowbiteAlert.small({
    required String text,
    required String badgeText,
    FlowbiteAlertColor color = FlowbiteAlertColor.normal,
    VoidCallback? onTapClose,
    VoidCallback? onTap,
  }) {
    return FlowbiteAlert(
      text: text,
      type: FlowbiteAlertType.small,
      color: color,
      onTapClose: onTapClose,
      onTap: onTap,
      child: _FlowbiteAlertBadge(text: badgeText, color: color),
    );
  }

  factory FlowbiteAlert.complex({
    required String heading,
    required String text,
    required String buttonLabel,
    VoidCallback? onPressedButton,
    Widget? leadingIcon,
    Widget? trailingIcon,
    FlowbiteAlertColor color = FlowbiteAlertColor.normal,
    VoidCallback? onTapClose,
  }) {
    FlowbiteButtonColor buttonColor = switch (color) {
      FlowbiteAlertColor.success => FlowbiteButtonColor.success,
      FlowbiteAlertColor.danger => FlowbiteButtonColor.danger,
      FlowbiteAlertColor.warning => FlowbiteButtonColor.warning,
      FlowbiteAlertColor.info => FlowbiteButtonColor.brand,
      FlowbiteAlertColor.normal => FlowbiteButtonColor.dark,
    };

    return FlowbiteAlert(
      text: text,
      heading: heading,
      type: FlowbiteAlertType.complex,
      color: color,
      onTapClose: onTapClose,
      child: FlowbiteButton.icon(
        onPressed: onPressedButton,
        label: Text(buttonLabel),
        leadingIcon: leadingIcon,
        trailingIcon: trailingIcon,
        color: buttonColor,
        size: FlowbiteButtonSize.xs,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (type == FlowbiteAlertType.normal) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: _getBackgroundColor(context),
          border: Border.all(
            color: _getBorderColor(context),
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: _buildAlertContent(context),
      );
    } else if (type == FlowbiteAlertType.complex) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: _getBackgroundColor(context),
          border: Border.all(
            color: _getBorderColor(context),
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16.0,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              spacing: 8.0,
              children: [
                Row(
                  spacing: 8.0,
                  children: [
                    Icon(
                      FlowbiteOutlineIcons.info,
                      size: 16.0,
                      color: _getTextColor(context),
                    ),
                    Expanded(
                      child: Text(
                        heading!,
                        style: FlowbiteFontFamily.inter(
                          fontSize: FlowbiteFontSize.textBase.value,
                          fontWeight: FlowbiteFontWeight.medium.value,
                          color: _getTextColor(context),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: onTapClose,
                      child: Icon(
                        FlowbiteOutlineIcons.x,
                        size: 16.0,
                        color: _getTextColor(context),
                      ),
                    ),
                  ],
                ),
                Text(
                  text,
                  style: FlowbiteFontFamily.inter(
                    fontSize: FlowbiteFontSize.textSm.value,
                    fontWeight: FlowbiteFontWeight.normal.value,
                    color: _getTextColor(context),
                  ),
                ),
              ],
            ),
            if (child != null) Row(children: [child!]),
          ],
        ),
      );
    } else if (type == FlowbiteAlertType.small) {
      return Material(
        borderRadius: BorderRadius.circular(9999),
        color: _getBackgroundColor(context),
        child: InkWell(
          borderRadius: BorderRadius.circular(9999),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9999),
              border: Border.all(
                color: _getBorderColor(context),
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
            ),
            padding: const EdgeInsets.only(
              top: 4.0,
              bottom: 4.0,
              right: 8.0,
              left: 4.0,
            ),
            child: Row(
              spacing: 8.0,
              mainAxisSize: MainAxisSize.min,
              children: [
                child!,
                Flexible(
                  child: Row(
                    spacing: 2.0,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          text,
                          // maxLines: 1,
                          // overflow: TextOverflow.ellipsis,
                          style: FlowbiteFontFamily.inter(
                            fontSize: FlowbiteFontSize.textSm.value,
                            fontWeight: FlowbiteFontWeight.normal.value,
                            color: _getTextColor(context),
                          ),
                        ),
                      ),
                      Icon(
                        FlowbiteOutlineIcons.angle_right,
                        size: 16.0,
                        color: _getTextColor(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        border: Border(
          top: BorderSide(color: _getBorderColor(context), width: 4.0),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: _buildAlertContent(context),
    );
  }

  Widget? _buildAlertContent(BuildContext context) {
    return Row(
      spacing: 8.0,
      children: [
        Icon(
          FlowbiteOutlineIcons.info,
          size: 16.0,
          color: _getTextColor(context),
        ),
        Expanded(
          child: Text(
            text,
            style: FlowbiteFontFamily.inter(
              fontSize: FlowbiteFontSize.textSm.value,
              fontWeight: FlowbiteFontWeight.normal.value,
              color: _getTextColor(context),
            ),
          ),
        ),
        InkWell(
          onTap: onTapClose,
          child: Icon(
            FlowbiteOutlineIcons.x,
            size: 16.0,
            color: _getTextColor(context),
          ),
        ),
      ],
    );
  }
}

class _FlowbiteAlertBadge extends StatelessWidget {
  final String text;
  final FlowbiteAlertColor color;

  const new({required this.text, required this.color});

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      Theme.of(context).extension<FlowbiteColorsExtension>() ??
      FlowbiteTheme.lightThemeColors;

  Color _getTextColor(BuildContext context) {
    return switch (color) {
      FlowbiteAlertColor.success => _colorExt(context).textFgSuccessStrong,
      FlowbiteAlertColor.danger => _colorExt(context).textFgDangerStrong,
      FlowbiteAlertColor.warning => _colorExt(context).textFgDangerStrong,
      FlowbiteAlertColor.info => _colorExt(context).textFgBrandStrong,
      FlowbiteAlertColor.normal => _colorExt(context).textHeading,
    };
  }

  Color _getBackgroundColor(BuildContext context) {
    return switch (color) {
      FlowbiteAlertColor.success => _colorExt(context).bgSuccessMedium,
      FlowbiteAlertColor.danger => _colorExt(context).bgDangerMedium,
      FlowbiteAlertColor.warning => _colorExt(context).bgWarningMedium,
      FlowbiteAlertColor.info => _colorExt(context).bgBrandSoft,
      FlowbiteAlertColor.normal => _colorExt(context).bgNeutralQuaternary,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Text(
        text,
        style: FlowbiteFontFamily.inter(
          fontSize: FlowbiteFontSize.textXs.value,
          fontWeight: FlowbiteFontWeight.medium.value,
          color: _getTextColor(context),
        ),
      ),
    );
  }
}

@FlowbitePreview(
  name: 'Alert - Light',
  group: 'Alert',
  brightness: Brightness.light,
)
@FlowbitePreview(
  name: 'Alert - Dark',
  group: 'Alert',
  brightness: Brightness.dark,
)
Widget previewFlowbiteAlert() {
  return SizedBox(
    width: 360.0,
    child: Column(
      spacing: 12.0,
      mainAxisSize: MainAxisSize.min,
      children: [
        // type=normal
        Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 6.0,
          children: FlowbiteAlertColor.values
              .map(
                (color) => FlowbiteAlert(
                  text: "Great job! You've acknowledged this significant alert message.",
                  color: color,
                ),
              )
              .toList(),
        ),
        // type=complex
        Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 6.0,
          children: FlowbiteAlertColor.values
              .map(
                (color) => FlowbiteAlert.complex(
                  heading: 'Alert heading',
                  text: "Great job! You've acknowledged this significant alert message.",
                  onTapClose: () {},
                  buttonLabel: 'Learn more',
                  leadingIcon: const Icon(FlowbiteOutlineIcons.open_book),
                  onPressedButton: () {},
                  color: color,
                ),
              )
              .toList(),
        ),
        // type=small
        Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 6.0,
          children: FlowbiteAlertColor.values
              .map(
                (color) => FlowbiteAlert.small(
                  text: "Great job! You've acknowledged this significant alert message.",
                  badgeText: 'New',
                  onTapClose: () {},
                  onTap: () {},
                  color: color,
                ),
              )
              .toList(),
        ),
        // type=borderTop
        Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 6.0,
          children: FlowbiteAlertColor.values
              .map(
                (color) => FlowbiteAlert.borderTop(
                  text: "Great job! You've acknowledged this significant alert message.",
                  onTapClose: () {},
                  color: color,
                ),
              )
              .toList(),
        ),
      ],
    ),
  );
}
