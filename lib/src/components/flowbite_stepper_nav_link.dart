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
  final String label;

  /// The link's number.
  final int number;

  /// The link's state.
  ///
  /// Defaults to [FlowbiteStepperNavLinkState.inactive].
  final FlowbiteStepperNavLinkState state;

  /// Constructor.
  new({required this.label, required this.number, this.state = .inactive});
}

/// Stepper Nav Link component.
class FlowbiteStepperNavLink extends StatelessWidget {
  /// The link's item.
  final FlowbiteStepperNavLinkItem item;

  /// The link's font size override.
  final FlowbiteFontSize? fontSize;

  /// The link's tap callback.
  final VoidCallback? onTap;

  /// Constructor.
  const FlowbiteStepperNavLink({
    required this.item,
    this.onTap,
    this.fontSize,
    super.key,
  });

  Color _getTextColor(BuildContext context) => switch (item.state) {
    .inactive => FlowbiteTheme.of(context).textBody,
    .active => FlowbiteTheme.of(context).textFgBrand,
    .completed => FlowbiteTheme.of(context).textFgBrand,
    .error => FlowbiteTheme.of(context).textFgDanger,
    .disabled => FlowbiteTheme.of(context).textFgDisabled,
  };

  Color _getBorderColor(BuildContext context) => switch (item.state) {
    .inactive => FlowbiteTheme.of(context).borderBaseStrong,
    .active => FlowbiteTheme.of(context).borderBrand,
    .completed => FlowbiteTheme.of(context).borderBrand,
    .error => FlowbiteTheme.of(context).borderDanger,
    .disabled => FlowbiteTheme.of(context).borderBase,
  };

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Row(
          spacing: 8.0,
          mainAxisSize: .min,
          mainAxisAlignment: .center,
          children: [
            _buildNumber(context),
            Text(
              item.label,
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
}

/// Preview class for [FlowbiteStepperNavLink].
///
/// Only used for documentation purpose.
class PreviewFlowbiteStepperNavLink extends StatelessWidget {
  /// Constructor.
  const PreviewFlowbiteStepperNavLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 16.0,
      children: FlowbiteStepperNavLinkState.values
          .map(
            (state) => FlowbiteStepperNavLink(
              item: FlowbiteStepperNavLinkItem(
                number: 1,
                label: 'First step',
                state: state,
              ),
              onTap: () {},
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
