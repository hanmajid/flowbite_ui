import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';

class SpinnerSection extends StatelessWidget {
  const SpinnerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.0,
      children: [
        Row(
          spacing: 16.0,
          children: [
            ...FlowbiteSpinnerSize.values.map(
              (size) => FlowbiteSpinner(size: size),
            ),
          ],
        ),
        Row(
          spacing: 16.0,
          children: [
            ...FlowbiteSpinnerSize.values.map(
              (size) => FlowbiteSpinner(size: size, showTrack: false),
            ),
          ],
        ),
      ],
    );
  }
}
