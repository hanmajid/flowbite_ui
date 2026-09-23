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

import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

/// Modal component.
class FlowbiteModal extends StatelessWidget {
  /// The modal's child widget.
  final Widget child;

  /// The modal's max width.
  ///
  /// Defaults to 384.0.
  final double maxWidth;

  /// The modal's inset padding.
  ///
  /// Defaults to zero.
  final EdgeInsets insetPadding;

  /// Constructor.
  const FlowbiteModal({
    required this.child,
    this.maxWidth = 384.0,
    this.insetPadding = .zero,
    super.key,
  });

  /// Factory constructor for [FlowbiteModal] (popup variant).
  factory FlowbiteModal.popup({
    required String text,
    IconData icon = FlowbiteOutlineIcons.exclamation,
    String positiveLabel = 'Confirm',
    String negativeLabel = 'No, cancel',
    VoidCallback? onPressedPositive,
    VoidCallback? onPressedNegative,
    VoidCallback? onPressedClose,
  }) {
    return FlowbiteModal(
      child: Builder(
        builder: (context) {
          return Stack(
            children: [
              Padding(
                padding: const .all(24.0),
                child: Column(
                  mainAxisSize: .min,
                  spacing: 24.0,
                  children: [
                    Column(
                      mainAxisSize: .min,
                      spacing: 16.0,
                      children: [
                        Icon(
                          icon,
                          size: 48.0,
                          color: FlowbiteTheme.of(context).textFgDisabled,
                        ),
                        Text(
                          text,
                          textAlign: .center,
                          style: FlowbiteFontFamily.inter(
                            fontWeight: .normal,
                            fontSize: .textBase,
                            color: FlowbiteTheme.of(context).textBody,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 16.0,
                      mainAxisAlignment: .center,
                      children: [
                        FlowbiteButton(
                          onPressed: onPressedPositive,
                          child: Text(positiveLabel),
                        ),
                        FlowbiteButton(
                          onPressed: onPressedNegative,
                          color: .secondary,
                          child: Text(negativeLabel),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 6.0,
                right: 6.0,
                child: FlowbiteButton.iconOnly(
                  onPressed: onPressedClose,
                  icon: const Icon(FlowbiteOutlineIcons.x),
                  color: .ghost,
                  size: .sm,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Factory constructor for [FlowbiteModal] (with radio inputs variant).
  factory FlowbiteModal.radioInputs({
    required String title,
    required String subtitle,
    required List<FlowbiteRadioInputCardData> radioInputData,
    required dynamic groupValue,
    required ValueChanged<dynamic> onChanged,
    required String buttonLabel,
    IconData? buttonLeadingIcon,
    IconData? buttonTrailingIcon,
    VoidCallback? onPressedClose,
    VoidCallback? onSubmit,
  }) {
    return FlowbiteModal(
      child: Builder(
        builder: (context) {
          return Padding(
            padding: const .all(24.0),
            child: Column(
              spacing: 24.0,
              crossAxisAlignment: .stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: FlowbiteTheme.of(context).borderBase,
                      ),
                    ),
                  ),
                  padding: const .only(bottom: 20.0),
                  child: Row(
                    spacing: 24.0,
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        title,
                        style: FlowbiteFontFamily.inter(
                          fontWeight: .medium,
                          fontSize: .textLg,
                          color: FlowbiteTheme.of(context).textHeading,
                        ),
                      ),
                      FlowbiteButton.iconOnly(
                        onPressed: onPressedClose,
                        icon: const Icon(FlowbiteOutlineIcons.x),
                        color: .ghost,
                        size: .sm,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: .stretch,
                  spacing: 16.0,
                  children: [
                    Text(
                      subtitle,
                      style: FlowbiteFontFamily.inter(
                        fontWeight: .normal,
                        fontSize: .textSm,
                        color: FlowbiteTheme.of(context).textBody,
                      ),
                    ),
                    ...radioInputData.map(
                      (data) => FlowbiteRadioInputCard(
                        data: data,
                        isChecked: groupValue == data.value,
                        onChanged: (value) {
                          if (groupValue == value) return;
                          onChanged(data.value);
                        },
                      ),
                    ),
                  ],
                ),
                FlowbiteButton.icon(
                  onPressed: onSubmit,
                  label: Text(buttonLabel),
                  leadingIcon: buttonLeadingIcon != null
                      ? Icon(buttonLeadingIcon)
                      : null,
                  trailingIcon: buttonTrailingIcon != null
                      ? Icon(buttonTrailingIcon)
                      : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: .circular(12.0),
          side: BorderSide(color: FlowbiteTheme.of(context).borderBase),
        ),
        insetPadding: insetPadding,
        backgroundColor: FlowbiteTheme.of(context).bgNeutralPrimarySoft,
        child: child,
      ),
    );
  }
}

/// Preview class for [FlowbiteModal].
///
/// Only used for documentation purpose.
class PreviewFlowbiteModal extends StatefulWidget {
  /// Constructor.
  const PreviewFlowbiteModal({super.key});

  @override
  State<PreviewFlowbiteModal> createState() => _PreviewFlowbiteModalState();
}

class _PreviewFlowbiteModalState extends State<PreviewFlowbiteModal> {
  int _selectedItem = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 16.0,
      children: [
        FlowbiteModal.popup(
          text:
              'Are you sure you want to delete this product from your account?',
          onPressedPositive: () {},
          onPressedNegative: () {},
          onPressedClose: () {},
        ),
        FlowbiteModal.radioInputs(
          title: 'Open positions',
          subtitle: 'Select your desired position:',
          groupValue: _selectedItem,
          onSubmit: () {},
          onPressedClose: () {},
          buttonLabel: 'Next step',
          buttonTrailingIcon: FlowbiteOutlineIcons.arrow_right,
          radioInputData: [
            FlowbiteRadioInputCardData(
              value: 1,
              icon: FlowbiteOutlineIcons.swatchbook,
              title: 'UI/UX Engineer',
              subtitle: 'Flowbite',
            ),
            FlowbiteRadioInputCardData(
              value: 2,
              icon: FlowbiteSocialIcons.facebook,
              title: 'React Developer',
              subtitle: 'Alphabet Inc.',
            ),
            FlowbiteRadioInputCardData(
              value: 3,
              icon: FlowbiteOutlineIcons.truck,
              title: 'Full Stack Engineer',
              subtitle: 'Meta Inc.',
            ),
            FlowbiteRadioInputCardData(
              value: 4,
              icon: FlowbiteOutlineIcons.palette,
              title: 'Graphic designer',
              subtitle: 'Microsoft Corporation',
            ),
          ],
          onChanged: (value) {
            setState(() {
              _selectedItem = value;
            });
          },
        ),
      ],
    );
  }
}

@FlowbitePreview(name: 'Modal - Light', group: 'Modal', brightness: .light)
@FlowbitePreview(name: 'Modal - Dark', group: 'Modal', brightness: .dark)
/// Widget preview for [FlowbiteModal].
Widget previewFlowbiteModal() {
  return const PreviewFlowbiteModal();
}
