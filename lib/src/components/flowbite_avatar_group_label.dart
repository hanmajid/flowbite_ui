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
// Flowbite library (Copyright (c) Bergside Srl), which is licensed 
// under the MIT License.

import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

enum FlowbiteAvatarGroupLabelSize { sm, base, lg, xl }

class FlowbiteAvatarGroupLabel extends StatelessWidget {
  final FlowbiteAvatarGroupLabelSize size;
  final String title;
  final String? subtitle;
  final ImageProvider? avatarImage;
  final String? avatarPlaceholder;

  const FlowbiteAvatarGroupLabel({
    required this.title,
    this.size = .base,
    this.subtitle,
    super.key,
    this.avatarImage,
    this.avatarPlaceholder,
  });

  double get _horizontalSpacing => switch (size) {
    .sm => 6.0,
    .base => 8.0,
    .lg => 10.0,
    .xl => 10.0,
  };

  FlowbiteAvatarSize get _avatarSize => switch (size) {
    .sm => subtitle != null ? .sm : .xs,
    .base => subtitle != null ? .base : .sm,
    .lg => subtitle != null ? .lg : .base,
    .xl => subtitle != null ? .xl : .lg,
  };

  // double get _verticalSpacing => switch (size) {
  //   .sm => 2.0,
  //   .base => 6.0,
  //   .lg => 6.0,
  //   .xl => 6.0,
  // };

  FlowbiteFontSize get _titleFontSize => switch (size) {
    .sm => .textXs,
    .base => .textBase,
    .lg => .textBase,
    .xl => .textXl,
  };

  FlowbiteFontSize get _subtitleFontSize => switch (size) {
    .sm => .textXs,
    .base => .textSm,
    .lg => .textBase,
    .xl => .textLg,
  };

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      FlowbiteTheme.extension(context);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      spacing: _horizontalSpacing,
      children: [
        FlowbiteAvatar(
          size: _avatarSize,
          placeholder: avatarPlaceholder,
          image: avatarImage,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: .start,
            // spacing: _verticalSpacing,
            children: [
              Text(
                title,
                style: FlowbiteFontFamily.inter(
                  fontWeight: .medium,
                  fontSize: _titleFontSize,
                  color: _colorExt(context).textHeading,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: FlowbiteFontFamily.inter(
                    fontWeight: .normal,
                    fontSize: _subtitleFontSize,
                    color: _colorExt(context).textBody,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

@FlowbitePreview(
  name: 'Input Label - Light',
  group: 'Input Label',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Input Label - Dark',
  group: 'Input Label',
  brightness: .dark,
)
Widget previewFlowbiteAvatarGroupLabel() {
  return Row(
    crossAxisAlignment: .start,
    spacing: 12.0,
    mainAxisSize: .min,
    children: [
      // With subtitle
      Column(
        crossAxisAlignment: .start,
        spacing: 6.0,
        children: FlowbiteAvatarGroupLabelSize.values
            .map(
              (size) => FlowbiteAvatarGroupLabel(
                avatarImage: FlowbiteAvatarDefaultAssets.jeseLeos
                    .toAssetImage(),
                title: 'Jese Leos',
                subtitle: 'name@flowbite.com',
                size: size,
              ),
            )
            .toList(),
      ),
      // Without subtitle
      Column(
        crossAxisAlignment: .start,
        spacing: 6.0,
        children: FlowbiteAvatarGroupLabelSize.values
            .map(
              (size) => FlowbiteAvatarGroupLabel(
                avatarImage: FlowbiteAvatarDefaultAssets.jeseLeos
                    .toAssetImage(),
                title: 'Jese Leos',
                size: size,
              ),
            )
            .toList(),
      ),
    ],
  );
}
