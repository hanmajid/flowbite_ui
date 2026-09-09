import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';

class BadgeSection extends StatelessWidget {
  const BadgeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.0,
      children: [
        ...FlowbiteBadgeTheme.values.map(
          (theme) => Column(
            spacing: 12.0,
            children: [
              ...FlowbiteBadgeSize.values.map(
                (size) => FlowbiteBadge.icon(
                  size: size,
                  theme: theme,
                  text: 'Badge text',
                  icon: FlowbiteOutlineIcons.clock,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
