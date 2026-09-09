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
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';

enum FlowbiteAvatarGroupSize { sm, base, lg }

class FlowbiteAvatarGroup extends StatelessWidget {
  final List<FlowbiteAvatar> avatars;
  final FlowbiteAvatarGroupSize size;
  final String? counter;

  const FlowbiteAvatarGroup({
    required this.avatars,
    this.size = .base,
    this.counter,
    super.key,
  });

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      Theme.of(context).extension<FlowbiteColorsExtension>() ??
      FlowbiteTheme.lightThemeColors;

  FlowbiteAvatarSize get _avatarSize => switch (size) {
    .sm => .sm,
    .base => .base,
    .lg => .lg,
  };

  double get _avatarOffset => switch (size) {
    .sm => 16.0,
    .base => 18.0,
    .lg => 28.0,
  };

  double get _avatarHeight => switch (size) {
    .sm => 24.0,
    .base => 32.0,
    .lg => 44.0,
  };

  double get _borderWidth => switch (size) {
    .sm => 1.0,
    .base => 2.0,
    .lg => 2.0,
  };

  FlowbiteFontSize get _fontSize => switch (size) {
    .sm => .textXxs,
    .base => .textXs,
    .lg => .textSm,
  };

  @override
  Widget build(BuildContext context) {
    int avatarCount = avatars.length;
    if (counter != null) {
      avatarCount++;
    }

    final double containerWidth =
        (avatarCount * _avatarHeight) -
        ((avatarCount - 1) * (_avatarHeight - _avatarOffset));

    return Stack(
      clipBehavior: .none,
      children: [
        SizedBox(width: containerWidth, height: _avatarHeight),
        ...avatars.mapIndexed(
          (index, avatar) => Positioned(
            left: index * _avatarOffset,
            child: Container(
              decoration: BoxDecoration(
                border: .all(
                  color: _colorExt(context).borderBuffer,
                  width: _borderWidth,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
                shape: .circle,
              ),
              child: FlowbiteAvatar(
                image: avatar.image,
                placeholder: avatar.placeholder,
                size: _avatarSize,
              ),
            ),
          ),
        ),
        if (counter != null)
          Positioned(
            left: avatars.length * _avatarOffset,
            child: _buildCounter(context),
          ),
      ],
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      height: _avatarHeight,
      width: _avatarHeight,
      decoration: BoxDecoration(
        border: .all(
          color: _colorExt(context).borderBuffer,
          width: _borderWidth,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
        color: _colorExt(context).bgNeutralQuaternary,
        shape: .circle,
      ),
      alignment: .center,
      child: Text(
        counter!,
        textAlign: .center,
        style: FlowbiteFontFamily.inter(
          fontWeight: .medium,
          fontSize: _fontSize,
          color: _colorExt(context).textBody,
        ),
      ),
    );
  }
}

@FlowbitePreview(
  name: 'Avatar Group - Light',
  group: 'Avatar Group',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Avatar Group - Dark',
  group: 'Avatar Group',
  brightness: .dark,
)
Widget previewFlowbiteAvatarGroup() {
  return Row(
    spacing: 12.0,
    mainAxisSize: .min,
    children: [
      // Without counter
      Column(
        crossAxisAlignment: .start,
        spacing: 6.0,
        children: FlowbiteAvatarGroupSize.values
            .map(
              (size) => FlowbiteAvatarGroup(
                avatars: [
                  FlowbiteAvatarDefaultAssets.josephMcFall.toAssetImage(),
                  FlowbiteAvatarDefaultAssets.neilSims.toAssetImage(),
                  FlowbiteAvatarDefaultAssets.karenNelson.toAssetImage(),
                  FlowbiteAvatarDefaultAssets.robertBrown.toAssetImage(),
                  FlowbiteAvatarDefaultAssets.leslieLivingston.toAssetImage(),
                ].map((image) => FlowbiteAvatar(image: image)).toList(),
                size: size,
              ),
            )
            .toList(),
      ),
      // With counter
      Column(
        crossAxisAlignment: .start,
        spacing: 6.0,
        children: FlowbiteAvatarGroupSize.values
            .map(
              (size) => FlowbiteAvatarGroup(
                avatars: [
                  FlowbiteAvatarDefaultAssets.josephMcFall.toAssetImage(),
                  FlowbiteAvatarDefaultAssets.neilSims.toAssetImage(),
                  FlowbiteAvatarDefaultAssets.karenNelson.toAssetImage(),
                  FlowbiteAvatarDefaultAssets.robertBrown.toAssetImage(),
                  FlowbiteAvatarDefaultAssets.leslieLivingston.toAssetImage(),
                ].map((image) => FlowbiteAvatar(image: image)).toList(),
                size: size,
                counter: '+10',
              ),
            )
            .toList(),
      ),
    ],
  );
}
