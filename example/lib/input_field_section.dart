import 'package:flowbite_icons/flowbite_outline_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';

class InputFieldSection extends StatelessWidget {
  const InputFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24.0,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...FlowbiteInputFieldSize.values.map(
          (size) => Row(
            spacing: 12.0,
            children: [
              Expanded(
                child: FlowbiteInputField(
                  label: 'First name',
                  isRequired: true,
                  labelIcon: FlowbiteOutlineIcons.question_mark,
                  size: size,
                  icon: FlowbiteOutlineIcons.user,
                  helperText: 'Weak password. Must contain:',
                ),
              ),
              Expanded(
                child: FlowbiteInputField(
                  size: size,
                  icon: FlowbiteOutlineIcons.user,
                  enabled: false,
                ),
              ),
              Expanded(
                child: FlowbiteInputField(
                  size: size,
                  icon: FlowbiteOutlineIcons.user,
                  readOnly: true,
                  controller: TextEditingController(text: 'initial value'),
                ),
              ),
              Expanded(
                child: FlowbiteInputField(
                  size: size,
                  icon: FlowbiteOutlineIcons.user,
                  isSuccess: true,
                ),
              ),
              Expanded(
                child: FlowbiteInputField(
                  size: size,
                  icon: FlowbiteOutlineIcons.user,
                  isDanger: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
