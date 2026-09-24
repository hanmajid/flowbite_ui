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

/// [FlowbiteAvatar]'s default assets.
enum FlowbiteAvatarDefaultAssets {
  /// Bonnie Green's avatar asset path.
  bonnieGreen('assets/images/avatar-bonnie-green.png'),

  /// Helene Engels' avatar asset path.
  heleneEngels('assets/images/avatar-helene-engels.png'),

  /// Jese Leos' avatar asset path.
  jeseLeos('assets/images/avatar-jese-leos.png'),

  /// Josh McFall's avatar asset path.
  josephMcFall('assets/images/avatar-joseph-mcfall.png'),

  /// Karen Nelson's avatar asset path.
  karenNelson('assets/images/avatar-karen-nelson.png'),

  /// Lana Byrd's avatar asset path.
  lanaByrd('assets/images/avatar-lana-byrd.png'),

  /// Leslie Livingston's avatar asset path.
  leslieLivingston('assets/images/avatar-leslie-livingston.png'),

  /// Michal Gough's avatar asset path.
  michealGough('assets/images/avatar-micheal-gough.png'),

  /// Neil Sims' avatar asset path.
  neilSims('assets/images/avatar-neil-sims.png'),

  /// Robert Brown's avatar asset path.
  robertBrown('assets/images/avatar-robert-brown.png'),

  /// Roberta Casas' avatar asset path.
  robertaCasas('assets/images/avatar-roberta-casas.png'),

  /// Thomas Lean's avatar asset path.
  thomasLean('assets/images/avatar-thomas-lean.png');

  /// The avatar's asset name/path.
  final String assetName;

  const new(this.assetName);

  /// Get the [AssetImage] instance of the asset.
  AssetImage toAssetImage() {
    return AssetImage(assetName, package: 'flowbite_ui');
  }
}

/// [FlowbiteAvatar]'s size variant.
enum FlowbiteAvatarSize {
  /// Extra small size variant.
  xs,

  /// Small size variant.
  sm,

  /// Base/normal size variant.
  base,

  /// Large size variant.
  lg,

  /// Extra large size variant.
  xl,

  /// Extra extra large size variant.
  xl2,
}

/// [FlowbiteAvatar]'s dot size variant.
enum FlowbiteAvatarDotSize {
  /// Extra small size variant.
  xs,

  /// Small size variant.
  sm,

  /// Base/default size variant.
  base,

  /// Large size variant.
  lg,

  /// Extra large size variant.
  xl,
}

/// [FlowbiteAvatar]'s dot status variant.
enum FlowbiteAvatarDotStatus {
  /// Online status variant.
  online,

  /// Offline status variant.
  offline,

  /// Alternative status variant.
  alternative,
}

enum _FlowbiteAvatarRemoveButtonSize { xs, sm, base, lg }

/// Avatar component.
class FlowbiteAvatar extends StatelessWidget {
  /// The avatar's size.
  ///
  /// Defaults to [FlowbiteAvatarSize.base].
  final FlowbiteAvatarSize size;

  /// The avatar's image.
  final ImageProvider? image;

  /// The avatar's placeholder text.
  final String? placeholder;

  /// Whether to show dot.
  ///
  /// Defaults to false.
  final bool showDot;

  /// The avatar dot's status.
  ///
  /// Defaults to [FlowbiteAvatarDotStatus.alternative].
  final FlowbiteAvatarDotStatus dotStatus;

  /// Whether to show remove button.
  ///
  /// Defaults to false.
  final bool showRemoveButton;

  /// The remove button's tap callback.
  final VoidCallback? onTapRemoveButton;

  /// Constructor.
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

  _FlowbiteAvatarRemoveButtonSize get _removeButtonSize => switch (size) {
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
              color: FlowbiteTheme.of(context).bgNeutralTertiary,
              image: image != null ? DecorationImage(image: image!) : null,
            ),
            alignment: .center,
            child: placeholder != null && image == null
                ? Text(
                    placeholder!,
                    style: FlowbiteFontFamily.inter(
                      fontWeight: .semibold,
                      fontSize: _fontSize,
                      color: FlowbiteTheme.of(context).textBody,
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

class _FlowbiteAvatarDot extends StatelessWidget {
  final FlowbiteAvatarDotSize size;
  final FlowbiteAvatarDotStatus status;

  const new({this.size = .base, this.status = .alternative});

  double get _size => switch (size) {
    .xs => 6.0,
    .sm => 8.0,
    .base => 10.0,
    .lg => 12.0,
    .xl => 16.0,
  };

  Color _getColor(BuildContext context) {
    return switch (status) {
      .online => FlowbiteTheme.of(context).bgSuccess,
      .offline => FlowbiteTheme.of(context).bgDanger,
      .alternative => FlowbiteTheme.of(context).bgGray,
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

class _FlowbiteAvatarRemoveButton extends StatelessWidget {
  final _FlowbiteAvatarRemoveButtonSize size;
  final VoidCallback? onTap;

  const new({this.size = .base, this.onTap});

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
        color: FlowbiteTheme.of(context).bgNeutralTertiaryMedium,
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
              color: FlowbiteTheme.of(context).textBody,
            ),
          ),
        ),
      ),
    );
  }
}

@FlowbitePreview(name: 'Avatar - Light', group: 'Avatar', brightness: .light)
@FlowbitePreview(name: 'Avatar - Dark', group: 'Avatar', brightness: .dark)
/// Widget preview for [FlowbiteAvatar].
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
/// Widget preview for [_FlowbiteAvatarDot].
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
/// Widget preview for [_FlowbiteAvatarRemoveButton].
Widget previewFlowbiteAvatarRemoveButton() {
  return Row(
    mainAxisSize: .min,
    spacing: 6.0,
    children: _FlowbiteAvatarRemoveButtonSize.values
        .map((size) => _FlowbiteAvatarRemoveButton(size: size, onTap: () {}))
        .toList(),
  );
}
