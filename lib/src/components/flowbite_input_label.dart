// Copyright 2026 hanmajid (Muhammad Farhan Majid)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// This file contains code adapted and ported from the open-source
// Flowbite library (Copyright (c) Bergside Srl), which is licensed
// under the MIT License.

import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

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
      FlowbiteTheme.extension(context);

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4.0,
      mainAxisSize: .min,
      children: [
        Row(
          spacing: 2.0,
          mainAxisSize: .min,
          children: [
            Text(
              label,
              style: FlowbiteFontFamily.inter(
                fontSize: .textSm,
                fontWeight: .medium,
                color: _colorExt(context).textHeading,
              ),
            ),
            if (isRequired)
              Text(
                '*',
                style: FlowbiteFontFamily.inter(
                  fontSize: .textSm,
                  fontWeight: .medium,
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
  brightness: .light,
)
@FlowbitePreview(
  name: 'Input Label - Dark',
  group: 'Input Label',
  brightness: .dark,
)
Widget previewFlowbiteInputLabel() {
  return const Column(
    crossAxisAlignment: .start,
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
