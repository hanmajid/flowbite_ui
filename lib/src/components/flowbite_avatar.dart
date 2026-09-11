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

import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

enum FlowbiteAvatarDefaultAssets {
  bonnieGreen('assets/images/avatar-bonnie-green.png'),
  heleneEngels('assets/images/avatar-helene-engels.png'),
  jeseLeos('assets/images/avatar-jese-leos.png'),
  josephMcFall('assets/images/avatar-joseph-mcfall.png'),
  karenNelson('assets/images/avatar-karen-nelson.png'),
  lanaByrd('assets/images/avatar-lana-byrd.png'),
  leslieLivingston('assets/images/avatar-leslie-livingston.png'),
  michealGough('assets/images/avatar-micheal-gough.png'),
  neilSims('assets/images/avatar-neil-sims.png'),
  robertBrown('assets/images/avatar-robert-brown.png'),
  robertaCasas('assets/images/avatar-roberta-casas.png'),
  thomasLean('assets/images/avatar-thomas-lean.png');

  final String assetName;

  const new(this.assetName);

  AssetImage toAssetImage() {
    return AssetImage(assetName, package: 'flowbite_ui');
  }
}

enum FlowbiteAvatarSize { xs, sm, base, lg, xl, xl2 }

class FlowbiteAvatar extends StatelessWidget {
  final FlowbiteAvatarSize size;
  final ImageProvider? image;
  final String? placeholder;
  final bool showDot;
  final FlowbiteAvatarDotStatus dotStatus;
  final bool showRemoveButton;
  final VoidCallback? onTapRemoveButton;

  const FlowbiteAvatar({
    this.size = .base,
    this.image,
    this.placeholder,
    this.showDot = false,
    this.dotStatus = .alternative,
    this.showRemoveButton = false,
    this.onTapRemoveButton,
    super.key,
  });

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      FlowbiteTheme.extension(context);

  double get _size => switch (size) {
    .xs => 18.0,
    .sm => 24.0,
    .base => 32.0,
    .lg => 44.0,
    .xl => 56.0,
    .xl2 => 64.0,
  };

  FlowbiteFontSize get _fontSize => switch (size) {
    .xs => .textXxs,
    .sm => .textXs,
    .base => .textSm,
    .lg => .textLg,
    .xl => .text2xl,
    .xl2 => .text2xl,
  };

  FlowbiteAvatarDotSize get _dotSize => switch (size) {
    .xs => .xs,
    .sm => .base,
    .base => .lg,
    .lg => .lg,
    .xl => .xl,
    .xl2 => .xl,
  };

  double get _offsetDotTop => switch (size) {
    .xs => 0.0,
    .sm => 1.0,
    .base => 1.0,
    .lg => 4.0,
    .xl => 2.0,
    .xl2 => 4.0,
  };

  double get _offsetDotRight => switch (size) {
    .xs => -1.0,
    .sm => -2.0,
    .base => -1.0,
    .lg => -3.0,
    .xl => -2.0,
    .xl2 => -1.0,
  };

  FlowbiteAvatarRemoveButtonSize get _removeButtonSize => switch (size) {
    .xs => .xs,
    .sm => .sm,
    .base => .base,
    .lg => .base,
    .xl => .lg,
    .xl2 => .lg,
  };

  double get _offsetRemoveButtonTop => switch (size) {
    .xs => -2.0,
    .sm => -2.0,
    .base => 0.0,
    .lg => 3.0,
    .xl => 1.0,
    .xl2 => 3.0,
  };

  double get _offsetRemoveButtonRight => switch (size) {
    .xs => -6.0,
    .sm => -6.0,
    .base => -6.0,
    .lg => -6.0,
    .xl => -6.0,
    .xl2 => -5.0,
  };

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: .none,
      children: [
        FittedBox(
          fit: .scaleDown,
          child: Container(
            height: _size,
            width: _size,
            decoration: BoxDecoration(
              borderRadius: .circular(100.0),
              color: _colorExt(context).bgNeutralTertiary,
              image: image != null ? DecorationImage(image: image!) : null,
            ),
            alignment: .center,
            child: placeholder != null && image == null
                ? Text(
                    placeholder!,
                    style: FlowbiteFontFamily.inter(
                      fontWeight: .semibold,
                      fontSize: _fontSize,
                      color: _colorExt(context).textBody,
                    ),
                  )
                : null,
          ),
        ),
        if (showDot && !showRemoveButton)
          Positioned(
            top: _offsetDotTop,
            right: _offsetDotRight,
            child: _FlowbiteAvatarDot(size: _dotSize, status: dotStatus),
          ),
        if (showRemoveButton)
          Positioned(
            top: _offsetRemoveButtonTop,
            right: _offsetRemoveButtonRight,
            child: _FlowbiteAvatarRemoveButton(
              size: _removeButtonSize,
              onTap: onTapRemoveButton,
            ),
          ),
      ],
    );
  }
}

enum FlowbiteAvatarDotSize { xs, sm, base, lg, xl }

enum FlowbiteAvatarDotStatus { online, offline, alternative }

class _FlowbiteAvatarDot extends StatelessWidget {
  final FlowbiteAvatarDotSize size;
  final FlowbiteAvatarDotStatus status;

  const new({this.size = .base, this.status = .alternative});

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      FlowbiteTheme.extension(context);

  double get _size => switch (size) {
    .xs => 6.0,
    .sm => 8.0,
    .base => 10.0,
    .lg => 12.0,
    .xl => 16.0,
  };

  Color _getColor(BuildContext context) {
    return switch (status) {
      .online => _colorExt(context).bgSuccess,
      .offline => _colorExt(context).bgDanger,
      .alternative => _colorExt(context).bgGray,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: .scaleDown,
      child: Container(
        decoration: BoxDecoration(shape: .circle, color: _getColor(context)),
        height: _size,
        width: _size,
      ),
    );
  }
}

enum FlowbiteAvatarRemoveButtonSize { xs, sm, base, lg }

class _FlowbiteAvatarRemoveButton extends StatelessWidget {
  final FlowbiteAvatarRemoveButtonSize size;
  final VoidCallback? onTap;

  const new({this.size = .base, this.onTap});

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      FlowbiteTheme.extension(context);

  double get _size => switch (size) {
    .xs => 12.0,
    .sm => 14.0,
    .base => 16.0,
    .lg => 20.0,
  };

  double get _iconSize => switch (size) {
    .xs => 8.0,
    .sm => 10.0,
    .base => 12.0,
    .lg => 14.0,
  };

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: .scaleDown,
      child: Material(
        color: _colorExt(context).bgNeutralTertiaryMedium,
        borderRadius: .circular(100.0),
        child: InkWell(
          onTap: onTap,
          borderRadius: .circular(100.0),
          child: Container(
            decoration: BoxDecoration(borderRadius: .circular(100.0)),
            height: _size,
            width: _size,
            alignment: .center,
            child: Icon(
              FlowbiteOutlineIcons.x,
              size: _iconSize,
              color: _colorExt(context).textBody,
            ),
          ),
        ),
      ),
    );
  }
}

@FlowbitePreview(name: 'Avatar - Light', group: 'Avatar', brightness: .light)
@FlowbitePreview(name: 'Avatar - Dark', group: 'Avatar', brightness: .dark)
Widget previewFlowbiteAvatar() {
  return Row(
    spacing: 12.0,
    mainAxisSize: .min,
    children: [
      // Image
      Column(
        spacing: 6.0,
        verticalDirection: .up,
        children: FlowbiteAvatarSize.values
            .map(
              (size) => FlowbiteAvatar(
                size: size,
                image: FlowbiteAvatarDefaultAssets.jeseLeos.toAssetImage(),
              ),
            )
            .toList(),
      ),
      // Image && showDot=true
      Column(
        spacing: 6.0,
        verticalDirection: .up,
        children: FlowbiteAvatarSize.values
            .map(
              (size) => FlowbiteAvatar(
                size: size,
                showDot: true,
                image: FlowbiteAvatarDefaultAssets.jeseLeos.toAssetImage(),
                dotStatus: FlowbiteAvatarDotStatus.online,
              ),
            )
            .toList(),
      ),
      // Image && showRemoveButton=true
      Column(
        spacing: 6.0,
        verticalDirection: .up,
        children: FlowbiteAvatarSize.values
            .map(
              (size) => FlowbiteAvatar(
                size: size,
                showRemoveButton: true,
                onTapRemoveButton: () {},
                image: FlowbiteAvatarDefaultAssets.jeseLeos.toAssetImage(),
              ),
            )
            .toList(),
      ),
      // Placeholder
      Column(
        spacing: 6.0,
        verticalDirection: .up,
        children: FlowbiteAvatarSize.values
            .map((size) => FlowbiteAvatar(size: size, placeholder: 'PH'))
            .toList(),
      ),
    ],
  );
}

@FlowbitePreview(
  name: 'Avatar Dot - Light',
  group: 'Avatar',
  brightness: .light,
)
@FlowbitePreview(name: 'Avatar Dot - Dark', group: 'Avatar', brightness: .dark)
Widget previewFlowbiteAvatarDot() {
  return Column(
    spacing: 12.0,
    children: FlowbiteAvatarDotStatus.values
        .map(
          (status) => Row(
            mainAxisSize: .min,
            spacing: 6.0,
            children: FlowbiteAvatarDotSize.values
                .map((size) => _FlowbiteAvatarDot(size: size, status: status))
                .toList(),
          ),
        )
        .toList(),
  );
}

@FlowbitePreview(
  name: 'Avatar Remove Button - Light',
  group: 'Avatar',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Avatar Remove Button - Dark',
  group: 'Avatar',
  brightness: .dark,
)
Widget previewFlowbiteAvatarRemoveButton() {
  return Row(
    mainAxisSize: .min,
    spacing: 6.0,
    children: FlowbiteAvatarRemoveButtonSize.values
        .map((size) => _FlowbiteAvatarRemoveButton(size: size, onTap: () {}))
        .toList(),
  );
}
