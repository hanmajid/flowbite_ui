import 'package:example/section_container.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

class SpinnerSection extends StatelessWidget {
  const SpinnerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      fileName: 'spinner',
      child: Column(
        spacing: 16.0,
        children: [
          Row(
            spacing: 16.0,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...FlowbiteSpinnerSize.values.map(
                (size) => FlowbiteSpinner(size: size, value: 0.25),
              ),
            ],
          ),
          Row(
            spacing: 16.0,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...FlowbiteSpinnerSize.values.map(
                (size) =>
                    FlowbiteSpinner(size: size, value: 0.25, showTrack: false),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
