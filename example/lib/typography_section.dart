import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';

class TypographySection extends StatelessWidget {
  const TypographySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24.0,
      children: [_buildFontWeights(context), _buildFontSizes(context)],
    );
  }

  Widget _buildFontWeights(BuildContext context) {
    return Column(
      spacing: 8.0,
      children: [
        Text('Font Weights'),
        ...FlowbiteFontWeight.values.map(
          (fontWeight) => Row(
            spacing: 24.0,
            children: [
              SizedBox(
                width: 200.0,
                child: Text(
                  fontWeight.name,
                  style: FlowbiteFontFamily.inter(
                    fontWeight: .normal,
                    fontSize: .textBase,
                    color: FlowbiteColors.textFgBrand,
                  ),
                ),
              ),
              Text(
                'Flowbite UI',
                style: FlowbiteFontFamily.inter(
                  fontWeight: fontWeight,
                  fontSize: .textBase,
                  color: FlowbiteColors.textBlack,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFontSizes(BuildContext context) {
    return Column(
      spacing: 8.0,
      children: [
        Text('Font Sizes'),
        ...FlowbiteFontSize.values.map(
          (fontSize) => Row(
            spacing: 24.0,
            children: [
              SizedBox(
                width: 200.0,
                child: Text(
                  fontSize.name,
                  style: FlowbiteFontFamily.inter(
                    fontWeight: .normal,
                    fontSize: .textBase,
                    color: FlowbiteColors.textFgBrand,
                  ),
                ),
              ),
              Text(
                'Flowbite UI',
                style: FlowbiteFontFamily.inter(
                  fontWeight: .semibold,
                  fontSize: fontSize,
                  color: FlowbiteColors.textBlack,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
