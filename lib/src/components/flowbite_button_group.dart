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

/// [FlowbiteButtonGroup]'s color enum.
enum FlowbiteButtonGroupColor {
  /// Gray color variant.
  gray,

  /// White color variant.
  white,
}

/// [FlowbiteButtonGroup]'s size enum.
enum FlowbiteButtonGroupSize {
  /// Extra small size variant.
  xs,

  /// Small size variant.
  sm,

  /// Base size variant.
  base,

  /// Large size variant.
  lg,
}

/// [FlowbiteButtonGroup]'s item model.
class FlowbiteButtonGroupItem {
  /// The item's text.
  final String? text;

  /// The item's icon.
  final IconData? icon;

  /// The item's badge.
  final FlowbiteBadge? badge;

  /// The item's tap callback.
  final VoidCallback? onTap;

  /// Constructor.
  new({this.text, this.icon, this.badge, this.onTap})
    : assert(text != null || icon != null, 'text or icon cannot both be null');
}

/// Button Group component.
class FlowbiteButtonGroup extends StatelessWidget {
  /// The button group's color variant.
  ///
  /// The default is [FlowbiteButtonGroupColor.gray].
  final FlowbiteButtonGroupColor color;

  /// The button group's size variant.
  ///
  /// The default is [FlowbiteButtonGroupSize.base].
  final FlowbiteButtonGroupSize size;

  /// The button group's items.
  final List<FlowbiteButtonGroupItem> items;

  /// The button group's direction.
  ///
  /// The default is [Axis.horizontal].
  final Axis direction;

  /// The button group's fixed width.
  ///
  /// Only used if [direction] is vertical.
  final double? width;

  /// Constructor.
  const FlowbiteButtonGroup({
    required this.items,
    this.size = .base,
    this.color = .gray,
    this.direction = .horizontal,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final children = [
      ...items.mapIndexed(
        (index, item) => _FlowbiteButtonGroupSegment(
          size: size,
          color: color,
          item: item,
          isFirst: index == 0,
          isLast: index == items.length - 1,
          direction: direction,
          width: width,
        ),
      ),
    ];
    if (direction == .vertical) {
      return IntrinsicWidth(
        child: Column(mainAxisSize: .min, children: children),
      );
    }
    return Row(mainAxisSize: .min, children: children);
  }
}

class _FlowbiteButtonGroupSegment extends StatefulWidget {
  /// The button group segment's color variant.
  final FlowbiteButtonGroupColor color;

  /// The button group segment's size variant.
  final FlowbiteButtonGroupSize size;

  /// The button group segment's item model.
  final FlowbiteButtonGroupItem item;

  /// The button group segment's direction.
  final Axis direction;

  /// The button group segment's width.
  ///
  /// Only used if [direction] is vertical.
  final double? width;

  /// True if the segment is first in the list.
  ///
  /// The first item will have rounded border radius.
  final bool isFirst;

  /// True if the segment is last in the list.
  ///
  /// The last item will have rounded border radius.
  final bool isLast;

  /// Constructor.
  const new({
    required this.color,
    required this.size,
    required this.direction,
    required this.width,
    required this.item,
    required this.isFirst,
    required this.isLast,
  });

  @override
  State<_FlowbiteButtonGroupSegment> createState() =>
      _FlowbiteButtonGroupSegmentState();
}

class _FlowbiteButtonGroupSegmentState
    extends State<_FlowbiteButtonGroupSegment> {
  bool _isHovered = false;

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      FlowbiteTheme.extension(context);

  double get _height => switch (widget.size) {
    .xs => 32.0,
    .sm => 36.0,
    .base => 40.0,
    .lg => 48.0,
  };

  double get _horizontalPadding => switch (widget.size) {
    .xs => 12.0,
    .sm => 12.0,
    .base => 16.0,
    .lg => 20.0,
  };

  FlowbiteFontSize get _fontSize => switch (widget.size) {
    .xs => .textXs,
    .sm => .textSm,
    .base => .textSm,
    .lg => .textBase,
  };

  Color _getBackgroundColor(BuildContext context) {
    if (!_enabled) {
      return _colorExt(context).bgDisabled;
    }
    return switch (widget.color) {
      .gray =>
        _isHovered
            ? _colorExt(context).bgNeutralTertiaryMedium
            : _colorExt(context).bgNeutralSecondaryMedium,
      .white =>
        _isHovered
            ? _colorExt(context).bgNeutralSecondaryMedium
            : _colorExt(context).bgNeutralPrimarySoft,
    };
  }

  Color _getBorderColor(BuildContext context) => switch (widget.color) {
    .gray => _colorExt(context).borderBaseMedium,
    .white => _colorExt(context).borderBase,
  };

  Color get _textColor {
    if (!_enabled) {
      return _colorExt(context).textFgDisabled;
    }
    return _isHovered
        ? _colorExt(context).textHeading
        : _colorExt(context).textBody;
  }

  bool get _enabled => widget.item.onTap != null;
  bool get _isIconOnly => widget.item.text == null && widget.item.icon != null;

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = .zero;
    if (widget.isFirst) {
      if (widget.direction == .vertical) {
        borderRadius = const .only(
          topLeft: .circular(12.0),
          topRight: .circular(12.0),
        );
      } else {
        borderRadius = const .only(
          topLeft: .circular(12.0),
          bottomLeft: .circular(12.0),
        );
      }
    } else if (widget.isLast) {
      if (widget.direction == .vertical) {
        borderRadius = const .only(
          bottomLeft: .circular(12.0),
          bottomRight: .circular(12.0),
        );
      } else {
        borderRadius = const .only(
          topRight: .circular(12.0),
          bottomRight: .circular(12.0),
        );
      }
    }
    return MouseRegion(
      onEnter: _enabled ? (event) => setState(() => _isHovered = true) : null,
      onExit: _enabled ? (event) => setState(() => _isHovered = false) : null,
      cursor: _enabled ? SystemMouseCursors.click : .defer,
      child: Material(
        borderRadius: borderRadius,
        color: _getBackgroundColor(context),
        child: InkWell(
          hoverColor: _getBackgroundColor(context),
          focusColor: _getBackgroundColor(context),
          onTap: widget.item.onTap,
          borderRadius: borderRadius,
          child: Container(
            height: _height,
            width: _isIconOnly
                ? _height
                : (widget.direction == .vertical ? widget.width : null),
            padding: _isIconOnly
                ? null
                : .symmetric(horizontal: _horizontalPadding),
            alignment: .center,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              border: .all(
                color: _getBorderColor(context),
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
            ),
            child: Row(
              spacing: 6.0,
              mainAxisAlignment: .center,
              children: [
                if (widget.item.icon != null)
                  Icon(
                    widget.item.icon!,
                    size: 16.0,
                    color: _colorExt(context).textHeading,
                  ),
                if (widget.item.text != null)
                  Text(
                    widget.item.text!,
                    style: FlowbiteFontFamily.inter(
                      fontWeight: .medium,
                      fontSize: _fontSize,
                      color: _textColor,
                    ),
                  ),
                ?widget.item.badge,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

@FlowbitePreview(
  name: 'Button Group - Light',
  group: 'Button Group',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Button Group - Dark',
  group: 'Button Group',
  brightness: .dark,
)
/// Widget preview for [FlowbiteButtonGroup].
Widget previewFlowbiteButtonGroup() {
  return Column(
    crossAxisAlignment: .start,
    spacing: 12.0,
    children: [
      ...FlowbiteButtonGroupColor.values.map(
        (color) => Column(
          crossAxisAlignment: .start,
          spacing: 6.0,
          children: FlowbiteButtonGroupSize.values
              .map(
                (size) => FlowbiteButtonGroup(
                  color: color,
                  size: size,
                  items: [
                    FlowbiteButtonGroupItem(text: 'Button text', onTap: () {}),
                    FlowbiteButtonGroupItem(text: 'Button', onTap: () {}),
                    FlowbiteButtonGroupItem(text: 'Button text'),
                  ],
                ),
              )
              .toList(),
        ),
      ),
      FlowbiteButtonGroup(
        color: .white,
        size: .sm,
        items: [
          FlowbiteButtonGroupItem(text: 'Days', onTap: () {}),
          FlowbiteButtonGroupItem(text: 'Weeks', onTap: () {}),
          FlowbiteButtonGroupItem(text: 'Months', onTap: () {}),
          FlowbiteButtonGroupItem(text: 'Years', onTap: () {}),
          FlowbiteButtonGroupItem(text: 'Decades', onTap: () {}),
        ],
      ),
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
      FlowbiteButtonGroup(
        color: .white,
        size: .sm,
        items: [
          FlowbiteButtonGroupItem(
            text: 'Download',
            icon: FlowbiteOutlineIcons.download,
            onTap: () {},
          ),
          FlowbiteButtonGroupItem(text: '456k', onTap: () {}),
        ],
      ),
      FlowbiteButtonGroup(
        color: .white,
        size: .sm,
        items: [
          FlowbiteButtonGroupItem(text: 'Save book', onTap: () {}),
          FlowbiteButtonGroupItem(
            icon: FlowbiteOutlineIcons.bookmark,
            onTap: () {},
          ),
        ],
      ),
      FlowbiteButtonGroup(
        color: .white,
        size: .sm,
        items: [
          FlowbiteButtonGroupItem(
            icon: FlowbiteOutlineIcons.align_center,
            onTap: () {},
          ),
          FlowbiteButtonGroupItem(
            icon: FlowbiteOutlineIcons.align_center,
            onTap: () {},
          ),
          FlowbiteButtonGroupItem(
            icon: FlowbiteOutlineIcons.align_center,
            onTap: () {},
          ),
          FlowbiteButtonGroupItem(
            icon: FlowbiteOutlineIcons.align_center,
            onTap: () {},
          ),
        ],
      ),
      FlowbiteButtonGroup(
        color: .white,
        size: .sm,
        items: [
          FlowbiteButtonGroupItem(
            text: 'All files',
            icon: FlowbiteOutlineIcons.file_lines,
            onTap: () {},
          ),
          FlowbiteButtonGroupItem(
            text: 'Download',
            icon: FlowbiteOutlineIcons.download,
            onTap: () {},
          ),
          FlowbiteButtonGroupItem(
            icon: FlowbiteOutlineIcons.dots_horizontal,
            onTap: () {},
          ),
        ],
      ),
      FlowbiteButtonGroup(
        color: .white,
        size: .sm,
        items: [
          FlowbiteButtonGroupItem(
            text: 'Messages',
            icon: FlowbiteOutlineIcons.envelope,
            badge: FlowbiteBadge.textOnly(text: '1', theme: .danger, size: .xs),
            onTap: () {},
          ),
          FlowbiteButtonGroupItem(
            icon: FlowbiteOutlineIcons.angle_down,
            onTap: () {},
          ),
        ],
      ),
      FlowbiteButtonGroup(
        color: .white,
        size: .sm,
        items: [
          FlowbiteButtonGroupItem(
            icon: FlowbiteOutlineIcons.angle_left,
            onTap: () {},
          ),
          ...List.generate(
            9,
            (index) => FlowbiteButtonGroupItem(
              text: (index + 2).toString(),
              onTap: () {},
            ),
          ),
          FlowbiteButtonGroupItem(
            icon: FlowbiteOutlineIcons.angle_right,
            onTap: () {},
          ),
        ],
      ),
      FlowbiteButtonGroup(
        color: .white,
        size: .sm,
        items: [
          FlowbiteButtonGroupItem(
            icon: FlowbiteOutlineIcons.user_circle,
            onTap: () {},
          ),
          FlowbiteButtonGroupItem(text: 'Sign in', onTap: () {}),
        ],
      ),
      FlowbiteButtonGroup(
        color: .white,
        size: .sm,
        items: [
          FlowbiteButtonGroupItem(
            icon: FlowbiteOutlineIcons.minus,
            onTap: () {},
          ),
          FlowbiteButtonGroupItem(text: '104', onTap: () {}),
          FlowbiteButtonGroupItem(
            icon: FlowbiteOutlineIcons.plus,
            onTap: () {},
          ),
        ],
      ),
      FlowbiteButtonGroup(
        color: .white,
        size: .sm,
        direction: .vertical,
        width: 192.0,
        items: [
          FlowbiteButtonGroupItem(text: 'Days', onTap: () {}),
          FlowbiteButtonGroupItem(text: 'Weeks', onTap: () {}),
          FlowbiteButtonGroupItem(text: 'Months', onTap: () {}),
          FlowbiteButtonGroupItem(text: 'Years', onTap: () {}),
          FlowbiteButtonGroupItem(text: 'Decades', onTap: () {}),
        ],
      ),
      FlowbiteButtonGroup(
        color: .white,
        size: .sm,
        direction: .vertical,
        items: [
          FlowbiteButtonGroupItem(
            icon: FlowbiteOutlineIcons.align_center,
            onTap: () {},
          ),
          FlowbiteButtonGroupItem(
            icon: FlowbiteOutlineIcons.align_center,
            onTap: () {},
          ),
          FlowbiteButtonGroupItem(
            icon: FlowbiteOutlineIcons.align_center,
            onTap: () {},
          ),
          FlowbiteButtonGroupItem(
            icon: FlowbiteOutlineIcons.align_center,
            onTap: () {},
          ),
          FlowbiteButtonGroupItem(
            icon: FlowbiteOutlineIcons.dots_horizontal,
            onTap: () {},
          ),
        ],
      ),
    ],
  );
}
