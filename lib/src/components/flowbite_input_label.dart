// Copyright 2026 hanmajid (Muhammad Farhan Majid)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';

class FlowbiteInputLabel extends StatelessWidget {
  final String label;
  final bool isRequired;
  final IconData? icon;

  const FlowbiteInputLabel({
    required this.label,
    this.isRequired = false,
    this.icon,
    super.key,
  });

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      Theme.of(context).extension<FlowbiteColorsExtension>() ??
      FlowbiteTheme.lightThemeColors;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4.0,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          spacing: 2.0,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: FlowbiteFontFamily.inter(
                fontSize: FlowbiteFontSize.textSm.value,
                fontWeight: FlowbiteFontWeight.medium.value,
                color: _colorExt(context).textHeading,
              ),
            ),
            if (isRequired)
              Text(
                '*',
                style: FlowbiteFontFamily.inter(
                  fontSize: FlowbiteFontSize.textSm.value,
                  fontWeight: FlowbiteFontWeight.medium.value,
                  color: _colorExt(context).textFgDanger,
                ),
              ),
          ],
        ),
        if (icon != null)
          Icon(icon!, size: 14.0, color: _colorExt(context).textBodySubtle),
      ],
    );
  }
}

@FlowbitePreview(
  name: 'Input Label - Light',
  group: 'Input Label',
  brightness: Brightness.light,
)
@FlowbitePreview(
  name: 'Input Label - Dark',
  group: 'Input Label',
  brightness: Brightness.dark,
)
Widget previewFlowbiteInputLabel() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 6.0,
    children: [
      FlowbiteInputLabel(label: 'First name'),
      FlowbiteInputLabel(label: 'First name', isRequired: true),
      FlowbiteInputLabel(
        label: 'First name',
        isRequired: true,
        icon: FlowbiteOutlineIcons.question_mark,
      ),
    ],
  );
}
