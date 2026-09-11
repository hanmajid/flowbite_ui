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

import 'package:flowbite_icons/flowbite_outline_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

/// [FlowbiteJumbotron]'s breakpoint variant.
enum FlowbiteJumbotronBreakpoint {
  /// Desktop breakpoint variant.
  desktop,

  /// Tablet breakpoint variant.
  tablet,

  /// Mobile breakpoint variant.
  mobile,
}

/// Jumbotron component.
class FlowbiteJumbotron extends StatelessWidget {
  /// The jumbotron's title.
  final String title;

  /// The jumbotron's subtitle.
  final String subtitle;

  /// The jumbotron's actions.
  final Widget? actions;

  /// The jumbotron's background image.
  final ImageProvider? backgroundImage;

  /// The jumbotron's background image fit property.
  final BoxFit? backgroundImageFit;

  /// The jumbotron's background image alignment property.
  final AlignmentGeometry backgroundImageAlignment;

  /// The jumbotron's background image breakpoints.
  ///
  /// Defaults to [FlowbiteJumbotronBreakpoint.values].
  final List<FlowbiteJumbotronBreakpoint> backgroundImageBreakpoints;

  /// If true, then the background image is dark. This will affects
  /// the title & subtitle's text color.
  ///
  /// Defaults to false.
  final bool isBackgroundImageDark;

  /// The jumbotron's child widget (optional).
  final Widget? child;

  /// If true, then [child] will be contained in [Row] instead of [Column] in
  /// tablet mode.
  ///
  /// Defaults to false.
  final bool useRowInTablet;

  /// If true, then the container vertical padding will be increased.
  ///
  /// Defaults to false.
  final bool useExtraVerticalPadding;

  /// The jumbotron's header widget (optional).
  ///
  /// Will be displayed above title.
  final Widget? heading;

  /// The jumbotron's breakpoint variant.
  ///
  /// Defaults to [FlowbiteJumbotronBreakpoint.desktop].
  final FlowbiteJumbotronBreakpoint breakpoint;

  /// Constructor.
  const FlowbiteJumbotron({
    required this.title,
    required this.subtitle,
    this.actions,
    this.backgroundImage,
    this.child,
    this.heading,
    this.breakpoint = .desktop,
    this.useRowInTablet = false,
    this.useExtraVerticalPadding = false,
    this.backgroundImageFit,
    this.backgroundImageAlignment = .center,
    this.isBackgroundImageDark = false,
    this.backgroundImageBreakpoints = FlowbiteJumbotronBreakpoint.values,
    super.key,
  });

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      FlowbiteTheme.extension(context);

  FlowbiteFontSize get _titleFontSize => switch (breakpoint) {
    .desktop => .text6xl,
    .tablet => .text5xl,
    .mobile => .text3xl,
  };

  FlowbiteFontSize get _subtitleFontSize => switch (breakpoint) {
    .desktop => .textXl,
    .tablet => .textXl,
    .mobile => .textBase,
  };

  bool get _hasChild => child != null;

  TextAlign get _textAlign => _hasChild ? .start : .center;

  double get _verticalPadding => switch (breakpoint) {
    .desktop => useExtraVerticalPadding ? 224.0 : 96.0,
    .tablet => useExtraVerticalPadding ? 96.0 : 64.0,
    .mobile => useExtraVerticalPadding ? 64.0 : 32.0,
  };
  double get _horizontalPadding => switch (breakpoint) {
    .desktop => 80.0,
    .tablet => 16.0,
    .mobile => 16.0,
  };

  Color _getTitleTextColor(BuildContext context) => isBackgroundImageDark
      ? _colorExt(context).textWhite
      : _colorExt(context).textHeading;

  Color _getSubtitleTextColor(BuildContext context) => isBackgroundImageDark
      ? _colorExt(context).textFgDisabled
      : _colorExt(context).textBody;

  @override
  Widget build(BuildContext context) {
    Widget finalChild = _buildHeadingParagraph(context);
    if (_hasChild) {
      if (breakpoint == .desktop || (breakpoint == .tablet && useRowInTablet)) {
        finalChild = Row(
          mainAxisAlignment: .spaceBetween,
          spacing: 32.0,
          children: [
            Flexible(child: _buildHeadingParagraph(context)),
            child!,
          ],
        );
      } else {
        finalChild = Column(
          spacing: 32.0,
          mainAxisSize: .min,
          children: [_buildHeadingParagraph(context), child!],
        );
      }
    }
    return Container(
      decoration: BoxDecoration(
        color: _colorExt(context).bgNeutralPrimary,
        image:
            (backgroundImage != null &&
                backgroundImageBreakpoints.contains(breakpoint))
            ? DecorationImage(
                image: backgroundImage!,
                fit: backgroundImageFit,
                alignment: backgroundImageAlignment,
              )
            : null,
      ),
      padding: .symmetric(
        horizontal: _horizontalPadding,
        vertical: _verticalPadding,
      ),
      child: finalChild,
    );
  }

  Widget _buildHeadingParagraph(BuildContext context) {
    return Column(
      spacing: 24.0,
      crossAxisAlignment: _hasChild ? .start : .center,
      children: [
        ?heading,
        Text(
          title,
          textAlign: _textAlign,
          style: FlowbiteFontFamily.inter(
            fontWeight: .semibold,
            fontSize: _titleFontSize,
            color: _getTitleTextColor(context),
            height: 1.0,
          ),
        ),
        Text(
          subtitle,
          textAlign: _textAlign,
          style: FlowbiteFontFamily.inter(
            fontWeight: .normal,
            fontSize: _subtitleFontSize,
            color: _getSubtitleTextColor(context),
          ),
        ),
        ?actions,
      ],
    );
  }
}

/// Preview class for [FlowbiteJumbotron].
///
/// Only used for documentation purpose.
class PreviewFlowbiteJumbotron extends StatelessWidget {
  /// Constructor.
  const PreviewFlowbiteJumbotron({super.key});

  @override
  Widget build(BuildContext context) {
    final buttons = Row(
      mainAxisSize: .min,
      spacing: 6.0,
      mainAxisAlignment: .center,
      children: [
        FlowbiteButton.icon(
          onPressed: () {},
          label: const Text('Get started'),
          trailingIcon: const Icon(FlowbiteOutlineIcons.arrow_right),
          size: .lg,
        ),
        FlowbiteButton.icon(
          onPressed: () {},
          label: const Text('Learn more'),
          color: .secondary,
          size: .lg,
        ),
      ],
    );
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: FlowbiteTheme.extension(context).bgVariantsGray,
      child: Column(
        crossAxisAlignment: .start,
        spacing: 16.0,
        children: [
          // Default
          Column(
            crossAxisAlignment: .start,
            spacing: 12.0,
            children: FlowbiteJumbotronBreakpoint.values.map((breakpoint) {
              double width = switch (breakpoint) {
                .desktop => 1440.0,
                .tablet => 768.0,
                .mobile => 375.0,
              };
              return SizedBox(
                width: width,
                child: FlowbiteJumbotron(
                  breakpoint: breakpoint,
                  title: "We invest in the world's potential",
                  subtitle: '''Here at flowbite we focus on markets where technology, innovation, and capital can unlock long-term value and drive economic growth.''',
                  actions: buttons,
                ),
              );
            }).toList(),
          ),
          // With Background Image
          Column(
            crossAxisAlignment: .start,
            spacing: 12.0,
            children: FlowbiteJumbotronBreakpoint.values.map((breakpoint) {
              double width = switch (breakpoint) {
                .desktop => 1440.0,
                .tablet => 768.0,
                .mobile => 375.0,
              };
              return SizedBox(
                width: width,
                child: FlowbiteJumbotron(
                  breakpoint: breakpoint,
                  title: "We invest in the world's potential",
                  subtitle: '''Here at flowbite we focus on markets where technology, innovation, and capital can unlock long-term value and drive economic growth.''',
                  useExtraVerticalPadding: true,
                  backgroundImage: const AssetImage(
                    'assets/images/jumbotron-bg-image.png',
                    package: 'flowbite_ui',
                  ),
                  isBackgroundImageDark: true,
                  backgroundImageFit: .cover,
                  actions: buttons,
                ),
              );
            }).toList(),
          ),
          // With Child
          Column(
            crossAxisAlignment: .start,
            spacing: 12.0,
            children: FlowbiteJumbotronBreakpoint.values.map((breakpoint) {
              double width = switch (breakpoint) {
                .desktop => 1440.0,
                .tablet => 768.0,
                .mobile => 375.0,
              };
              return SizedBox(
                width: width,
                child: FlowbiteJumbotron(
                  breakpoint: breakpoint,
                  title: "We invest in the world's potential",
                  subtitle: '''Here at flowbite we focus on markets where technology, innovation, and capital can unlock long-term value and drive economic growth.''',
                  actions: buttons,
                  child: SizedBox(
                    width: breakpoint == .desktop ? 576.0 : null,
                    child: AspectRatio(
                      aspectRatio: 576.0 / 320.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlue.shade50,
                          borderRadius: .circular(24.0),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          // With Child & Background
          Column(
            crossAxisAlignment: .start,
            spacing: 12.0,
            children: FlowbiteJumbotronBreakpoint.values.map((breakpoint) {
              double width = switch (breakpoint) {
                .desktop => 1440.0,
                .tablet => 768.0,
                .mobile => 375.0,
              };
              return SizedBox(
                width: width,
                child: FlowbiteJumbotron(
                  breakpoint: breakpoint,
                  title: "We invest in the world's potential",
                  subtitle: '''Here at flowbite we focus on markets where technology, innovation, and capital can unlock long-term value and drive economic growth.''',
                  actions: Row(
                    children: [
                      Row(
                        spacing: 8.0,
                        mainAxisSize: .min,
                        children: [
                          Text(
                            'Read more about our app',
                            style: FlowbiteFontFamily.inter(
                              fontWeight: .medium,
                              fontSize: .textLg,
                              color: FlowbiteTheme.extension(context)
                                  .textFgBrand,
                            ),
                          ),
                          Icon(
                            FlowbiteOutlineIcons.arrow_right,
                            color: FlowbiteTheme.extension(context).textFgBrand,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                  backgroundImage: AssetImage(
                    Theme.of(context).brightness == .dark
                        ? 'assets/images/pattern-dark.png'
                        : 'assets/images/pattern.png',
                    package: 'flowbite_ui',
                  ),
                  backgroundImageAlignment: .topRight,
                  backgroundImageFit: .contain,
                  backgroundImageBreakpoints: const [.desktop],
                  useRowInTablet: true,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: switch (breakpoint) {
                        .desktop => 448.0,
                        .tablet => 396.0,
                        .mobile => .infinity,
                      },
                    ),
                    height: 396.0,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.shade50,
                      borderRadius: .circular(24.0),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          // With Heading & Background
          Column(
            crossAxisAlignment: .start,
            spacing: 12.0,
            children: FlowbiteJumbotronBreakpoint.values.map((breakpoint) {
              double width = switch (breakpoint) {
                .desktop => 1440.0,
                .tablet => 768.0,
                .mobile => 375.0,
              };
              return SizedBox(
                width: width,
                child: FlowbiteJumbotron(
                  breakpoint: breakpoint,
                  title: "We invest in the world's potential",
                  subtitle: '''Here at flowbite we focus on markets where technology, innovation, and capital can unlock long-term value and drive economic growth.''',
                  actions: const SizedBox(
                    width: 384.0,
                    child: FlowbiteInputField(
                      icon: FlowbiteOutlineIcons.search,
                      hintText: 'Enter your email here',
                      showClearIcon: false,
                    ),
                  ),
                  heading: FlowbiteAlert.small(
                    text: 'Added new jumbotron component',
                    badgeText: 'New',
                    color: .info,
                  ),
                  backgroundImage: AssetImage(
                    Theme.of(context).brightness == .dark
                        ? 'assets/images/pattern-2-dark.png'
                        : 'assets/images/pattern-2.png',
                    package: 'flowbite_ui',
                  ),
                  backgroundImageAlignment: .topCenter,
                  backgroundImageFit: .cover,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

@FlowbitePreview(
  name: 'Jumbotron - Light',
  group: 'Jumbotron',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Jumbotron - Dark',
  group: 'Jumbotron',
  brightness: .dark,
)
/// Widget preview for [FlowbiteJumbotron].
Widget previewFlowbiteJumbotron() {
  return const PreviewFlowbiteJumbotron();
}
