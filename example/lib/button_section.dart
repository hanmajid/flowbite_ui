import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...FlowbiteButtonColor.values.map(
          (color) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8.0,
            children: [
              ...FlowbiteButtonSize.values.map(
                (size) => Column(
                  spacing: 8.0,
                  children: [
                    FlowbiteButton.icon(
                      onPressed: () {},
                      label: Text('Button text'),
                      leadingIcon: Icon(FlowbiteOutlineIcons.arrow_left),
                      trailingIcon: Icon(FlowbiteOutlineIcons.arrow_right),
                      color: color,
                      size: size,
                    ),
                    FlowbiteButton.icon(
                      onPressed: null,
                      label: Text('Button text'),
                      leadingIcon: Icon(FlowbiteOutlineIcons.arrow_left),
                      trailingIcon: Icon(FlowbiteOutlineIcons.arrow_right),
                      color: color,
                      size: size,
                    ),
                  ],
                ),
              ),
              ...FlowbiteButtonSize.values.map(
                (size) => Column(
                  spacing: 8.0,
                  children: [
                    FlowbiteButton.iconOnly(
                      onPressed: () {},
                      icon: Icon(FlowbiteOutlineIcons.heart),
                      color: color,
                      size: size,
                    ),
                    FlowbiteButton.iconOnly(
                      onPressed: null,
                      icon: Icon(FlowbiteOutlineIcons.heart),
                      color: color,
                      size: size,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ...FlowbiteOutlinedButtonColor.values.map(
          (color) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8.0,
            children: [
              ...FlowbiteButtonSize.values.map(
                (size) => Column(
                  spacing: 8.0,
                  children: [
                    FlowbiteOutlinedButton.icon(
                      onPressed: () {},
                      label: Text('Button text'),
                      leadingIcon: Icon(FlowbiteOutlineIcons.arrow_left),
                      trailingIcon: Icon(FlowbiteOutlineIcons.arrow_right),
                      color: color,
                      size: size,
                    ),
                    FlowbiteOutlinedButton.icon(
                      onPressed: null,
                      label: Text('Button text'),
                      leadingIcon: Icon(FlowbiteOutlineIcons.arrow_left),
                      trailingIcon: Icon(FlowbiteOutlineIcons.arrow_right),
                      color: color,
                      size: size,
                    ),
                  ],
                ),
              ),
              ...FlowbiteButtonSize.values.map(
                (size) => Column(
                  spacing: 8.0,
                  children: [
                    FlowbiteOutlinedButton.iconOnly(
                      onPressed: () {},
                      icon: Icon(FlowbiteOutlineIcons.heart),
                      color: color,
                      size: size,
                    ),
                    FlowbiteOutlinedButton.iconOnly(
                      onPressed: null,
                      icon: Icon(FlowbiteOutlineIcons.heart),
                      color: color,
                      size: size,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
