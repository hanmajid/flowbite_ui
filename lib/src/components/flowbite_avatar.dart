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

import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';

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
    this.size = FlowbiteAvatarSize.base,
    this.image,
    this.placeholder,
    this.showDot = false,
    this.dotStatus = FlowbiteAvatarDotStatus.alternative,
    this.showRemoveButton = false,
    this.onTapRemoveButton,
    super.key,
  });

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      Theme.of(context).extension<FlowbiteColorsExtension>() ??
      FlowbiteTheme.lightThemeColors;

  double get _size => switch (size) {
    FlowbiteAvatarSize.xs => 18.0,
    FlowbiteAvatarSize.sm => 24.0,
    FlowbiteAvatarSize.base => 32.0,
    FlowbiteAvatarSize.lg => 44.0,
    FlowbiteAvatarSize.xl => 56.0,
    FlowbiteAvatarSize.xl2 => 64.0,
  };

  FlowbiteFontSize get _fontSize => switch (size) {
    FlowbiteAvatarSize.xs => FlowbiteFontSize.textXxs,
    FlowbiteAvatarSize.sm => FlowbiteFontSize.textXs,
    FlowbiteAvatarSize.base => FlowbiteFontSize.textSm,
    FlowbiteAvatarSize.lg => FlowbiteFontSize.textLg,
    FlowbiteAvatarSize.xl => FlowbiteFontSize.text2xl,
    FlowbiteAvatarSize.xl2 => FlowbiteFontSize.text2xl,
  };

  FlowbiteAvatarDotSize get _dotSize => switch (size) {
    FlowbiteAvatarSize.xs => FlowbiteAvatarDotSize.xs,
    FlowbiteAvatarSize.sm => FlowbiteAvatarDotSize.base,
    FlowbiteAvatarSize.base => FlowbiteAvatarDotSize.lg,
    FlowbiteAvatarSize.lg => FlowbiteAvatarDotSize.lg,
    FlowbiteAvatarSize.xl => FlowbiteAvatarDotSize.xl,
    FlowbiteAvatarSize.xl2 => FlowbiteAvatarDotSize.xl,
  };

  double get _offsetDotTop => switch (size) {
    FlowbiteAvatarSize.xs => 0.0,
    FlowbiteAvatarSize.sm => 1.0,
    FlowbiteAvatarSize.base => 1.0,
    FlowbiteAvatarSize.lg => 4.0,
    FlowbiteAvatarSize.xl => 2.0,
    FlowbiteAvatarSize.xl2 => 4.0,
  };

  double get _offsetDotRight => switch (size) {
    FlowbiteAvatarSize.xs => -1.0,
    FlowbiteAvatarSize.sm => -2.0,
    FlowbiteAvatarSize.base => -1.0,
    FlowbiteAvatarSize.lg => -3.0,
    FlowbiteAvatarSize.xl => -2.0,
    FlowbiteAvatarSize.xl2 => -1.0,
  };

  FlowbiteAvatarRemoveButtonSize get _removeButtonSize => switch (size) {
    FlowbiteAvatarSize.xs => FlowbiteAvatarRemoveButtonSize.xs,
    FlowbiteAvatarSize.sm => FlowbiteAvatarRemoveButtonSize.sm,
    FlowbiteAvatarSize.base => FlowbiteAvatarRemoveButtonSize.base,
    FlowbiteAvatarSize.lg => FlowbiteAvatarRemoveButtonSize.base,
    FlowbiteAvatarSize.xl => FlowbiteAvatarRemoveButtonSize.lg,
    FlowbiteAvatarSize.xl2 => FlowbiteAvatarRemoveButtonSize.lg,
  };

  double get _offsetRemoveButtonTop => switch (size) {
    FlowbiteAvatarSize.xs => -2.0,
    FlowbiteAvatarSize.sm => -2.0,
    FlowbiteAvatarSize.base => 0.0,
    FlowbiteAvatarSize.lg => 3.0,
    FlowbiteAvatarSize.xl => 1.0,
    FlowbiteAvatarSize.xl2 => 3.0,
  };

  double get _offsetRemoveButtonRight => switch (size) {
    FlowbiteAvatarSize.xs => -6.0,
    FlowbiteAvatarSize.sm => -6.0,
    FlowbiteAvatarSize.base => -6.0,
    FlowbiteAvatarSize.lg => -6.0,
    FlowbiteAvatarSize.xl => -6.0,
    FlowbiteAvatarSize.xl2 => -5.0,
  };

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            height: _size,
            width: _size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: _colorExt(context).bgNeutralTertiary,
              image: image != null ? DecorationImage(image: image!) : null,
            ),
            alignment: Alignment.center,
            child: placeholder != null && image == null
                ? Text(
                    placeholder!,
                    style: FlowbiteFontFamily.inter(
                      fontWeight: FlowbiteFontWeight.semibold.value,
                      fontSize: _fontSize.value,
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

  const new({
    this.size = FlowbiteAvatarDotSize.base,
    this.status = FlowbiteAvatarDotStatus.alternative,
  });

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      Theme.of(context).extension<FlowbiteColorsExtension>() ??
      FlowbiteTheme.lightThemeColors;

  double get _size => switch (size) {
    FlowbiteAvatarDotSize.xs => 6.0,
    FlowbiteAvatarDotSize.sm => 8.0,
    FlowbiteAvatarDotSize.base => 10.0,
    FlowbiteAvatarDotSize.lg => 12.0,
    FlowbiteAvatarDotSize.xl => 16.0,
  };

  Color _getColor(BuildContext context) {
    return switch (status) {
      FlowbiteAvatarDotStatus.online => _colorExt(context).bgSuccess,
      FlowbiteAvatarDotStatus.offline => _colorExt(context).bgDanger,
      FlowbiteAvatarDotStatus.alternative => _colorExt(context).bgGray,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _getColor(context),
        ),
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

  const new({this.size = FlowbiteAvatarRemoveButtonSize.base, this.onTap});

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      Theme.of(context).extension<FlowbiteColorsExtension>() ??
      FlowbiteTheme.lightThemeColors;

  double get _size => switch (size) {
    FlowbiteAvatarRemoveButtonSize.xs => 12.0,
    FlowbiteAvatarRemoveButtonSize.sm => 14.0,
    FlowbiteAvatarRemoveButtonSize.base => 16.0,
    FlowbiteAvatarRemoveButtonSize.lg => 20.0,
  };

  double get _iconSize => switch (size) {
    FlowbiteAvatarRemoveButtonSize.xs => 8.0,
    FlowbiteAvatarRemoveButtonSize.sm => 10.0,
    FlowbiteAvatarRemoveButtonSize.base => 12.0,
    FlowbiteAvatarRemoveButtonSize.lg => 14.0,
  };

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Material(
        color: _colorExt(context).bgNeutralTertiaryMedium,
        borderRadius: BorderRadius.circular(100.0),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
            ),
            height: _size,
            width: _size,
            alignment: Alignment.center,
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

@FlowbitePreview(
  name: 'Avatar - Light',
  group: 'Avatar',
  brightness: Brightness.light,
)
@FlowbitePreview(
  name: 'Avatar - Dark',
  group: 'Avatar',
  brightness: Brightness.dark,
)
Widget previewFlowbiteAvatar() {
  return Row(
    spacing: 12.0,
    mainAxisSize: MainAxisSize.min,
    children: [
      // Image
      Column(
        spacing: 6.0,
        verticalDirection: VerticalDirection.up,
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
        verticalDirection: VerticalDirection.up,
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
        verticalDirection: VerticalDirection.up,
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
        verticalDirection: VerticalDirection.up,
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
  brightness: Brightness.light,
)
@FlowbitePreview(
  name: 'Avatar Dot - Dark',
  group: 'Avatar',
  brightness: Brightness.dark,
)
Widget previewFlowbiteAvatarDot() {
  return Column(
    spacing: 12.0,
    children: FlowbiteAvatarDotStatus.values
        .map(
          (status) => Row(
            mainAxisSize: MainAxisSize.min,
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
  brightness: Brightness.light,
)
@FlowbitePreview(
  name: 'Avatar Remove Button - Dark',
  group: 'Avatar',
  brightness: Brightness.dark,
)
Widget previewFlowbiteAvatarRemoveButton() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    spacing: 6.0,
    children: FlowbiteAvatarRemoveButtonSize.values
        .map((size) => _FlowbiteAvatarRemoveButton(size: size, onTap: () {}))
        .toList(),
  );
}
