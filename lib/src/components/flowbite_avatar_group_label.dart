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

import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';

enum FlowbiteAvatarGroupLabelSize { sm, base, lg, xl }

class FlowbiteAvatarGroupLabel extends StatelessWidget {
  final FlowbiteAvatarGroupLabelSize size;
  final String title;
  final String? subtitle;
  final ImageProvider? avatarImage;
  final String? avatarPlaceholder;

  const FlowbiteAvatarGroupLabel({
    required this.title,
    this.size = FlowbiteAvatarGroupLabelSize.base,
    this.subtitle,
    super.key,
    this.avatarImage,
    this.avatarPlaceholder,
  });

  double get _horizontalSpacing => switch (size) {
    FlowbiteAvatarGroupLabelSize.sm => 6.0,
    FlowbiteAvatarGroupLabelSize.base => 8.0,
    FlowbiteAvatarGroupLabelSize.lg => 10.0,
    FlowbiteAvatarGroupLabelSize.xl => 10.0,
  };

  FlowbiteAvatarSize get _avatarSize => switch (size) {
    FlowbiteAvatarGroupLabelSize.sm =>
      subtitle != null ? FlowbiteAvatarSize.sm : FlowbiteAvatarSize.xs,
    FlowbiteAvatarGroupLabelSize.base =>
      subtitle != null ? FlowbiteAvatarSize.base : FlowbiteAvatarSize.sm,
    FlowbiteAvatarGroupLabelSize.lg =>
      subtitle != null ? FlowbiteAvatarSize.lg : FlowbiteAvatarSize.base,
    FlowbiteAvatarGroupLabelSize.xl =>
      subtitle != null ? FlowbiteAvatarSize.xl : FlowbiteAvatarSize.lg,
  };

  // double get _verticalSpacing => switch (size) {
  //   FlowbiteAvatarGroupLabelSize.sm => 2.0,
  //   FlowbiteAvatarGroupLabelSize.base => 6.0,
  //   FlowbiteAvatarGroupLabelSize.lg => 6.0,
  //   FlowbiteAvatarGroupLabelSize.xl => 6.0,
  // };

  FlowbiteFontSize get _titleFontSize => switch (size) {
    FlowbiteAvatarGroupLabelSize.sm => FlowbiteFontSize.textXs,
    FlowbiteAvatarGroupLabelSize.base => FlowbiteFontSize.textBase,
    FlowbiteAvatarGroupLabelSize.lg => FlowbiteFontSize.textBase,
    FlowbiteAvatarGroupLabelSize.xl => FlowbiteFontSize.textXl,
  };

  FlowbiteFontSize get _subtitleFontSize => switch (size) {
    FlowbiteAvatarGroupLabelSize.sm => FlowbiteFontSize.textXs,
    FlowbiteAvatarGroupLabelSize.base => FlowbiteFontSize.textSm,
    FlowbiteAvatarGroupLabelSize.lg => FlowbiteFontSize.textBase,
    FlowbiteAvatarGroupLabelSize.xl => FlowbiteFontSize.textLg,
  };

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      Theme.of(context).extension<FlowbiteColorsExtension>() ??
      FlowbiteTheme.lightThemeColors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: _horizontalSpacing,
      children: [
        FlowbiteAvatar(
          size: _avatarSize,
          placeholder: avatarPlaceholder,
          image: avatarImage,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // spacing: _verticalSpacing,
            children: [
              Text(
                title,
                style: FlowbiteFontFamily.inter(
                  fontWeight: FlowbiteFontWeight.medium.value,
                  fontSize: _titleFontSize.value,
                  color: _colorExt(context).textHeading,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: FlowbiteFontFamily.inter(
                    fontWeight: FlowbiteFontWeight.normal.value,
                    fontSize: _subtitleFontSize.value,
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
  brightness: Brightness.light,
)
@FlowbitePreview(
  name: 'Input Label - Dark',
  group: 'Input Label',
  brightness: Brightness.dark,
)
Widget previewFlowbiteAvatarGroupLabel() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 12.0,
    mainAxisSize: MainAxisSize.min,
    children: [
      // With subtitle
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6.0,
        children: FlowbiteAvatarGroupLabelSize.values
            .map(
              (size) => FlowbiteAvatarGroupLabel(
                avatarImage: const AssetImage(
                  'assets/images/avatar-jese-leos.png',
                  package: 'flowbite_ui',
                ),
                title: 'Jese Leos',
                subtitle: 'name@flowbite.com',
                size: size,
              ),
            )
            .toList(),
      ),
      // Without subtitle
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6.0,
        children: FlowbiteAvatarGroupLabelSize.values
            .map(
              (size) => FlowbiteAvatarGroupLabel(
                avatarImage: const AssetImage(
                  'assets/images/avatar-jese-leos.png',
                  package: 'flowbite_ui',
                ),
                title: 'Jese Leos',
                size: size,
              ),
            )
            .toList(),
      ),
    ],
  );
}
