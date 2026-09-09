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
                    image: const AssetImage(
                      'assets/images/avatar-jese-leos.png',
                      package: 'flowbite_ui',
                    ),
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
                    image: const AssetImage(
                      'assets/images/avatar-jese-leos.png',
                      package: 'flowbite_ui',
                    ),
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
                    image: const AssetImage(
                      'assets/images/avatar-jese-leos.png',
                      package: 'flowbite_ui',
                    ),
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
