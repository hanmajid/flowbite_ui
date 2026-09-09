import 'package:example/section_container.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';

class AvatarGroupLabelSection extends StatelessWidget {
  const AvatarGroupLabelSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      fileName: 'avatar-group-label',
      child: Row(
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
    );
  }
}
