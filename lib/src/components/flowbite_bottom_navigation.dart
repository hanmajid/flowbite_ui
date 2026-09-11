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
import 'package:flowbite_icons/flowbite_outline_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flowbite_ui/src/components/flowbite_toggle_input.dart';
import 'package:material_ui/material_ui.dart';

/// [FlowbiteBottomNavigation]'s item model.
class FlowbiteBottomNavigationItem {
  /// The item's icon.
  ///
  /// Not used if [isPaginationButton] is true.
  final IconData? icon;

  /// The item's label.
  ///
  /// Only used for normal, bordered, & pagination variant.
  final String? label;

  /// True if the item is active.
  ///
  /// Defaults to false.
  final bool isActive;

  /// True if the item is for pagination button.
  ///
  /// Defaults to false.
  final bool isPaginationButton;

  /// Constructor.
  new({
    this.icon,
    this.label,
    this.isActive = false,
    this.isPaginationButton = false,
  });
}

/// [FlowbiteBottomNavigation] style variant.
enum FlowbiteBottomNavigationStyle {
  /// Bordered style variant.
  bordered,

  /// Normal/default style variant.
  normal,

  /// Action button style variant.
  actionButton,

  /// Pagination style variant.
  pagination,

  /// Segment controls style variant.
  segmentControls,
}

/// Bottom Navigation component.
class FlowbiteBottomNavigation extends StatelessWidget {
  /// The navigation items.
  final List<FlowbiteBottomNavigationItem> items;

  /// The currently active index.
  final int? currentIndex;

  /// Navigation item's tap callback.
  final ValueChanged<int>? onTap;

  /// The navigation's style.
  ///
  /// Defaults to [FlowbiteBottomNavigationStyle.normal].
  final FlowbiteBottomNavigationStyle style;

  /// The navigation's toggle input.
  ///
  /// Only used if style is [FlowbiteBottomNavigationStyle.segmentControls].
  final FlowbiteToggleInput? toggleInput;

  /// Constructor.
  const FlowbiteBottomNavigation({
    required this.items,
    this.currentIndex,
    this.style = .normal,
    this.onTap,
    this.toggleInput,
    super.key,
  });

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      FlowbiteTheme.extension(context);

  Border? _getBorder(BuildContext context) => switch (style) {
    .bordered => null,
    .normal => null,
    .actionButton => .all(color: _colorExt(context).borderBase),
    .pagination => null,
    .segmentControls => null,
  };

  BorderRadius? get _borderRadius => switch (style) {
    .bordered => null,
    .normal => null,
    .actionButton => .circular(9999),
    .pagination => null,
    .segmentControls => null,
  };

  @override
  Widget build(BuildContext context) {
    if (style == .segmentControls) {
      return Container(
        color: _colorExt(context).bgNeutralPrimarySoft,
        padding: const .only(top: 16.0, bottom: 8.0),
        child: Column(
          spacing: 16.0,
          children: [?toggleInput, _buildNavigationBar(context)],
        ),
      );
    }
    return _buildNavigationBar(context);
  }

  Widget _buildNavigationBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _colorExt(context).bgNeutralPrimarySoft,
        border: _getBorder(context),
        borderRadius: _borderRadius,
      ),
      child: Row(
        // mainAxisAlignment: .spaceAround,
        children: items.mapIndexed((index, item) {
          if (item.isPaginationButton) {
            return SizedBox(
              width: 144.0,
              child: _FlowbiteBottomNavigationItemWidget(
                item: item,
                isActive: currentIndex == index,
                style: style,
                isFirst: index == 0,
                isLast: index == items.length - 1,
                onTap: onTap != null
                    ? () {
                        onTap!(index);
                      }
                    : null,
              ),
            );
          }
          return Expanded(
            child: _FlowbiteBottomNavigationItemWidget(
              item: item,
              isActive: currentIndex == index,
              style: style,
              isFirst: index == 0,
              isLast: index == items.length - 1,
              onTap: onTap != null
                  ? () {
                      onTap!(index);
                    }
                  : null,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _FlowbiteBottomNavigationItemWidget extends StatelessWidget {
  final FlowbiteBottomNavigationItem item;
  final FlowbiteBottomNavigationStyle style;
  final VoidCallback? onTap;
  final bool isActive;
  final bool isFirst;
  final bool isLast;

  const new({
    required this.item,
    required this.style,
    required this.onTap,
    required this.isActive,
    required this.isFirst,
    required this.isLast,
  });

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      FlowbiteTheme.extension(context);

  double get _height => switch (style) {
    .segmentControls => 40.0,
    _ => 64.0,
  };

  Color _getForegroundColor(BuildContext context) => isActive || item.isActive
      ? _colorExt(context).textFgBrand
      : _colorExt(context).textBody;

  Border? _getBorder(BuildContext context) => switch (style) {
    .bordered =>
      isLast
          ? null
          : Border(right: BorderSide(color: _colorExt(context).borderBase)),
    .normal => null,
    .actionButton => Border(
      right: BorderSide(color: _colorExt(context).borderBase),
    ),
    .pagination => null,
    .segmentControls => null,
  };

  BorderRadius? get _borderRadius => switch (style) {
    .bordered => null,
    .normal => null,
    .actionButton =>
      isFirst
          ? const .only(
              topLeft: .circular(9999.0),
              bottomLeft: .circular(9999.0),
            )
          : (isLast
                ? const .only(
                    topRight: .circular(9999.0),
                    bottomRight: .circular(9999.0),
                  )
                : null),
    .pagination => null,
    .segmentControls => null,
  };

  bool get _showLabel => switch (style) {
    .bordered || .normal => true,
    _ => false,
  };

  @override
  Widget build(BuildContext context) {
    if (item.isPaginationButton) {
      return Row(
        mainAxisAlignment: .center,
        children: [
          FlowbiteButton.icon(
            onPressed: onTap,
            size: .xs,
            color: .secondary,
            label: Text(item.label ?? ''),
            leadingIcon: const Icon(FlowbiteOutlineIcons.angle_left),
            trailingIcon: const Icon(FlowbiteOutlineIcons.angle_right),
          ),
        ],
      );
    }
    return Material(
      borderRadius: _borderRadius,
      color: _colorExt(context).bgNeutralPrimarySoft,
      child: InkWell(
        borderRadius: _borderRadius,
        onTap: onTap,
        child: Container(
          height: _height,
          decoration: BoxDecoration(
            border: _getBorder(context),
            borderRadius: _borderRadius,
          ),
          child: Column(
            mainAxisSize: .min,
            mainAxisAlignment: .center,
            children: [
              Icon(item.icon, size: 24.0, color: _getForegroundColor(context)),
              if (_showLabel && item.label != null)
                Text(
                  item.label!,
                  textAlign: .center,
                  style: FlowbiteFontFamily.inter(
                    fontWeight: .medium,
                    fontSize: .textSm,
                    color: _getForegroundColor(context),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Preview class for [FlowbiteBottomNavigation].
///
/// Only used for documentation purpose.
class PreviewFlowbiteBottomNavigation extends StatefulWidget {
  /// Constructor.
  const PreviewFlowbiteBottomNavigation({super.key});

  @override
  State<PreviewFlowbiteBottomNavigation> createState() =>
      _PreviewFlowbiteBottomNavigationState();
}

class _PreviewFlowbiteBottomNavigationState
    extends State<PreviewFlowbiteBottomNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = 380.0;
    return Column(
      spacing: 12.0,
      children: [
        ...[
          FlowbiteBottomNavigationStyle.normal,
          FlowbiteBottomNavigationStyle.bordered,
        ].map(
          (style) => SizedBox(
            width: width,
            child: FlowbiteBottomNavigation(
              style: style,
              items: [
                FlowbiteBottomNavigationItem(
                  icon: FlowbiteOutlineIcons.wallet,
                  label: 'Wallet',
                ),
                FlowbiteBottomNavigationItem(
                  icon: FlowbiteOutlineIcons.wallet,
                  label: 'Wallet',
                ),
                FlowbiteBottomNavigationItem(
                  icon: FlowbiteOutlineIcons.wallet,
                  label: 'Wallet',
                ),
                FlowbiteBottomNavigationItem(
                  icon: FlowbiteOutlineIcons.wallet,
                  label: 'Wallet',
                ),
              ],
              currentIndex: _currentIndex,
              onTap: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
            ),
          ),
        ),
        SizedBox(
          width: width,
          child: FlowbiteBottomNavigation(
            style: .pagination,
            items: [
              FlowbiteBottomNavigationItem(
                icon: FlowbiteOutlineIcons.wallet,
                label: 'Wallet',
              ),
              FlowbiteBottomNavigationItem(
                icon: FlowbiteOutlineIcons.wallet,
                label: 'Wallet',
              ),
              FlowbiteBottomNavigationItem(
                label: '1 of 246',
                isPaginationButton: true,
              ),
              FlowbiteBottomNavigationItem(
                icon: FlowbiteOutlineIcons.wallet,
                label: 'Wallet',
              ),
              FlowbiteBottomNavigationItem(
                icon: FlowbiteOutlineIcons.wallet,
                label: 'Wallet',
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (value) {
              if (value == 2) return;
              setState(() {
                _currentIndex = value;
              });
            },
          ),
        ),
        ...[
          FlowbiteBottomNavigationStyle.actionButton,
          FlowbiteBottomNavigationStyle.segmentControls,
        ].map(
          (style) => SizedBox(
            width: width,
            child: FlowbiteBottomNavigation(
              style: style,
              items: [
                FlowbiteBottomNavigationItem(icon: FlowbiteOutlineIcons.wallet),
                FlowbiteBottomNavigationItem(icon: FlowbiteOutlineIcons.wallet),
                FlowbiteBottomNavigationItem(
                  icon: FlowbiteOutlineIcons.plus,
                  isActive: true,
                ),
                FlowbiteBottomNavigationItem(icon: FlowbiteOutlineIcons.wallet),
                FlowbiteBottomNavigationItem(icon: FlowbiteOutlineIcons.wallet),
              ],
              toggleInput: FlowbiteToggleInput(
                items: [
                  FlowbiteToggleInputItem(label: 'Toggle'),
                  FlowbiteToggleInputItem(label: 'Toggle'),
                  FlowbiteToggleInputItem(label: 'Toggle'),
                  FlowbiteToggleInputItem(label: 'Toggle'),
                ],
                currentIndex: 0,
                onTap: (_) {},
              ),
              currentIndex: _currentIndex,
              onTap: (value) {
                if (value == 2) return;
                setState(() {
                  _currentIndex = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

@FlowbitePreview(
  name: 'Bottom Navigation - Light',
  group: 'Bottom Navigation',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Bottom Navigation - Dark',
  group: 'Bottom Navigation',
  brightness: .dark,
)
/// Widget preview for [FlowbiteBottomNavigation].
Widget previewFlowbiteBottomNavigation() =>
    const PreviewFlowbiteBottomNavigation();
