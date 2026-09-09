import 'package:example/section_container.dart';
import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';

class IconShapeSection extends StatelessWidget {
  const IconShapeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      fileName: 'icon-shape',
      child: Column(
        spacing: 24.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...FlowbiteIconShapeType.values.map(
            (type) => Row(
              spacing: 16.0,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...FlowbiteIconShapeColor.values.map(
                  (color) => Column(
                    spacing: 8.0,
                    children: [
                      ...FlowbiteIconShapeSize.values.map(
                        (size) => FlowbiteIconShape(
                          icon: FlowbiteOutlineIcons.fire,
                          type: type,
                          color: color,
                          size: size,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
