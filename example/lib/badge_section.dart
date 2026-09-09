import 'package:example/section_container.dart';
import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';

class BadgeSection extends StatelessWidget {
  const BadgeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      fileName: 'badge',
      child: Column(
        spacing: 18.0,
        crossAxisAlignment: .start,
        children: [
          // With icon
          Column(
            spacing: 6.0,
            crossAxisAlignment: .start,
            children: FlowbiteBadgeSize.values
                .map(
                  (size) => Row(
                    spacing: 6.0,
                    mainAxisSize: .min,
                    children: FlowbiteBadgeTheme.values
                        .map(
                          (theme) => FlowbiteBadge.icon(
                            text: 'Badge text',
                            icon: FlowbiteOutlineIcons.clock,
                            theme: theme,
                            size: size,
                            onTap: () {},
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
          // With avatar
          Column(
            spacing: 6.0,
            crossAxisAlignment: .start,
            children: FlowbiteBadgeSize.values
                .map(
                  (size) => Row(
                    spacing: 6.0,
                    mainAxisSize: .min,
                    children: FlowbiteBadgeTheme.values
                        .map(
                          (theme) => FlowbiteBadge.avatar(
                            text: 'Badge text',
                            avatar: FlowbiteAvatar(
                              image: FlowbiteAvatarDefaultAssets.bonnieGreen
                                  .toAssetImage(),
                            ),
                            theme: theme,
                            size: size,
                            onTap: () {},
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
          // With dot
          Column(
            spacing: 6.0,
            crossAxisAlignment: .start,
            children: FlowbiteBadgeSize.values
                .map(
                  (size) => Row(
                    spacing: 6.0,
                    mainAxisSize: .min,
                    children: FlowbiteBadgeTheme.values
                        .map(
                          (theme) => FlowbiteBadge.dot(
                            text: 'Badge text',
                            theme: theme,
                            size: size,
                            onTap: () {},
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
          // With spinner
          Column(
            spacing: 6.0,
            crossAxisAlignment: .start,
            children: FlowbiteBadgeSize.values
                .map(
                  (size) => Row(
                    spacing: 6.0,
                    mainAxisSize: .min,
                    children: FlowbiteBadgeTheme.values
                        .map(
                          (theme) => FlowbiteBadge.spinner(
                            text: 'Badge text',
                            spinner: const FlowbiteSpinner(value: 0.3),
                            theme: theme,
                            size: size,
                            onTap: () {},
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
          // With icon + secondary text
          Column(
            spacing: 6.0,
            crossAxisAlignment: .start,
            children: FlowbiteBadgeSize.values
                .map(
                  (size) => Row(
                    spacing: 6.0,
                    mainAxisSize: .min,
                    children: FlowbiteBadgeTheme.values
                        .map(
                          (theme) => FlowbiteBadge.icon(
                            text: 'Badge text',
                            secondaryText: 'Secondary text',
                            icon: FlowbiteOutlineIcons.clock,
                            theme: theme,
                            size: size,
                            onTap: () {},
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
          // Icon only
          Column(
            spacing: 6.0,
            crossAxisAlignment: .start,
            children: FlowbiteBadgeSize.values
                .map(
                  (size) => Row(
                    spacing: 6.0,
                    mainAxisSize: .min,
                    children: FlowbiteBadgeTheme.values
                        .map(
                          (theme) => FlowbiteBadge.iconOnly(
                            icon: FlowbiteOutlineIcons.clock,
                            theme: theme,
                            size: size,
                            onTap: () {},
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
          // Text only
          Column(
            spacing: 6.0,
            crossAxisAlignment: .start,
            children: FlowbiteBadgeSize.values
                .map(
                  (size) => Row(
                    spacing: 6.0,
                    mainAxisSize: .min,
                    children: FlowbiteBadgeTheme.values
                        .map(
                          (theme) => FlowbiteBadge.textOnly(
                            text: '1',
                            theme: theme,
                            size: size,
                            onTap: () {},
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
