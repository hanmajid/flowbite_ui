import 'package:example/section_container.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';

class AvatarSection extends StatelessWidget {
  const AvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      fileName: 'avatar',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 12.0,
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
      ),
    );
  }
}
