import 'package:example/section_container.dart';
import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

class AlertSection extends StatelessWidget {
  const AlertSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      fileName: 'alert',
      child: Row(
        spacing: 16.0,
        children: [
          ...FlowbiteAlertColor.values.map(
            (color) => Expanded(
              child: Column(
                spacing: 16.0,
                children: [
                  FlowbiteAlert(
                    text: "Great job! You've acknowledged this significant alert message.",
                    color: color,
                    onTapClose: () {},
                  ),
                  FlowbiteAlert.complex(
                    heading: 'Alert heading',
                    text: "Great job! You've acknowledged this significant alert message.",
                    color: color,
                    onTapClose: () {},
                    buttonLabel: 'Learn more',
                    leadingIcon: Icon(FlowbiteOutlineIcons.open_book),
                    onPressedButton: () {},
                  ),
                  FlowbiteAlert.small(
                    text: "Great job! You've acknowledged this significant alert message.",
                    badgeText: 'New',
                    color: color,
                    onTapClose: () {},
                    onTap: () {},
                  ),
                  FlowbiteAlert.borderTop(
                    text: "Great job! You've acknowledged this significant alert message.",
                    color: color,
                    onTapClose: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
