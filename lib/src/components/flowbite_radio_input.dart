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

import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

/// Radio Input component.
class FlowbiteRadioInput extends StatefulWidget {
  /// Whether the radio is checked.
  ///
  /// Defaults to false.
  final bool isChecked;

  /// The input's on change callback.
  final ValueChanged<bool>? onChanged;

  /// Constructor.
  const FlowbiteRadioInput({this.isChecked = false, this.onChanged, super.key});

  @override
  State<FlowbiteRadioInput> createState() => _FlowbiteRadioInputState();
}

class _FlowbiteRadioInputState extends State<FlowbiteRadioInput> {
  bool _isFocused = false;

  bool get _isDisabled => widget.onChanged == null;

  Color _getBorderColor(BuildContext context) => _isDisabled
      ? FlowbiteTheme.of(context).borderLight
      : (widget.isChecked
            ? FlowbiteTheme.of(context).borderBrand
            : FlowbiteTheme.of(context).borderBaseStrong);

  Color _getCenterColor(BuildContext context) => _isDisabled
      ? FlowbiteTheme.of(context).bgNeutralQuaternary
      : FlowbiteTheme.of(context).bgBrand;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: .circular(9999.0),
        boxShadow: _isFocused
            ? [
                BoxShadow(
                  color: FlowbiteColors.bgBrandMedium,
                  spreadRadius: 2.0,
                  blurRadius: 0.0,
                  offset: const Offset(0.0, 0.0),
                ),
              ]
            : null,
      ),
      child: Material(
        color: FlowbiteTheme.of(context).bgNeutralSecondaryStrong,
        borderRadius: .circular(9999.0),
        child: InkWell(
          onTap: widget.onChanged != null
              ? () {
                  widget.onChanged!(!widget.isChecked);
                }
              : null,
          borderRadius: .circular(9999.0),
          onFocusChange: (value) {
            setState(() {
              _isFocused = value;
            });
          },
          child: Container(
            height: 16.0,
            width: 16.0,
            decoration: BoxDecoration(
              borderRadius: .circular(9999.0),
              border: .all(
                color: _getBorderColor(context),
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            child: widget.isChecked
                ? Center(
                    child: Container(
                      height: 8.0,
                      width: 8.0,
                      decoration: BoxDecoration(
                        shape: .circle,
                        color: _getCenterColor(context),
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

/// Preview class for [FlowbiteRadioInput].
///
/// Only used for documentation purpose.
class PreviewFlowbiteRadioInput extends StatefulWidget {
  /// Constructor.
  const PreviewFlowbiteRadioInput({super.key});

  @override
  State<PreviewFlowbiteRadioInput> createState() =>
      _PreviewFlowbiteRadioInputState();
}

class _PreviewFlowbiteRadioInputState extends State<PreviewFlowbiteRadioInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.0,
      children: [
        Row(
          mainAxisSize: .min,
          spacing: 6.0,
          children: [
            FlowbiteRadioInput(isChecked: false, onChanged: (value) {}),
            const FlowbiteRadioInput(isChecked: false),
          ],
        ),
        Row(
          mainAxisSize: .min,
          spacing: 6.0,
          children: [
            FlowbiteRadioInput(isChecked: true, onChanged: (value) {}),
            const FlowbiteRadioInput(isChecked: true),
          ],
        ),
      ],
    );
  }
}

@FlowbitePreview(
  name: 'Radio Input - Light',
  group: 'Radio Input',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Radio Input - Dark',
  group: 'Radio Input',
  brightness: .dark,
)
/// Widget preview for [FlowbiteRadioInput].
Widget previewFlowbiteRadioInput() => const PreviewFlowbiteRadioInput();
