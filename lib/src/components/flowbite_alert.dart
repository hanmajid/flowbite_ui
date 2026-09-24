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

import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

/// [FlowbiteAlert]'s color variant.
enum FlowbiteAlertColor {
  /// Success color variant.
  success,

  /// Danger color variant.
  danger,

  /// Warning color variant.
  warning,

  /// Info color variant.
  info,

  /// Normal/default color variant.
  normal,
}

/// [FlowbiteAlert]'s type variant.
enum FlowbiteAlertType {
  /// Normal/default type variant.
  normal,

  /// Complex type variant.
  complex,

  /// Small type variant.
  small,

  /// Border Top type variant.
  borderTop,
}

/// Alert component.
class FlowbiteAlert extends StatelessWidget {
  /// Constructor.
  const FlowbiteAlert({
    required this.text,
    this.color = .normal,
    this.type = .normal,
    this.heading,
    this.child,
    this.onTapClose,
    this.onTap,
    super.key,
  });

  /// The alert's text.
  final String text;

  /// The alert's color.
  ///
  /// Defaults to [FlowbiteAlertColor.normal].
  final FlowbiteAlertColor color;

  /// The alert's type.
  ///
  /// Defaults to [FlowbiteAlertType.normal].
  final FlowbiteAlertType type;

  /// The alert's heading.
  ///
  /// Used in complex type variant.
  final String? heading;

  /// The alert's child widget.
  final Widget? child;

  /// The alert close button's tap callback.
  final VoidCallback? onTapClose;

  /// The alert's tap callback.
  ///
  /// Used in small type variant.
  final VoidCallback? onTap;

  Color _getTextColor(BuildContext context) {
    return switch (color) {
      .success => FlowbiteTheme.of(context).textFgSuccessStrong,
      .danger => FlowbiteTheme.of(context).textFgDangerStrong,
      .warning => FlowbiteTheme.of(context).textFgDangerStrong,
      .info => FlowbiteTheme.of(context).textFgBrandStrong,
      .normal => FlowbiteTheme.of(context).textHeading,
    };
  }

  Color _getBackgroundColor(BuildContext context) {
    return switch (color) {
      .success => FlowbiteTheme.of(context).bgSuccessSoft,
      .danger => FlowbiteTheme.of(context).bgDangerSoft,
      .warning => FlowbiteTheme.of(context).bgWarningSoft,
      .info => FlowbiteTheme.of(context).bgBrandSofter,
      .normal => FlowbiteTheme.of(context).bgNeutralSecondaryMedium,
    };
  }

  Color _getBorderColor(BuildContext context) {
    return switch (color) {
      .success => FlowbiteTheme.of(context).borderSuccessSubtle,
      .danger => FlowbiteTheme.of(context).borderDangerSubtle,
      .warning => FlowbiteTheme.of(context).borderWarningSubtle,
      .info => FlowbiteTheme.of(context).borderBrandSubtle,
      .normal => FlowbiteTheme.of(context).borderBaseMedium,
    };
  }

  /// Factory constructor for [FlowbiteAlert] with border top variant.
  factory FlowbiteAlert.borderTop({
    required String text,
    FlowbiteAlertColor color = .normal,
    VoidCallback? onTapClose,
  }) {
    return FlowbiteAlert(
      text: text,
      type: .borderTop,
      color: color,
      onTapClose: onTapClose,
    );
  }

  /// Factory constructor for [FlowbiteAlert] with small variant.
  factory FlowbiteAlert.small({
    required String text,
    required String badgeText,
    FlowbiteAlertColor color = .normal,
    VoidCallback? onTapClose,
    VoidCallback? onTap,
  }) {
    return FlowbiteAlert(
      text: text,
      type: .small,
      color: color,
      onTapClose: onTapClose,
      onTap: onTap,
      child: _FlowbiteAlertBadge(text: badgeText, color: color),
    );
  }

  /// Factory constructor for [FlowbiteAlert] with complex variant.
  factory FlowbiteAlert.complex({
    required String heading,
    required String text,
    required String buttonLabel,
    VoidCallback? onPressedButton,
    Widget? leadingIcon,
    Widget? trailingIcon,
    FlowbiteAlertColor color = .normal,
    VoidCallback? onTapClose,
  }) {
    FlowbiteButtonColor buttonColor = switch (color) {
      .success => .success,
      .danger => .danger,
      .warning => .warning,
      .info => .brand,
      .normal => .dark,
    };

    return FlowbiteAlert(
      text: text,
      heading: heading,
      type: .complex,
      color: color,
      onTapClose: onTapClose,
      child: FlowbiteButton.icon(
        onPressed: onPressedButton,
        label: Text(buttonLabel),
        leadingIcon: leadingIcon,
        trailingIcon: trailingIcon,
        color: buttonColor,
        size: .xs,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (type == .normal) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: .circular(12.0),
          color: _getBackgroundColor(context),
          border: .all(
            color: _getBorderColor(context),
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
        ),
        padding: const .all(16.0),
        child: _buildAlertContent(context),
      );
    } else if (type == .complex) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: .circular(12.0),
          color: _getBackgroundColor(context),
          border: .all(
            color: _getBorderColor(context),
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
        ),
        padding: const .all(16.0),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .stretch,
          spacing: 16.0,
          children: [
            Column(
              crossAxisAlignment: .stretch,
              mainAxisSize: .min,
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
                          fontSize: .textBase,
                          fontWeight: .medium,
                          color: _getTextColor(context),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: onTapClose,
                        child: Icon(
                          FlowbiteOutlineIcons.x,
                          size: 16.0,
                          color: _getTextColor(context),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  text,
                  style: FlowbiteFontFamily.inter(
                    fontSize: .textSm,
                    fontWeight: .normal,
                    color: _getTextColor(context),
                  ),
                ),
              ],
            ),
            if (child != null) Row(children: [child!]),
          ],
        ),
      );
    } else if (type == .small) {
      return Material(
        borderRadius: .circular(9999),
        color: _getBackgroundColor(context),
        child: InkWell(
          borderRadius: .circular(9999),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: .circular(9999),
              border: .all(
                color: _getBorderColor(context),
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
            ),
            padding: const .only(top: 4.0, bottom: 4.0, right: 8.0, left: 4.0),
            child: Row(
              spacing: 8.0,
              mainAxisSize: .min,
              children: [
                child!,
                Flexible(
                  child: Row(
                    spacing: 2.0,
                    mainAxisSize: .min,
                    children: [
                      Flexible(
                        child: Text(
                          text,
                          // maxLines: 1,
                          // overflow: .ellipsis,
                          style: FlowbiteFontFamily.inter(
                            fontSize: .textSm,
                            fontWeight: .normal,
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
      padding: const .all(16.0),
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
              fontSize: .textSm,
              fontWeight: .normal,
              color: _getTextColor(context),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTapClose,
            child: Icon(
              FlowbiteOutlineIcons.x,
              size: 16.0,
              color: _getTextColor(context),
            ),
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

  Color _getTextColor(BuildContext context) {
    return switch (color) {
      .success => FlowbiteTheme.of(context).textFgSuccessStrong,
      .danger => FlowbiteTheme.of(context).textFgDangerStrong,
      .warning => FlowbiteTheme.of(context).textFgDangerStrong,
      .info => FlowbiteTheme.of(context).textFgBrandStrong,
      .normal => FlowbiteTheme.of(context).textHeading,
    };
  }

  Color _getBackgroundColor(BuildContext context) {
    return switch (color) {
      .success => FlowbiteTheme.of(context).bgSuccessMedium,
      .danger => FlowbiteTheme.of(context).bgDangerMedium,
      .warning => FlowbiteTheme.of(context).bgWarningMedium,
      .info => FlowbiteTheme.of(context).bgBrandSoft,
      .normal => FlowbiteTheme.of(context).bgNeutralQuaternary,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      alignment: .center,
      padding: const .symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        borderRadius: .circular(9999),
      ),
      child: Text(
        text,
        style: FlowbiteFontFamily.inter(
          fontSize: .textXs,
          fontWeight: .medium,
          color: _getTextColor(context),
        ),
      ),
    );
  }
}

@FlowbitePreview(name: 'Alert - Light', group: 'Alert', brightness: .light)
@FlowbitePreview(name: 'Alert - Dark', group: 'Alert', brightness: .dark)
/// Widget preview for [FlowbiteAlert].
Widget previewFlowbiteAlert() {
  return SizedBox(
    width: 360.0,
    child: Column(
      spacing: 12.0,
      mainAxisSize: .min,
      children: [
        // type=normal
        Column(
          mainAxisSize: .min,
          spacing: 6.0,
          children: FlowbiteAlertColor.values
              .map(
                (color) => FlowbiteAlert(
                  text: '''Great job! You've acknowledged this significant alert message.''',
                  color: color,
                ),
              )
              .toList(),
        ),
        // type=complex
        Column(
          mainAxisSize: .min,
          spacing: 6.0,
          children: FlowbiteAlertColor.values
              .map(
                (color) => FlowbiteAlert.complex(
                  heading: 'Alert heading',
                  text: '''Great job! You've acknowledged this significant alert message.''',
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
          mainAxisSize: .min,
          spacing: 6.0,
          children: FlowbiteAlertColor.values
              .map(
                (color) => FlowbiteAlert.small(
                  text: '''Great job! You've acknowledged this significant alert message.''',
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
          mainAxisSize: .min,
          spacing: 6.0,
          children: FlowbiteAlertColor.values
              .map(
                (color) => FlowbiteAlert.borderTop(
                  text: '''Great job! You've acknowledged this significant alert message.''',
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
