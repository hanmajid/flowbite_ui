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

/// [FlowbiteChatBubble] orientation variant.
enum FlowbiteChatBubbleOrientation {
  /// Right orientation variant.
  right,

  /// Left orientation variant.
  left,
}

/// Chat Bubble component.
class FlowbiteChatBubble extends StatelessWidget {
  /// The chat bubble's avatar.
  final FlowbiteAvatar avatar;

  /// The chat bubble's sender name.
  final String senderName;

  /// The chat bubble's sent time.
  final String time;

  /// The chat bubble's status.
  final String status;

  /// The chat bubble's tap menu callback.
  final VoidCallback? onTapMenu;

  /// The chat bubble's orientation.
  ///
  /// Defaults to [FlowbiteChatBubbleOrientation.right];
  final FlowbiteChatBubbleOrientation orientation;

  /// Whether the chat bubble is clean or not.
  ///
  /// Defaults to false.
  final bool isClean;

  /// The chat bubble's content child.
  final Widget child;

  /// Constructor.
  const FlowbiteChatBubble({
    required this.avatar,
    required this.senderName,
    required this.time,
    required this.status,
    required this.child,
    this.onTapMenu,
    this.orientation = .right,
    this.isClean = false,
    super.key,
  });

  BorderRadius get _borderRadius => switch (orientation) {
    .left => const .only(
      topLeft: .circular(12.0),
      bottomLeft: .circular(12.0),
      bottomRight: .circular(12.0),
    ),
    .right => const .only(
      topRight: .circular(12.0),
      bottomLeft: .circular(12.0),
      bottomRight: .circular(12.0),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.0,
      crossAxisAlignment: .start,
      children: [
        if (orientation == .right) avatar,
        Expanded(child: _buildBubble(context)),
        if (orientation == .left) avatar,
      ],
    );
  }

  /// [FlowbiteChatBubble]'s factory constructor for text content.
  factory FlowbiteChatBubble.text({
    required String text,
    required FlowbiteAvatar avatar,
    required String senderName,
    required String time,
    required String status,
    VoidCallback? onTapMenu,
    FlowbiteChatBubbleOrientation orientation = .right,
    bool isClean = false,
  }) {
    return FlowbiteChatBubble(
      avatar: avatar,
      senderName: senderName,
      time: time,
      status: status,
      onTapMenu: onTapMenu,
      orientation: orientation,
      isClean: isClean,
      child: Builder(
        builder: (context) {
          return Text(
            text,
            style: FlowbiteFontFamily.inter(
              fontWeight: .normal,
              fontSize: .textSm,
              color: FlowbiteTheme.of(context).textBody,
            ),
          );
        },
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTapMenu,
        child: Icon(
          FlowbiteOutlineIcons.dots_vertical,
          color: FlowbiteTheme.of(context).textBody,
          size: 20.0,
        ),
      ),
    );
  }

  Widget _buildBubble(BuildContext context) {
    return Row(
      spacing: 10.0,
      children: [
        if (orientation == .left) _buildMenu(context),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: isClean
                  ? null
                  : FlowbiteTheme.of(context).bgNeutralTertiary,
            ),
            padding: isClean ? null : const .all(16.0),
            child: Column(
              crossAxisAlignment: .stretch,
              spacing: 16.0,
              children: [
                Row(
                  spacing: 6.0,
                  mainAxisSize: .min,
                  children: [
                    Text(
                      senderName,
                      style: FlowbiteFontFamily.inter(
                        fontWeight: .semibold,
                        fontSize: .textSm,
                        color: FlowbiteTheme.of(context).textHeading,
                      ),
                    ),
                    Text(
                      senderName,
                      style: FlowbiteFontFamily.inter(
                        fontWeight: .normal,
                        fontSize: .textSm,
                        color: FlowbiteTheme.of(context).textBody,
                      ),
                    ),
                  ],
                ),
                child,
                Text(
                  status,
                  style: FlowbiteFontFamily.inter(
                    fontWeight: .normal,
                    fontSize: .textSm,
                    color: FlowbiteTheme.of(context).textBodySubtle,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (orientation == .right) _buildMenu(context),
      ],
    );
  }
}

/// Preview class for [FlowbiteChatBubble].
///
/// Only used for documentation purpose.
class PreviewFlowbiteChatBubble extends StatelessWidget {
  /// Constructor.
  const PreviewFlowbiteChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.0,
      children: [false, true]
          .map(
            (isClean) => SizedBox(
              width: 392.0,
              child: Column(
                crossAxisAlignment: .start,
                spacing: 12.0,
                children: FlowbiteChatBubbleOrientation.values
                    .map(
                      (orientation) => FlowbiteChatBubble.text(
                        avatar: FlowbiteAvatar(
                          image: FlowbiteAvatarDefaultAssets.josephMcFall
                              .toAssetImage(),
                        ),
                        orientation: orientation,
                        isClean: isClean,
                        senderName: 'Bonnie Green',
                        time: '11:46',
                        status: 'Delivered',
                        onTapMenu: () {},
                        text: '''That's awesome. I think our users will really appreciate the improvements.''',
                      ),
                    )
                    .toList(),
              ),
            ),
          )
          .toList(),
    );
  }
}

@FlowbitePreview(
  name: 'Chat Bubble - Light',
  group: 'Chat Bubble',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Chat Bubble - Dark',
  group: 'Chat Bubble',
  brightness: .dark,
)
/// Widget preview for [FlowbiteChatBubble].
Widget previewFlowbiteChatBubble() {
  return const PreviewFlowbiteChatBubble();
}
