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

/// Breadcrumb component.
class FlowbiteBreadcrumb extends StatelessWidget {
  /// The breadcrumb's items.
  ///
  /// You can use [FlowbiteBreadcrumbItemWidget] or any other widgets
  /// like buttons or badges.
  final List<Widget> items;

  /// True if breadcrumb will use background.
  ///
  /// Defaults to false.
  final bool useBackground;

  /// The horizontal spacing of the items.
  ///
  /// Defaults to 10.0.
  final double horizontalSpacing;

  /// Constructor
  const FlowbiteBreadcrumb({
    required this.items,
    this.useBackground = false,
    this.horizontalSpacing = 10.0,
    super.key,
  });

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      FlowbiteTheme.extension(context);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: useBackground
          ? BoxDecoration(
              border: .all(color: _colorExt(context).borderBaseMedium),
              color: _colorExt(context).bgNeutralSecondaryMedium,
              borderRadius: .circular(12.0),
            )
          : null,
      padding: useBackground ? const .all(10.0) : null,
      child: Row(
        mainAxisSize: .min,
        spacing: horizontalSpacing,
        children: items,
      ),
    );
  }
}

/// [FlowbiteBreadcrumb]'s item model.
class FlowbiteBreadcrumbItem {
  /// The item's label.
  final String? label;

  /// The item's icon.
  final IconData? icon;

  /// True if the item should show separator icon.
  ///
  /// Defaults to true.
  final bool showSeparatorIcon;

  /// Constructor.
  new({this.label, this.icon, this.showSeparatorIcon = true});
}

/// [FlowbiteBreadcrumb]'s item widget.
class FlowbiteBreadcrumbItemWidget extends StatefulWidget {
  /// The item's model data.
  final FlowbiteBreadcrumbItem item;

  /// True if the item is active.
  ///
  /// Active item cannot be tapped and hovered.
  final bool isActive;

  /// The item's tap callback.
  ///
  /// Only activated if the item [isActive] is false.
  final VoidCallback? onTap;

  /// Constructor.
  const FlowbiteBreadcrumbItemWidget({
    required this.item,
    this.isActive = false,
    this.onTap,
    super.key,
  });

  @override
  State<FlowbiteBreadcrumbItemWidget> createState() =>
      _FlowbiteBreadcrumbItemWidgetState();
}

class _FlowbiteBreadcrumbItemWidgetState
    extends State<FlowbiteBreadcrumbItemWidget> {
  bool _isHovered = false;

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      FlowbiteTheme.extension(context);

  Color _getTextColor(BuildContext context) => widget.isActive
      ? _colorExt(context).textBodySubtle
      : (_isHovered
            ? _colorExt(context).textFgBrand
            : _colorExt(context).textBody);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      spacing: 6.0,
      children: [
        if (widget.item.label != null)
          Material(
            color: Colors.transparent,
            child: InkWell(
              hoverColor: Colors.transparent,
              onTap: widget.onTap,
              child: MouseRegion(
                onEnter: !widget.isActive && widget.onTap != null
                    ? (event) => setState(() => _isHovered = true)
                    : null,
                onExit: !widget.isActive && widget.onTap != null
                    ? (event) => setState(() => _isHovered = false)
                    : null,
                child: Row(
                  mainAxisSize: .min,
                  spacing: 6.0,
                  children: [
                    if (widget.item.icon != null)
                      Icon(
                        widget.item.icon!,
                        size: 16.0,
                        color: _getTextColor(context),
                      ),
                    Text(
                      widget.item.label!,
                      style: FlowbiteFontFamily.inter(
                        fontWeight: .medium,
                        fontSize: .textSm,
                        color: _getTextColor(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (widget.item.showSeparatorIcon)
          Icon(
            FlowbiteOutlineIcons.angle_right,
            size: 14.0,
            color: _colorExt(context).textBodySubtle,
          ),
      ],
    );
  }
}

/// Preview class for [FlowbiteBreadcrumb].
///
/// Only used for documentation purpose.
class PreviewFlowbiteBreadcrumb extends StatelessWidget {
  /// Constructor.
  const PreviewFlowbiteBreadcrumb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 16.0,
      children: [
        // Default
        FlowbiteBreadcrumb(
          items: [
            FlowbiteBreadcrumbItemWidget(
              item: FlowbiteBreadcrumbItem(
                icon: FlowbiteOutlineIcons.home,
                label: 'Home',
              ),
              onTap: () {},
            ),
            FlowbiteBreadcrumbItemWidget(
              item: FlowbiteBreadcrumbItem(label: 'E-commerce'),
              onTap: () {},
            ),
            FlowbiteBreadcrumbItemWidget(
              item: FlowbiteBreadcrumbItem(label: 'Users'),
              onTap: () {},
            ),
            FlowbiteBreadcrumbItemWidget(
              item: FlowbiteBreadcrumbItem(
                label: 'All users',
                showSeparatorIcon: false,
              ),
              isActive: true,
            ),
          ],
        ),
        // With Background
        FlowbiteBreadcrumb(
          useBackground: true,
          items: [
            FlowbiteBreadcrumbItemWidget(
              item: FlowbiteBreadcrumbItem(
                icon: FlowbiteOutlineIcons.home,
                label: 'Home',
              ),
              onTap: () {},
            ),
            FlowbiteBreadcrumbItemWidget(
              item: FlowbiteBreadcrumbItem(label: 'E-commerce'),
              onTap: () {},
            ),
            FlowbiteBreadcrumbItemWidget(
              item: FlowbiteBreadcrumbItem(label: 'Users'),
              onTap: () {},
            ),
            FlowbiteBreadcrumbItemWidget(
              item: FlowbiteBreadcrumbItem(
                label: 'All users',
                showSeparatorIcon: false,
              ),
              isActive: true,
            ),
          ],
        ),
        // With Button
        FlowbiteBreadcrumb(
          items: [
            FlowbiteBreadcrumbItemWidget(
              item: FlowbiteBreadcrumbItem(
                icon: FlowbiteOutlineIcons.home,
                label: 'Home',
              ),
              onTap: () {},
            ),
            FlowbiteBreadcrumbItemWidget(
              item: FlowbiteBreadcrumbItem(label: 'Settings'),
              onTap: () {},
            ),
            FlowbiteBreadcrumbItemWidget(
              item: FlowbiteBreadcrumbItem(label: 'Databases'),
              onTap: () {},
            ),
            FlowbiteButton.icon(
              onPressed: () {},
              label: const Text('Flowbite'),
              leadingIcon: const Icon(FlowbiteOutlineIcons.database),
              trailingIcon: const Icon(FlowbiteOutlineIcons.angle_down),
              color: .secondary,
              size: .xs,
            ),
          ],
        ),
        // With Button Group
        FlowbiteBreadcrumb(
          items: [
            FlowbiteButtonGroup(
              color: .white,
              size: .sm,
              items: [
                FlowbiteButtonGroupItem(
                  icon: FlowbiteOutlineIcons.angle_left,
                  onTap: () {},
                ),
                FlowbiteButtonGroupItem(
                  icon: FlowbiteOutlineIcons.angle_right,
                  onTap: () {},
                ),
              ],
            ),
            FlowbiteBreadcrumbItemWidget(
              item: FlowbiteBreadcrumbItem(
                icon: FlowbiteOutlineIcons.home,
                label: 'Home',
              ),
              onTap: () {},
            ),
            FlowbiteBreadcrumbItemWidget(
              item: FlowbiteBreadcrumbItem(label: 'Settings'),
              onTap: () {},
            ),
            FlowbiteBreadcrumbItemWidget(
              item: FlowbiteBreadcrumbItem(
                label: 'User settings',
                showSeparatorIcon: false,
              ),
              onTap: () {},
            ),
          ],
        ),
        // Only Buttons
        FlowbiteBreadcrumb(
          horizontalSpacing: 4.0,
          items: [
            FlowbiteButton.icon(
              onPressed: () {},
              label: const Text('flowbite.com'),
              leadingIcon: const Icon(FlowbiteOutlineIcons.code_branch),
              trailingIcon: const Icon(FlowbiteOutlineIcons.angle_down),
              color: .ghost,
              size: .xs,
            ),
            FlowbiteBreadcrumbItemWidget(
              item: FlowbiteBreadcrumbItem(),
              onTap: () {},
            ),
            FlowbiteButton.icon(
              onPressed: () {},
              label: const Text('databaseName'),
              leadingIcon: const Icon(FlowbiteOutlineIcons.database),
              trailingIcon: const Icon(FlowbiteOutlineIcons.angle_down),
              color: .ghost,
              size: .xs,
            ),
          ],
        ),
        // With Badge
        FlowbiteBreadcrumb(
          items: [
            FlowbiteBreadcrumbItemWidget(
              item: FlowbiteBreadcrumbItem(label: 'flowbite.com'),
              onTap: () {},
            ),
            FlowbiteBreadcrumbItemWidget(
              item: FlowbiteBreadcrumbItem(label: 'develop'),
              onTap: () {},
            ),
            FlowbiteBreadcrumbItemWidget(
              item: FlowbiteBreadcrumbItem(
                label: 'Issue #312',
                showSeparatorIcon: false,
              ),
              onTap: () {},
            ),
            FlowbiteBadge.textOnly(
              text: 'docs',
              size: .sm,
              theme: .brand,
              isCircle: false,
            ),
            FlowbiteButton.icon(
              onPressed: () {},
              label: const Text('Fix #6597'),
              leadingIcon: const Icon(FlowbiteOutlineIcons.code_branch),
              trailingIcon: const Icon(FlowbiteOutlineIcons.angle_down),
              color: .secondary,
              size: .xs,
            ),
          ],
        ),
      ],
    );
  }
}

@FlowbitePreview(
  name: 'Breadcrumb - Light',
  group: 'Breadcrumb',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Breadcrumb - Dark',
  group: 'Breadcrumb',
  brightness: .dark,
)
/// Widget preview for [FlowbiteBreadcrumb].
Widget previewFlowbiteBreadcrumb() {
  return const PreviewFlowbiteBreadcrumb();
}
