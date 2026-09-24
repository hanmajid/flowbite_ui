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

import 'package:collection/collection.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

/// [FlowbiteToggleInputMenu]'s item model.
class FlowbiteToggleInputMenuItem {
  /// The item's label.
  final String label;

  /// Constructor.
  new({required this.label});
}

/// Toggle Input Menu component (Advanced type).
class FlowbiteToggleInputMenu extends StatelessWidget {
  /// The component's items.
  final List<FlowbiteToggleInputMenuItem> items;

  /// The currently active index.
  final int? currentIndex;

  /// Toggle input's tap callback.
  final ValueChanged<int>? onTap;

  /// Constructor.
  const FlowbiteToggleInputMenu({
    required this.items,
    this.currentIndex,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .all(6.0),
      decoration: BoxDecoration(
        color: FlowbiteTheme.of(context).bgNeutralTertiaryMedium,
        borderRadius: .circular(12.0),
      ),
      child: Row(
        mainAxisSize: .min,
        spacing: 2.0,
        children: items
            .mapIndexed(
              (index, item) => _FlowbiteToggleInputMenuWidget(
                item: item,
                isActive: index == currentIndex,
                onTap: onTap != null
                    ? () {
                        onTap!(index);
                      }
                    : null,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _FlowbiteToggleInputMenuWidget extends StatelessWidget {
  final FlowbiteToggleInputMenuItem item;
  final bool isActive;
  final VoidCallback? onTap;

  const new({required this.item, required this.isActive, required this.onTap});

  Color _getTextColor(BuildContext context) => isActive
      ? FlowbiteTheme.of(context).textHeading
      : FlowbiteTheme.of(context).textBody;

  BorderRadius get _borderRadius => isActive ? .circular(6.0) : .circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isActive
          ? FlowbiteTheme.of(context).bgNeutralPrimaryMedium
          : Colors.transparent,
      borderRadius: _borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: _borderRadius,
        child: Container(
          height: 24.0,
          decoration: BoxDecoration(borderRadius: _borderRadius),
          padding: const .symmetric(horizontal: 8.0),
          alignment: .center,
          child: Text(
            item.label,
            textAlign: .center,
            style: FlowbiteFontFamily.inter(
              fontWeight: .medium,
              fontSize: .textXs,
              color: _getTextColor(context),
            ),
          ),
        ),
      ),
    );
  }
}

/// Preview class for [FlowbiteToggleInputMenu].
///
/// Only used for documentation purpose.
class PreviewFlowbiteToggleInputMenu extends StatefulWidget {
  /// Constructor.
  const PreviewFlowbiteToggleInputMenu({super.key});

  @override
  State<PreviewFlowbiteToggleInputMenu> createState() =>
      _PreviewFlowbiteToggleInputMenuState();
}

class _PreviewFlowbiteToggleInputMenuState
    extends State<PreviewFlowbiteToggleInputMenu> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.0,
      children: [
        FlowbiteToggleInputMenu(
          items: [
            FlowbiteToggleInputMenuItem(label: 'Toggle'),
            FlowbiteToggleInputMenuItem(label: 'Toggle'),
            FlowbiteToggleInputMenuItem(label: 'Toggle'),
            FlowbiteToggleInputMenuItem(label: 'Toggle'),
          ],
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
        ),
      ],
    );
  }
}

@FlowbitePreview(
  name: 'Toggle Input Menu - Light',
  group: 'Toggle Input',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Toggle Input Menu - Dark',
  group: 'Toggle Input',
  brightness: .dark,
)
/// Widget preview for [FlowbiteToggleInputMenu].
Widget previewFlowbiteToggleInputMenu() =>
    const PreviewFlowbiteToggleInputMenu();
