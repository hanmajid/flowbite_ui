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

/// [FlowbiteStepperNavLink]'s type variant.
enum FlowbiteStepperNavLinkType {
  /// The default/normal type variant
  normal,

  /// Icon shape type variant
  iconShape,

  /// Icon shape & text type variant
  iconShapeText,

  /// Card alert type variant
  cardAlert,
}

/// [FlowbiteStepperNavLink]'s state variant.
enum FlowbiteStepperNavLinkState {
  /// The default/inactive state variant.
  inactive,

  /// Active state variant.
  active,

  /// Completed state variant.
  completed,

  /// Error state variant.
  error,

  /// Disabled state variant.
  disabled,
}

/// [FlowbiteStepperNavLink]'s item model.
class FlowbiteStepperNavLinkItem {
  /// The link's label.
  final String? label;

  /// The link's subtitle.
  final String? subtitle;

  /// The link's number.
  final int? number;

  /// The link's icon.
  final IconData? icon;

  /// The link's state.
  ///
  /// Defaults to [FlowbiteStepperNavLinkState.inactive].
  final FlowbiteStepperNavLinkState state;

  /// Constructor.
  new({
    this.label,
    this.subtitle,
    this.number,
    this.icon,
    this.state = .inactive,
  });
}

/// Stepper Nav Link component.
class FlowbiteStepperNavLink extends StatelessWidget {
  /// The link's type.
  ///
  /// Defaults to [FlowbiteStepperNavLinkType.normal].
  final FlowbiteStepperNavLinkType type;

  /// The link's item.
  final FlowbiteStepperNavLinkItem item;

  /// The link's font size override.
  final FlowbiteFontSize? fontSize;

  /// The link's tap callback.
  final VoidCallback? onTap;

  /// Constructor.
  const FlowbiteStepperNavLink({
    required this.item,
    this.type = .normal,
    this.onTap,
    this.fontSize,
    super.key,
  });

  Color _getTextColor(BuildContext context) => switch (item.state) {
    .inactive => FlowbiteTheme.of(context).textBody,
    .active =>
      type == .cardAlert
          ? FlowbiteTheme.of(context).textFgBrandStrong
          : FlowbiteTheme.of(context).textFgBrand,
    .completed =>
      type == .cardAlert
          ? FlowbiteTheme.of(context).textFgBrandStrong
          : FlowbiteTheme.of(context).textFgBrand,
    .error =>
      type == .cardAlert
          ? FlowbiteTheme.of(context).textFgDangerStrong
          : FlowbiteTheme.of(context).textFgDanger,
    .disabled => FlowbiteTheme.of(context).textFgDisabled,
  };

  Color _getBorderColor(BuildContext context) => switch (item.state) {
    .inactive => FlowbiteTheme.of(context).borderBaseStrong,
    .active => FlowbiteTheme.of(context).borderBrand,
    .completed => FlowbiteTheme.of(context).borderBrand,
    .error => FlowbiteTheme.of(context).borderDanger,
    .disabled => FlowbiteTheme.of(context).borderBase,
  };

  Color _getCardBorderColor(BuildContext context) => switch (item.state) {
    .inactive => FlowbiteTheme.of(context).borderBaseMedium,
    .active => FlowbiteTheme.of(context).borderBrandSubtle,
    .completed => FlowbiteTheme.of(context).borderBrandSubtle,
    .error => FlowbiteTheme.of(context).borderDangerSubtle,
    .disabled => FlowbiteTheme.of(context).borderBase,
  };

  Color _getCardBackgroundColor(BuildContext context) => switch (item.state) {
    .inactive => FlowbiteTheme.of(context).bgNeutralSecondaryMedium,
    .active => FlowbiteTheme.of(context).bgBrandSofter,
    .completed => FlowbiteTheme.of(context).bgBrandSofter,
    .error => FlowbiteTheme.of(context).bgDangerSoft,
    .disabled => FlowbiteTheme.of(context).bgNeutralSecondarySoft,
  };

  FlowbiteIconShapeColor get _iconShapeColor => switch (item.state) {
    .inactive => .gray,
    .active => .brand,
    .completed => .brand,
    .error => .red,
    .disabled => .disabled,
  };

  @override
  Widget build(BuildContext context) {
    if (type == .iconShape) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: item.state != .disabled ? onTap : null,
          child: _buildIconShape(context, size: .lg),
        ),
      );
    } else if (type == .iconShapeText) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: item.state != .disabled ? onTap : null,
          child: Row(
            spacing: 12.0,
            mainAxisSize: .min,
            children: [
              _buildIconShape(context, size: .base),
              Column(
                crossAxisAlignment: .start,
                spacing: 2.0,
                children: [
                  Text(
                    item.label ?? '',
                    style: FlowbiteFontFamily.inter(
                      fontWeight: .medium,
                      fontSize: fontSize ?? .textBase,
                      color: _getTextColor(context),
                    ),
                  ),
                  if (item.subtitle != null)
                    Text(
                      item.subtitle ?? '',
                      style: FlowbiteFontFamily.inter(
                        fontWeight: .normal,
                        fontSize: fontSize ?? .textSm,
                        color: _getTextColor(context),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      );
    } else if (type == .cardAlert) {
      Widget? icon;
      if (item.state == .active) {
        icon = Icon(
          FlowbiteOutlineIcons.arrow_right,
          size: 20.0,
          color: _getTextColor(context),
        );
      } else if (item.state == .completed) {
        icon = Icon(
          FlowbiteOutlineIcons.check,
          size: 20.0,
          color: _getTextColor(context),
        );
      } else if (item.state == .error) {
        icon = Icon(
          FlowbiteOutlineIcons.x,
          size: 20.0,
          color: _getTextColor(context),
        );
      }
      return Material(
        color: _getCardBackgroundColor(context),
        borderRadius: .circular(12.0),
        child: InkWell(
          onTap: item.state != .disabled ? onTap : null,
          borderRadius: .circular(12.0),
          child: Container(
            decoration: BoxDecoration(
              border: .all(color: _getCardBorderColor(context)),
              borderRadius: .circular(12.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              spacing: 8.0,
              children: [
                Text(
                  item.number?.toString() ?? '',
                  style: FlowbiteFontFamily.inter(
                    fontWeight: .medium,
                    fontSize: fontSize ?? .textBase,
                    color: _getTextColor(context),
                  ),
                ),
                Expanded(
                  child: Text(
                    item.label ?? '',
                    style: FlowbiteFontFamily.inter(
                      fontWeight: .medium,
                      fontSize: fontSize ?? .textBase,
                      color: _getTextColor(context),
                    ),
                  ),
                ),
                ?icon,
              ],
            ),
          ),
        ),
      );
    }
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: item.state != .disabled ? onTap : null,
        child: Row(
          spacing: 8.0,
          mainAxisSize: .min,
          mainAxisAlignment: .center,
          children: [
            _buildNumber(context),
            Text(
              item.label ?? '',
              style: FlowbiteFontFamily.inter(
                fontWeight: .medium,
                fontSize: fontSize ?? .textBase,
                color: _getTextColor(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumber(BuildContext context) {
    if (item.state == .inactive || item.state == .active) {
      return Container(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          border: .all(color: _getBorderColor(context)),
          shape: .circle,
        ),
        child: Text(
          item.number.toString(),
          textAlign: .center,
          style: FlowbiteFontFamily.inter(
            fontWeight: .semibold,
            fontSize: .textXs,
            color: _getTextColor(context),
          ),
        ),
      );
    }
    late IconData icon;
    if (item.state == .completed) {
      icon = FlowbiteOutlineIcons.check;
    } else {
      icon = FlowbiteOutlineIcons.x;
    }
    return Container(
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
        border: .all(color: _getBorderColor(context)),
        shape: .circle,
      ),
      alignment: .center,
      child: Icon(icon, size: 14.0, color: _getTextColor(context)),
    );
  }

  Widget _buildIconShape(
    BuildContext context, {
    required FlowbiteIconShapeSize size,
  }) {
    IconData icon = item.icon ?? FlowbiteOutlineIcons.fire;
    if (item.state == .completed) {
      icon = FlowbiteOutlineIcons.check;
    } else if (item.state == .error) {
      icon = FlowbiteOutlineIcons.x;
    }
    return FlowbiteIconShape(icon: icon, size: size, color: _iconShapeColor);
  }
}

/// Preview class for [FlowbiteStepperNavLink].
///
/// Only used for documentation purpose.
class PreviewFlowbiteStepperNavLink extends StatelessWidget {
  /// Constructor.
  const PreviewFlowbiteStepperNavLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      spacing: 12.0,
      children: FlowbiteStepperNavLinkType.values
          .map(
            (type) => SizedBox(
              width: 300.0,
              child: Column(
                crossAxisAlignment: .start,
                spacing: 8.0,
                children: FlowbiteStepperNavLinkState.values
                    .map(
                      (state) => FlowbiteStepperNavLink(
                        type: type,
                        item: FlowbiteStepperNavLinkItem(
                          number: 1,
                          label: 'First step',
                          state: state,
                        ),
                        onTap: () {},
                      ),
                    )
                    .toList(),
              ),
            ),
          )
          .toList(),
    );
  }
}

@FlowbitePreview(
  name: 'Stepper Nav Link - Light',
  group: 'Stepper',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Stepper Nav Link - Dark',
  group: 'Stepper',
  brightness: .dark,
)
/// Widget preview for [FlowbiteStepperNavLink].
Widget previewFlowbiteStepperNavLink() {
  return const PreviewFlowbiteStepperNavLink();
}
