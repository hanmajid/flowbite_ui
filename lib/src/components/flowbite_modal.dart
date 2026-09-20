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
  /// The modal's text.
  final String text;

  /// The modal's icon.
  final IconData icon;

  /// The positive button's tap callback.
  final VoidCallback? onPressedPositive;

  /// The negative button's tap callback.
  final VoidCallback? onPressedNegative;

  /// The positive button's label.
  final String positiveLabel;

  /// The negative button's label.
  final String negativeLabel;

  /// The close button's tap callback.
  final VoidCallback? onPressedClose;

  /// Constructor.
  const FlowbiteModal({
    required this.text,
    this.icon = FlowbiteOutlineIcons.exclamation,
    this.positiveLabel = 'Confirm',
    this.negativeLabel = 'No, cancel',
    this.onPressedPositive,
    this.onPressedNegative,
    this.onPressedClose,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 384.0),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: .circular(12.0),
          side: BorderSide(color: FlowbiteTheme.of(context).borderBase),
        ),
        backgroundColor: FlowbiteTheme.of(context).bgNeutralPrimarySoft,
        child: Stack(
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
        ),
      ),
    );
  }
}

/// Preview class for [FlowbiteModal].
///
/// Only used for documentation purpose.
class PreviewFlowbiteModal extends StatelessWidget {
  /// Constructor.
  const PreviewFlowbiteModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 16.0,
      children: [
        FlowbiteModal(
          text:
              'Are you sure you want to delete this product from your account?',
          onPressedPositive: () {},
          onPressedNegative: () {},
          onPressedClose: () {},
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
