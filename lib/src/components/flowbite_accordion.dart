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

import 'package:collection/collection.dart';
import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

/// [FlowbiteAccordion]'s breakpoint variant.
enum FlowbiteAccordionBreakpoint {
  /// Desktop breakpoint variant.
  desktop,

  /// Mobile breakpoint variant.
  mobile,
}

/// [FlowbiteAccordion]'s style variant.
enum FlowbiteAccordionStyle {
  /// Default style variant.
  normal,

  /// Separate cards style variant.
  separateCards,

  /// Flush style variant.
  flush,

  /// Multi-level style variant.
  multiLevel,

  /// Multi-level item style variant.
  ///
  /// This is used internally with [multiLevel]. Should not be used directly.
  multiLevelItem,

  /// With-subheader style variant.
  withSubheader,
}

/// [FlowbiteAccordion]'s item model.
class FlowbiteAccordionItem {
  /// The item's header.
  final String header;

  /// The item's subheader.
  ///
  /// Only used for [FlowbiteAccordionStyle.withSubheader] variant.
  final String? subheader;

  /// The item's icon.
  final IconData? icon;

  /// The item's content.
  ///
  /// This will not be used for [FlowbiteAccordionStyle.multiLevel] variant.
  final Widget child;

  /// The item's subitems.
  ///
  /// Only used for [FlowbiteAccordionStyle.multiLevel] variant.
  final List<FlowbiteAccordionItem> subitems;

  /// True if item should be expanded at the start.
  ///
  /// Default to false.
  final bool initiallyExpanded;

  /// Constructor.
  new({
    required this.header,
    required this.child,
    this.icon,
    this.subheader,
    this.subitems = const [],
    this.initiallyExpanded = false,
  });
}

/// Accordion component.
class FlowbiteAccordion extends StatelessWidget {
  /// Accordion's items.
  final List<FlowbiteAccordionItem> items;

  /// The accordion's breakpoint variant.
  ///
  /// The default is [FlowbiteAccordionBreakpoint.desktop].
  final FlowbiteAccordionBreakpoint breakpoint;

  /// The accordion's style variant.
  ///
  /// The default is [FlowbiteAccordionStyle.normal].
  final FlowbiteAccordionStyle style;

  /// Constructor.
  const FlowbiteAccordion({
    required this.items,
    this.breakpoint = .desktop,
    this.style = .normal,
    super.key,
  });
  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      FlowbiteTheme.extension(context);

  double get _verticalSpacing => switch (style) {
    .separateCards => 16.0,
    _ => 0.0,
  };

  Border? _getBorder(BuildContext context) => switch (style) {
    .normal ||
    .multiLevel ||
    .withSubheader => .all(color: _colorExt(context).borderBase),
    _ => null,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: _getBorder(context),
        borderRadius: .circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: _verticalSpacing,
        children: items
            .mapIndexed(
              (index, item) => _FlowbiteAccordionItemWidget(
                item: item,
                style: style,
                breakpoint: breakpoint,
                isFirst: index == 0,
                isLast: index == items.length - 1,
              ),
            )
            .toList(),
      ),
    );
  }
}

/// Accordion item component.
class _FlowbiteAccordionItemWidget extends StatefulWidget {
  /// The item's data model.
  final FlowbiteAccordionItem item;

  /// The item's breakpoint variant.
  final FlowbiteAccordionBreakpoint breakpoint;

  /// The item's style variant.
  final FlowbiteAccordionStyle style;

  /// True if the item is first in the list.
  ///
  /// The first item will have rounded border radius.
  final bool isFirst;

  /// True if the item is last in the list.
  ///
  /// The last item will have rounded border radius.
  final bool isLast;

  /// Constructor.
  const _FlowbiteAccordionItemWidget({
    required this.item,
    required this.breakpoint,
    required this.style,
    required this.isLast,
    required this.isFirst,
  });

  @override
  State<_FlowbiteAccordionItemWidget> createState() =>
      _FlowbiteAccordionItemWidgetState();
}

class _FlowbiteAccordionItemWidgetState
    extends State<_FlowbiteAccordionItemWidget> {
  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      FlowbiteTheme.extension(context);

  bool get _isMobile => widget.breakpoint == .mobile;

  EdgeInsets get _buttonPadding => switch (widget.style) {
    .multiLevelItem => .only(
      left: _isMobile ? 20 : 48.0,
      top: _isMobile ? 14 : 20.0,
      right: _isMobile ? 16 : 24.0,
      bottom: _isMobile ? 14 : 20.0,
    ),
    _ => .symmetric(
      horizontal: _buttonHorizontalPadding,
      vertical: _buttonVerticalPadding,
    ),
  };

  double get _buttonHorizontalPadding => switch (widget.style) {
    .flush => 0.0,
    _ => _isMobile ? 16.0 : 24.0,
  };

  double get _buttonVerticalPadding => switch (widget.style) {
    .flush => _isMobile ? 16.0 : 20.0,
    _ => _isMobile ? 14.0 : 20.0,
  };

  double get _bodyHorizontalPadding => switch (widget.style) {
    .flush => 0.0,
    _ => _isMobile ? 16.0 : 24.0,
  };

  double get _bodyVerticalPadding => switch (widget.style) {
    .separateCards ||
    .multiLevel ||
    .multiLevelItem ||
    .withSubheader => _isMobile ? 14.0 : 20.0,
    _ => _isMobile ? 16.0 : 20.0,
  };

  late bool _isExpand = widget.item.initiallyExpanded;

  Color _getButtonBackgroundColor(BuildContext context) =>
      switch (widget.style) {
        .flush => Colors.transparent,
        .multiLevelItem => _colorExt(context).bgNeutralSecondaryMedium,
        _ =>
          _isExpand
              ? _colorExt(context).bgNeutralTertiary
              : _colorExt(context).bgNeutralPrimarySoft,
      };

  Color _getBodyBackgroundColor(BuildContext context) => switch (widget.style) {
    .flush => Colors.transparent,
    .multiLevelItem => _colorExt(context).bgNeutralSecondaryMedium,
    _ => _colorExt(context).bgNeutralPrimarySoft,
  };

  Border? _getButtonBorder(BuildContext context) => switch (widget.style) {
    .separateCards => .all(color: _colorExt(context).borderBase),
    .multiLevel =>
      _isExpand
          ? .all(color: _colorExt(context).borderBaseMedium)
          : .all(color: _colorExt(context).borderBase),
    .multiLevelItem => .all(color: _colorExt(context).borderBaseMedium),
    _ =>
      widget.isLast && !_isExpand
          ? null
          : Border(bottom: BorderSide(color: _colorExt(context).borderBase)),
  };

  Border? _getBodyBorder(BuildContext context) => switch (widget.style) {
    .separateCards => Border(
      bottom: BorderSide(color: _colorExt(context).borderBase),
      left: BorderSide(color: _colorExt(context).borderBase),
      right: BorderSide(color: _colorExt(context).borderBase),
    ),
    .flush =>
      _isExpand && !widget.isLast
          ? Border(bottom: BorderSide(color: _colorExt(context).borderBase))
          : null,
    _ =>
      widget.isLast
          ? null
          : Border(bottom: BorderSide(color: _colorExt(context).borderBase)),
  };

  BorderRadius get _buttonBorderRadius {
    BorderRadius borderRadius = .zero;
    switch (widget.style) {
      case .separateCards:
        if (_isExpand) {
          borderRadius = const .only(
            topLeft: .circular(12.0),
            topRight: .circular(12.0),
          );
        } else {
          borderRadius = .circular(12.0);
        }
      case .flush:
        break;
      case .normal:
      case .multiLevel:
      case .multiLevelItem:
      case .withSubheader:
        if (widget.isFirst) {
          borderRadius = const .only(
            topLeft: .circular(12.0),
            topRight: .circular(12.0),
          );
        } else if (widget.isLast && !_isExpand) {
          borderRadius = const .only(
            bottomLeft: .circular(12.0),
            bottomRight: .circular(12.0),
          );
        }
    }
    return borderRadius;
  }

  BorderRadius? get _bodyBorderRadius => switch (widget.style) {
    .separateCards => const .only(
      bottomLeft: .circular(12.0),
      bottomRight: .circular(12.0),
    ),
    .flush => null,
    _ =>
      widget.isLast
          ? const .only(
              bottomLeft: .circular(12.0),
              bottomRight: .circular(12.0),
            )
          : null,
  };

  @override
  Widget build(BuildContext context) {
    BorderRadius buttonBorderRadius = _buttonBorderRadius;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          color: _getButtonBackgroundColor(context),
          borderRadius: buttonBorderRadius,
          child: InkWell(
            onTap: () {
              setState(() {
                _isExpand = !_isExpand;
              });
            },
            borderRadius: buttonBorderRadius,
            child: Container(
              padding: _buttonPadding,
              decoration: BoxDecoration(
                border: _getButtonBorder(context),
                borderRadius: buttonBorderRadius,
              ),
              child: Row(
                children: [
                  Expanded(child: _buildHeader(context)),
                  if (widget.style != .multiLevelItem)
                    _buildChevronIcon(context),
                ],
              ),
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          alignment: Alignment.topCenter,
          child: _isExpand ? _buildBody(context) : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    if (widget.style == .withSubheader) {
      double iconSize = _isMobile ? 14.0 : 16.0;
      double iconContainerSize = _isMobile ? 24.0 : 36.0;
      return Row(
        spacing: 10.0,
        children: [
          if (widget.item.icon != null)
            Container(
              decoration: BoxDecoration(
                shape: .circle,
                color: _colorExt(context).bgNeutralPrimaryMedium,
                border: .all(color: _colorExt(context).borderBaseMedium),
              ),
              height: iconContainerSize,
              width: iconContainerSize,
              alignment: .center,
              child: Icon(
                widget.item.icon!,
                size: iconSize,
                color: _colorExt(context).textHeading,
              ),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 1.0,
              children: [
                Text(
                  widget.item.header,
                  style: FlowbiteFontFamily.inter(
                    fontWeight: .medium,
                    fontSize: .textBase,
                    color: _isExpand
                        ? _colorExt(context).textHeading
                        : _colorExt(context).textBody,
                  ),
                ),
                if (widget.item.subheader != null)
                  Text(
                    widget.item.subheader!,
                    style: FlowbiteFontFamily.inter(
                      fontWeight: .normal,
                      fontSize: .textSm,
                      color: _colorExt(context).textBody,
                    ),
                  ),
              ],
            ),
          ),
        ],
      );
    } else if (widget.style == .multiLevelItem) {
      return Row(
        spacing: 8.0,
        children: [
          _buildChevronIcon(context),
          Expanded(
            child: Text(
              widget.item.header,
              style: FlowbiteFontFamily.inter(
                fontWeight: .medium,
                fontSize: .textBase,
                color: _isExpand
                    ? _colorExt(context).textHeading
                    : _colorExt(context).textBody,
              ),
            ),
          ),
        ],
      );
    }
    return Row(
      spacing: 8.0,
      children: [
        if (!_isMobile && widget.item.icon != null)
          Icon(
            widget.item.icon!,
            size: 20.0,
            color: _isExpand
                ? _colorExt(context).textHeading
                : _colorExt(context).textBody,
          ),
        Expanded(
          child: Text(
            widget.item.header,
            style: FlowbiteFontFamily.inter(
              fontWeight: .medium,
              fontSize: .textBase,
              color: _isExpand
                  ? _colorExt(context).textHeading
                  : _colorExt(context).textBody,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    if (widget.style == .multiLevel) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widget.item.subitems
            .mapIndexed(
              (index, subitem) => _FlowbiteAccordionItemWidget(
                item: subitem,
                breakpoint: widget.breakpoint,
                style: .multiLevelItem,
                isLast:
                    index == widget.item.subitems.length - 1 && widget.isLast,
                isFirst: false,
              ),
            )
            .toList(),
      );
    }
    return Container(
      decoration: BoxDecoration(
        border: _getBodyBorder(context),
        borderRadius: _bodyBorderRadius,
        color: _getBodyBackgroundColor(context),
      ),
      padding: .symmetric(
        horizontal: _bodyHorizontalPadding,
        vertical: _bodyVerticalPadding,
      ),
      child: widget.item.child,
    );
  }

  Widget _buildChevronIcon(BuildContext context) {
    return AnimatedRotation(
      turns: _isExpand ? 0 : 0.5,
      duration: const Duration(milliseconds: 300),
      child: Icon(
        FlowbiteOutlineIcons.angle_top,
        size: 20.0,
        color: _isExpand
            ? _colorExt(context).textHeading
            : _colorExt(context).textBody,
      ),
    );
  }
}

class _DefaultFlowbiteAccordionContent extends StatelessWidget {
  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      FlowbiteTheme.extension(context);

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.0,
      crossAxisAlignment: .start,
      children: [
        Text(
          '''Generally, it is accepted to use Flowbite in open-source projects, as long as it is not a UI library, a theme, a template, a page-builder that would be considered as an alternative to Flowbite itself.''',
          style: FlowbiteFontFamily.inter(
            fontWeight: .normal,
            fontSize: .textBase,
            color: _colorExt(context).textBody,
          ),
        ),
        Text(
          '''With that being said, feel free to use this design kit for your open-source projects.''',
          style: FlowbiteFontFamily.inter(
            fontWeight: .normal,
            fontSize: .textBase,
            color: _colorExt(context).textBody,
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'Find out more information by ',
            style: FlowbiteFontFamily.inter(
              fontWeight: .normal,
              fontSize: .textBase,
              color: _colorExt(context).textBody,
            ),
            children: [
              TextSpan(
                text: 'reading the release',
                style: FlowbiteFontFamily.inter(
                  fontWeight: .normal,
                  fontSize: .textBase,
                  color: _colorExt(context).textFgBrand,
                  decoration: TextDecoration.underline,
                ),
              ),
              const TextSpan(text: '.'),
            ],
          ),
        ),
      ],
    );
  }
}

/// Preview class for [FlowbiteAccordion].
///
/// Only used for documentation purpose.
class PreviewFlowbiteAccordion extends StatelessWidget {
  /// Constructor.
  const PreviewFlowbiteAccordion({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultContent = _DefaultFlowbiteAccordionContent();

    final items = [
      FlowbiteAccordionItem(
        icon: FlowbiteOutlineIcons.question_mark,
        header: 'Can I use Flowbite in open-source projects?',
        initiallyExpanded: true,
        child: defaultContent,
        subitems: [
          FlowbiteAccordionItem(
            header: 'How to install Flowbite for my Next.js project?',
            child: defaultContent,
          ),
          FlowbiteAccordionItem(
            header: 'How to install Flowbite for my React project?',
            initiallyExpanded: true,
            child: defaultContent,
          ),
        ],
      ),
      FlowbiteAccordionItem(
        icon: FlowbiteOutlineIcons.question_mark,
        header: 'Can I contribute to the Flowbite project?',
        child: defaultContent,
      ),
      FlowbiteAccordionItem(
        icon: FlowbiteOutlineIcons.question_mark,
        header: 'What are the main features of Flowbite?',
        child: defaultContent,
      ),
    ];
    final items2 = [
      FlowbiteAccordionItem(
        icon: FlowbiteOutlineIcons.open_book,
        header: 'Introduction to Flowbite',
        subheader: 'What is the Flowbite library?',
        initiallyExpanded: true,
        child: defaultContent,
      ),
      FlowbiteAccordionItem(
        icon: FlowbiteOutlineIcons.share_nodes,
        header: 'Installation and Setup',
        subheader: 'How can I install Flowbite in my project?',
        child: defaultContent,
      ),
      FlowbiteAccordionItem(
        icon: FlowbiteOutlineIcons.dna,
        header: 'Compatibility and Frameworks',
        subheader: 'Which frameworks are compatible with Flowbite?',
        child: defaultContent,
      ),
    ];

    return Column(
      crossAxisAlignment: .start,
      spacing: 16.0,
      children: FlowbiteAccordionStyle.values
          .whereNot((e) => e == .multiLevelItem)
          .map(
            (style) => Column(
              crossAxisAlignment: .start,
              spacing: 12.0,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 695.0),
                  child: FlowbiteAccordion(items: items, style: style),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 380.0),
                  child: FlowbiteAccordion(
                    breakpoint: .mobile,
                    style: style,
                    items: style == .withSubheader ? items2 : items,
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}

@FlowbitePreview(
  name: 'Accordion - Light',
  group: 'Accordion',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Accordion - Dark',
  group: 'Accordion',
  brightness: .dark,
)
/// Widget preview for [FlowbiteAccordion].
Widget previewFlowbiteAccordion() {
  return const PreviewFlowbiteAccordion();
}
