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

/// List Item component.
class FlowbiteListItem extends StatefulWidget {
  /// The item's leading widget.
  final Widget leading;

  /// The item's title.
  final String title;

  /// The item's subtitle.
  final String subtitle;

  /// Whether the item is active.
  ///
  /// Defaults to false.
  final bool isActive;

  /// The item's tap callback.
  final VoidCallback? onTap;

  /// Constructor.
  const FlowbiteListItem({
    required this.leading,
    required this.title,
    required this.subtitle,
    this.isActive = false,
    this.onTap,
    super.key,
  });

  @override
  State<FlowbiteListItem> createState() => _FlowbiteListItemState();
}

class _FlowbiteListItemState extends State<FlowbiteListItem> {
  bool _isHovered = false;

  bool get _isDisabled => widget.onTap == null;

  Color _getTitleColor(BuildContext context) => _isDisabled
      ? FlowbiteTheme.of(context).textFgDisabled
      : (widget.isActive || _isHovered
            ? FlowbiteTheme.of(context).textFgBrandStrong
            : FlowbiteTheme.of(context).textHeading);

  Color _getSubtitleColor(BuildContext context) => _isDisabled
      ? FlowbiteTheme.of(context).textFgDisabled
      : (widget.isActive || _isHovered
            ? FlowbiteTheme.of(context).textFgBrandStrong
            : FlowbiteTheme.of(context).textBody);

  Color _getIconColor(BuildContext context) => _isDisabled
      ? FlowbiteTheme.of(context).textFgDisabled
      : (widget.isActive || _isHovered
            ? FlowbiteTheme.of(context).textFgBrandStrong
            : FlowbiteTheme.of(context).textBodySubtle);

  Color _getBorderColor(BuildContext context) => _isDisabled
      ? FlowbiteTheme.of(context).borderBase
      : (widget.isActive || _isHovered
            ? FlowbiteTheme.of(context).borderBrandSubtle
            : FlowbiteTheme.of(context).borderBase);

  Color _getBackgroundColor(BuildContext context) => _isDisabled
      ? FlowbiteTheme.of(context).bgNeutralSecondarySoft
      : (widget.isActive || _isHovered
            ? FlowbiteTheme.of(context).bgBrandSofter
            : FlowbiteTheme.of(context).bgNeutralSecondarySoft);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: .circular(12.0),
      color: _getBackgroundColor(context),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: .circular(12.0),
        hoverColor: FlowbiteTheme.of(context).bgBrandSofter,
        onHover: (value) {
          setState(() {
            _isHovered = value;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: .circular(12.0),
            border: .all(color: _getBorderColor(context)),
          ),
          padding: const .all(16.0),
          child: Row(
            spacing: 24.0,
            children: [
              Expanded(
                child: Row(
                  spacing: 8.0,
                  children: [
                    SizedBox(height: 36.0, width: 36.0, child: widget.leading),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: FlowbiteTheme.of(context).borderBase,
                            ),
                          ),
                        ),
                        padding: const .only(left: 14.0),
                        child: Column(
                          crossAxisAlignment: .stretch,
                          spacing: 2.0,
                          children: [
                            Text(
                              widget.title,
                              style: FlowbiteFontFamily.inter(
                                fontWeight: .semibold,
                                fontSize: .textBase,
                                color: _getTitleColor(context),
                              ),
                            ),
                            Text(
                              widget.subtitle,
                              style: FlowbiteFontFamily.inter(
                                fontWeight: .normal,
                                fontSize: .textSm,
                                color: _getSubtitleColor(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                FlowbiteOutlineIcons.arrow_right,
                size: 24.0,
                color: _getIconColor(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Preview class for [FlowbiteListItem].
///
/// Only used for documentation purpose.
class PreviewFlowbiteListItem extends StatelessWidget {
  /// Constructor.
  const PreviewFlowbiteListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 457.0,
      child: Column(
        spacing: 6.0,
        children: [
          FlowbiteListItem(
            leading: const FlutterLogo(),
            title: 'List item 1',
            subtitle: 'Helper text here',
            onTap: () {},
          ),
          FlowbiteListItem(
            leading: const FlutterLogo(),
            title: 'List item 1',
            subtitle: 'Helper text here',
            isActive: true,
            onTap: () {},
          ),
          const FlowbiteListItem(
            leading: FlutterLogo(),
            title: 'List item 1',
            subtitle: 'Helper text here',
          ),
        ],
      ),
    );
  }
}

@FlowbitePreview(
  name: 'List Item - Light',
  group: 'List Item',
  brightness: .light,
)
@FlowbitePreview(
  name: 'List Item - Dark',
  group: 'List Item',
  brightness: .dark,
)
/// Widget preview for [FlowbiteListItem].
Widget previewFlowbiteListItem() {
  return const PreviewFlowbiteListItem();
}
