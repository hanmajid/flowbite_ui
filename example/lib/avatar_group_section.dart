import 'package:example/section_container.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

class AvatarGroupSection extends StatelessWidget {
  const AvatarGroupSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      fileName: 'avatar-group',
      child: Row(
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
                      FlowbiteAvatarDefaultAssets.leslieLivingston
                          .toAssetImage(),
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
                      FlowbiteAvatarDefaultAssets.leslieLivingston
                          .toAssetImage(),
                    ].map((image) => FlowbiteAvatar(image: image)).toList(),
                    size: size,
                    counter: '+10',
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
