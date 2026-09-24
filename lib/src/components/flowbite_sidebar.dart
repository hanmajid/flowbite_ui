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
import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

/// Sidebar component.
class FlowbiteSidebar extends StatelessWidget {
  /// The sidebar's data.
  final List<List<FlowbiteSidebarItemData>> data;

  /// The sidebar's header widget.
  final Widget? header;

  /// The sidebar's footer widget.
  final Widget? footer;

  /// Constructor.
  const FlowbiteSidebar({
    required this.data,
    this.header,
    this.footer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288.0,
      padding: const .all(20.0),
      color: FlowbiteTheme.of(context).bgNeutralPrimarySoft,
      child: Column(
        spacing: 20.0,
        crossAxisAlignment: .stretch,
        children: [
          ?header,
          Column(
            spacing: 16.0,
            crossAxisAlignment: .stretch,
            children: [
              ...data.mapIndexed(
                (index, list) => Container(
                  padding: index > 0 ? const .only(top: 16.0) : null,
                  decoration: BoxDecoration(
                    border: index > 0
                        ? Border(
                            top: BorderSide(
                              color: FlowbiteTheme.of(context).borderBase,
                            ),
                          )
                        : null,
                  ),
                  child: Column(
                    spacing: 8.0,
                    crossAxisAlignment: .stretch,
                    children: [
                      ...list.map((el) => FlowbiteSidebarItem(data: el)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ?footer,
        ],
      ),
    );
  }
}

/// [FlowbiteSidebarItem] data model.
class FlowbiteSidebarItemData {
  /// The item's icon.
  final IconData? icon;

  /// The item's label.
  final String label;

  /// The item's badge.
  final FlowbiteBadge? badge;

  /// True if the children should be initially expanded.
  final bool initiallyExpanded;

  /// The item's tap callback.
  final VoidCallback? onTap;

  /// The item's children (optional).
  final List<FlowbiteSidebarItemData> children;

  /// Constructor.
  new({
    required this.label,
    this.icon,
    this.badge,
    this.initiallyExpanded = false,
    this.onTap,
    this.children = const [],
  });

  /// True if the item is enabled.
  bool get enabled => onTap != null;
}

/// Sidebar item component.
class FlowbiteSidebarItem extends StatefulWidget {
  /// The item's data.
  final FlowbiteSidebarItemData data;

  /// Constructor.
  const FlowbiteSidebarItem({required this.data, super.key});

  @override
  State<FlowbiteSidebarItem> createState() => _FlowbiteSidebarItemState();
}

class _FlowbiteSidebarItemState extends State<FlowbiteSidebarItem> {
  bool _isHovered = false;
  late bool _isExpanded = widget.data.initiallyExpanded;

  Color? _getBackgroundColor(BuildContext context) => widget.data.enabled
      ? (_isHovered ? FlowbiteTheme.of(context).bgNeutralSecondaryMedium : null)
      : null;

  Color? _getForegoundColor(BuildContext context) => widget.data.enabled
      ? (_isHovered
            ? FlowbiteTheme.of(context).textFgBrand
            : FlowbiteTheme.of(context).textBody)
      : FlowbiteTheme.of(context).textFgDisabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .stretch,
      children: [
        Material(
          borderRadius: .circular(12.0),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: .circular(12.0),
            onTap: widget.data.enabled
                ? () {
                    if (widget.data.children.isNotEmpty) {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    } else {
                      widget.data.onTap!();
                    }
                  }
                : null,
            child: MouseRegion(
              onEnter: widget.data.enabled
                  ? (event) => setState(() => _isHovered = true)
                  : null,
              onExit: widget.data.enabled
                  ? (event) => setState(() => _isHovered = false)
                  : null,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: .circular(12.0),
                  color: _getBackgroundColor(context),
                ),
                padding: const .symmetric(horizontal: 8.0),
                height: 36.0,
                alignment: .center,
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        spacing: 6.0,
                        children: [
                          widget.data.icon != null
                              ? Icon(
                                  widget.data.icon,
                                  size: 20.0,
                                  color: _getForegoundColor(context),
                                )
                              : const SizedBox(width: 20.0),
                          Text(
                            widget.data.label,
                            style: FlowbiteFontFamily.inter(
                              fontWeight: .medium,
                              fontSize: .textBase,
                              color: _getForegoundColor(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ?widget.data.badge,
                    if (widget.data.children.isNotEmpty &&
                        widget.data.badge == null)
                      AnimatedRotation(
                        turns: _isExpanded ? 0.5 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: Icon(
                          FlowbiteOutlineIcons.angle_down,
                          size: 20.0,
                          color: _getForegoundColor(context),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          alignment: Alignment.topCenter,
          child: _isExpanded
              ? Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: .stretch,
                    spacing: 8.0,
                    children: [
                      ...widget.data.children.map(
                        (item) => FlowbiteSidebarItem(data: item),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

/// Preview class for [FlowbiteSidebarItem].
///
/// Only used for documentation purpose.
class PreviewFlowbiteSidebarItem extends StatelessWidget {
  /// Constructor.
  const PreviewFlowbiteSidebarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: FlowbiteTheme.of(context).bgVariantsGray,
      child: Row(
        crossAxisAlignment: .start,
        spacing: 12.0,
        children: [
          SizedBox(
            width: 240.0,
            child: Column(
              crossAxisAlignment: .start,
              spacing: 6.0,
              children: [
                FlowbiteSidebarItem(
                  data: FlowbiteSidebarItemData(
                    icon: FlowbiteOutlineIcons.check_circle,
                    label: 'List item 1',
                    initiallyExpanded: true,
                    children: [
                      FlowbiteSidebarItemData(
                        label: 'List item 1',
                        onTap: () {},
                      ),
                      FlowbiteSidebarItemData(
                        label: 'List item 2',
                        onTap: () {},
                      ),
                      FlowbiteSidebarItemData(label: 'List item 3'),
                    ],
                    onTap: () {},
                  ),
                ),
                FlowbiteSidebarItem(
                  data: FlowbiteSidebarItemData(
                    icon: FlowbiteOutlineIcons.check_circle,
                    label: 'List item 1',
                    badge: FlowbiteBadge.textOnly(
                      text: '1',
                      size: .sm,
                      theme: .danger,
                    ),
                    onTap: () {},
                  ),
                ),
                FlowbiteSidebarItem(
                  data: FlowbiteSidebarItemData(
                    icon: FlowbiteOutlineIcons.check_circle,
                    label: 'List item 1',
                  ),
                ),
              ],
            ),
          ),
          FlowbiteSidebar(
            header: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: FlowbiteTheme.of(context).borderBase,
                  ),
                ),
              ),
              padding: const .only(bottom: 20.0),
              child: Text(
                'Flowbite',
                style: FlowbiteFontFamily.inter(
                  fontWeight: .semibold,
                  fontSize: .textLg,
                  color: FlowbiteTheme.of(context).textHeading,
                ),
              ),
            ),
            footer: FlowbiteAlert.complex(
              heading: 'New dashboard!',
              text: '''Preview the new Flowbite dashboard navigation! You can turn the new navigation off for a limited time in your profile.''',
              color: .info,
              onTapClose: () {},
              buttonLabel: 'Check it out',
              trailingIcon: const Icon(FlowbiteOutlineIcons.arrow_right),
              onPressedButton: () {},
            ),
            data: [
              [
                FlowbiteSidebarItemData(
                  label: 'Overview',
                  icon: FlowbiteOutlineIcons.chart_pie,
                  onTap: () {},
                  children: [FlowbiteSidebarItemData(label: 'List Item 1')],
                ),
                FlowbiteSidebarItemData(
                  label: 'Pages',
                  icon: FlowbiteOutlineIcons.file_lines,
                  onTap: () {},
                  children: [FlowbiteSidebarItemData(label: 'List Item 1')],
                ),
                FlowbiteSidebarItemData(
                  label: 'Ecommerce',
                  icon: FlowbiteOutlineIcons.bag,
                  onTap: () {},
                  initiallyExpanded: true,
                  children: [
                    FlowbiteSidebarItemData(
                      label: 'All products',
                      onTap: () {},
                    ),
                    FlowbiteSidebarItemData(label: 'Billing', onTap: () {}),
                    FlowbiteSidebarItemData(label: 'Invoice', onTap: () {}),
                    FlowbiteSidebarItemData(
                      label: 'Transactions',
                      onTap: () {},
                    ),
                  ],
                ),
                FlowbiteSidebarItemData(
                  label: 'Messages',
                  icon: FlowbiteOutlineIcons.inbox_full,
                  onTap: () {},
                  badge: FlowbiteBadge.textOnly(
                    text: '4',
                    size: .sm,
                    theme: .danger,
                  ),
                ),
                FlowbiteSidebarItemData(
                  label: 'Users',
                  icon: FlowbiteOutlineIcons.users_group,
                  onTap: () {},
                  children: [FlowbiteSidebarItemData(label: 'List Item 1')],
                ),
                FlowbiteSidebarItemData(
                  label: 'Support',
                  icon: FlowbiteOutlineIcons.user_headset,
                  onTap: () {},
                  children: [FlowbiteSidebarItemData(label: 'List Item 1')],
                ),
              ],
              [
                FlowbiteSidebarItemData(
                  label: 'Docs',
                  icon: FlowbiteOutlineIcons.book,
                  onTap: () {},
                ),
                FlowbiteSidebarItemData(
                  label: 'Components',
                  icon: FlowbiteOutlineIcons.database,
                  onTap: () {},
                ),
                FlowbiteSidebarItemData(
                  label: 'Help',
                  icon: FlowbiteOutlineIcons.life_buoy,
                  onTap: () {},
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

@FlowbitePreview(
  name: 'Sidebar Item - Light',
  group: 'Sidebar',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Sidebar Item - Dark',
  group: 'Sidebar',
  brightness: .dark,
)
/// Widget preview for [FlowbiteSidebarItem].
Widget previewFlowbiteSidebarItem() {
  return const PreviewFlowbiteSidebarItem();
}
