import 'package:example/section_container.dart';
import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

class ButtonGroupSection extends StatelessWidget {
  const ButtonGroupSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      fileName: 'button-group',
      child: Column(
        crossAxisAlignment: .start,
        spacing: 12.0,
        children: [
          ...FlowbiteButtonGroupColor.values.map(
            (color) => Column(
              crossAxisAlignment: .start,
              spacing: 6.0,
              children: FlowbiteButtonGroupSize.values
                  .map(
                    (size) => FlowbiteButtonGroup(
                      color: color,
                      size: size,
                      items: [
                        FlowbiteButtonGroupItem(
                          text: 'Button text',
                          onTap: () {},
                        ),
                        FlowbiteButtonGroupItem(text: 'Button', onTap: () {}),
                        FlowbiteButtonGroupItem(text: 'Button text'),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
          FlowbiteButtonGroup(
            color: .white,
            size: .sm,
            items: [
              FlowbiteButtonGroupItem(text: 'Days', onTap: () {}),
              FlowbiteButtonGroupItem(text: 'Weeks', onTap: () {}),
              FlowbiteButtonGroupItem(text: 'Months', onTap: () {}),
              FlowbiteButtonGroupItem(text: 'Years', onTap: () {}),
              FlowbiteButtonGroupItem(text: 'Decades', onTap: () {}),
            ],
          ),
          FlowbiteButtonGroup(
            color: .white,
            size: .sm,
            items: [
              FlowbiteButtonGroupItem(
                icon: FlowbiteOutlineIcons.angle_left,
                onTap: () {},
              ),
              FlowbiteButtonGroupItem(
                icon: FlowbiteOutlineIcons.angle_right,
                onTap: () {},
              ),
            ],
          ),
          FlowbiteButtonGroup(
            color: .white,
            size: .sm,
            items: [
              FlowbiteButtonGroupItem(
                text: 'Download',
                icon: FlowbiteOutlineIcons.download,
                onTap: () {},
              ),
              FlowbiteButtonGroupItem(text: '456k', onTap: () {}),
            ],
          ),
          FlowbiteButtonGroup(
            color: .white,
            size: .sm,
            items: [
              FlowbiteButtonGroupItem(text: 'Save book', onTap: () {}),
              FlowbiteButtonGroupItem(
                icon: FlowbiteOutlineIcons.bookmark,
                onTap: () {},
              ),
            ],
          ),
          FlowbiteButtonGroup(
            color: .white,
            size: .sm,
            items: [
              FlowbiteButtonGroupItem(
                icon: FlowbiteOutlineIcons.align_center,
                onTap: () {},
              ),
              FlowbiteButtonGroupItem(
                icon: FlowbiteOutlineIcons.align_center,
                onTap: () {},
              ),
              FlowbiteButtonGroupItem(
                icon: FlowbiteOutlineIcons.align_center,
                onTap: () {},
              ),
              FlowbiteButtonGroupItem(
                icon: FlowbiteOutlineIcons.align_center,
                onTap: () {},
              ),
            ],
          ),
          FlowbiteButtonGroup(
            color: .white,
            size: .sm,
            items: [
              FlowbiteButtonGroupItem(
                text: 'All files',
                icon: FlowbiteOutlineIcons.file_lines,
                onTap: () {},
              ),
              FlowbiteButtonGroupItem(
                text: 'Download',
                icon: FlowbiteOutlineIcons.download,
                onTap: () {},
              ),
              FlowbiteButtonGroupItem(
                icon: FlowbiteOutlineIcons.dots_horizontal,
                onTap: () {},
              ),
            ],
          ),
          FlowbiteButtonGroup(
            color: .white,
            size: .sm,
            items: [
              FlowbiteButtonGroupItem(
                text: 'Messages',
                icon: FlowbiteOutlineIcons.envelope,
                badge: FlowbiteBadge.textOnly(
                  text: '1',
                  theme: .danger,
                  size: .xs,
                ),
                onTap: () {},
              ),
              FlowbiteButtonGroupItem(
                icon: FlowbiteOutlineIcons.angle_down,
                onTap: () {},
              ),
            ],
          ),
          FlowbiteButtonGroup(
            color: .white,
            size: .sm,
            items: [
              FlowbiteButtonGroupItem(
                icon: FlowbiteOutlineIcons.angle_left,
                onTap: () {},
              ),
              ...List.generate(
                9,
                (index) => FlowbiteButtonGroupItem(
                  text: (index + 2).toString(),
                  onTap: () {},
                ),
              ),
              FlowbiteButtonGroupItem(
                icon: FlowbiteOutlineIcons.angle_right,
                onTap: () {},
              ),
            ],
          ),
          FlowbiteButtonGroup(
            color: .white,
            size: .sm,
            items: [
              FlowbiteButtonGroupItem(
                icon: FlowbiteOutlineIcons.user_circle,
                onTap: () {},
              ),
              FlowbiteButtonGroupItem(text: 'Sign in', onTap: () {}),
            ],
          ),
          FlowbiteButtonGroup(
            color: .white,
            size: .sm,
            items: [
              FlowbiteButtonGroupItem(
                icon: FlowbiteOutlineIcons.minus,
                onTap: () {},
              ),
              FlowbiteButtonGroupItem(text: '104', onTap: () {}),
              FlowbiteButtonGroupItem(
                icon: FlowbiteOutlineIcons.plus,
                onTap: () {},
              ),
            ],
          ),
          FlowbiteButtonGroup(
            color: .white,
            size: .sm,
            direction: .vertical,
            width: 192.0,
            items: [
              FlowbiteButtonGroupItem(text: 'Days', onTap: () {}),
              FlowbiteButtonGroupItem(text: 'Weeks', onTap: () {}),
              FlowbiteButtonGroupItem(text: 'Months', onTap: () {}),
              FlowbiteButtonGroupItem(text: 'Years', onTap: () {}),
              FlowbiteButtonGroupItem(text: 'Decades', onTap: () {}),
            ],
          ),
          FlowbiteButtonGroup(
            color: .white,
            size: .sm,
            direction: .vertical,
            items: [
              FlowbiteButtonGroupItem(
                icon: FlowbiteOutlineIcons.align_center,
                onTap: () {},
              ),
              FlowbiteButtonGroupItem(
                icon: FlowbiteOutlineIcons.align_center,
                onTap: () {},
              ),
              FlowbiteButtonGroupItem(
                icon: FlowbiteOutlineIcons.align_center,
                onTap: () {},
              ),
              FlowbiteButtonGroupItem(
                icon: FlowbiteOutlineIcons.align_center,
                onTap: () {},
              ),
              FlowbiteButtonGroupItem(
                icon: FlowbiteOutlineIcons.dots_horizontal,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
