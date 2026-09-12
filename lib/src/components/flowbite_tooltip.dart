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

import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

/// [FlowbiteTooltip] position variant.
enum FlowbiteTooltipPosition {
  /// Top position variant.
  top,

  /// Bottom position variant.
  bottom,

  // TODO: Handle left & right variants.
  // /// Left position variant.
  // left,

  // /// Right position variant.
  // right,
}

/// Tooltip component.
class FlowbiteTooltip extends StatelessWidget {
  /// The tooltip's child.
  final Widget child;

  /// The tooltip's position.
  ///
  /// Defaults to [FlowbiteTooltipPosition.top].
  final FlowbiteTooltipPosition position;

  /// Constructor.
  const FlowbiteTooltip({required this.child, this.position = .top, super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      preferBelow: position == .bottom,
      richMessage: WidgetSpan(child: richMessage),
      padding: .zero,
      decoration: const BoxDecoration(),
      child: child,
    );
  }

  // Only used for documentation.
  //
  // ignore: public_member_api_docs
  Widget get richMessage {
    return Builder(
      builder: (context) {
        List<Widget> children = [
          Container(
            decoration: BoxDecoration(
              color: FlowbiteTheme.extension(context).bgDark,
              borderRadius: .circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  spreadRadius: 0.0,
                  blurRadius: 3.0,
                  offset: const Offset(0.0, 1.0),
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  spreadRadius: -1.0,
                  blurRadius: 2.0,
                  offset: const Offset(0.0, 1.0),
                ),
              ],
            ),
            padding: const .symmetric(horizontal: 12.0, vertical: 8.0),
            child: Text(
              'Tooltip text here',
              style: FlowbiteFontFamily.inter(
                fontWeight: .medium,
                fontSize: .textSm,
                color: FlowbiteTheme.extension(context).textWhite,
              ),
            ),
          ),
        ];
        if (position == .top) {
          children.add(
            Image.asset(
              Theme.of(context).brightness == .dark
                  ? 'assets/images/arrow-dark.png'
                  : 'assets/images/arrow-light.png',
              package: 'flowbite_ui',
              width: 34.0,
              height: 8.0,
            ),
          );
        } else {
          children.insert(
            0,
            RotatedBox(
              quarterTurns: 2,
              child: Image.asset(
                Theme.of(context).brightness == .dark
                    ? 'assets/images/arrow-dark.png'
                    : 'assets/images/arrow-light.png',
                package: 'flowbite_ui',
                width: 34.0,
                height: 8.0,
              ),
            ),
          );
        }
        return Column(children: children);
      },
    );
  }
}

/// Preview class for [FlowbiteTooltip].
///
/// Only used for documentation purpose.
class PreviewFlowbiteTooltip extends StatelessWidget {
  /// Constructor.
  const PreviewFlowbiteTooltip({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 16.0,
      children: FlowbiteTooltipPosition.values
          .map(
            (position) => FlowbiteTooltip(
              position: position,
              child: const SizedBox(),
            ).richMessage,
          )
          .toList(),
    );
  }
}

@FlowbitePreview(name: 'Tooltip - Light', group: 'Tooltip', brightness: .light)
@FlowbitePreview(name: 'Tooltip - Dark', group: 'Tooltip', brightness: .dark)
/// Widget preview for [FlowbiteTooltip].
Widget previewFlowbiteTooltip() {
  return const PreviewFlowbiteTooltip();
}
