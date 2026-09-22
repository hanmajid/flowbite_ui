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
// Flowbite library (Copyright (c) Bergside Inc.), which is licensed
// under the MIT License.

import 'package:flowbite_icons/flowbite_outline_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

/// Toggle Input component.
class FlowbiteToggleInput extends StatelessWidget {
  /// The input's title.
  final String title;

  /// The input's subtitle.
  final String subtitle;

  /// The input's icon.
  final IconData icon;

  /// Whether the input is checked.
  ///
  /// Defaults to false.
  final bool isChecked;

  /// The switch's on change callback.
  final ValueChanged<bool>? onChanged;

  /// Constructor.
  const FlowbiteToggleInput({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.isChecked = false,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: FlowbiteTheme.of(context).bgNeutralPrimarySoft,
      borderRadius: .circular(12.0),
      child: InkWell(
        onTap: onChanged != null
            ? () {
                onChanged!(!isChecked);
              }
            : null,
        borderRadius: .circular(12.0),
        child: Container(
          decoration: BoxDecoration(
            border: .all(color: FlowbiteTheme.of(context).borderBase),
            borderRadius: .circular(12.0),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            spacing: 64.0,
            children: [
              Expanded(
                child: Row(
                  spacing: 10.0,
                  children: [
                    FlowbiteIconShape(icon: icon, color: .gray, type: .square),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .stretch,
                        spacing: 2.0,
                        children: [
                          Text(
                            title,
                            style: FlowbiteFontFamily.inter(
                              fontWeight: .medium,
                              fontSize: .textSm,
                              color: FlowbiteTheme.of(context).textHeading,
                            ),
                          ),
                          Text(
                            subtitle,
                            style: FlowbiteFontFamily.inter(
                              fontWeight: .normal,
                              fontSize: .textSm,
                              color: FlowbiteTheme.of(context).textBody,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FlowbiteToggleSwitch(isChecked: isChecked, onChanged: onChanged),
            ],
          ),
        ),
      ),
    );
  }
}

/// Preview class for [FlowbiteToggleInput].
///
/// Only used for documentation purpose.
class PreviewFlowbiteToggleInput extends StatefulWidget {
  /// Constructor.
  const PreviewFlowbiteToggleInput({super.key});

  @override
  State<PreviewFlowbiteToggleInput> createState() =>
      _PreviewFlowbiteToggleInputState();
}

class _PreviewFlowbiteToggleInputState
    extends State<PreviewFlowbiteToggleInput> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 576.0,
      child: Column(
        spacing: 6.0,
        children: [
          FlowbiteToggleInput(
            title: 'Weekly newsletter',
            subtitle: 'Save my credentials for easier sign-in in the future.',
            icon: FlowbiteOutlineIcons.newspapper,
            isChecked: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

@FlowbitePreview(
  name: 'Toggle Input - Light',
  group: 'Toggle Input',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Toggle Input - Dark',
  group: 'Toggle Input',
  brightness: .dark,
)
/// Widget preview for [FlowbiteToggleInput].
Widget previewFlowbiteToggleInput() => const PreviewFlowbiteToggleInput();
