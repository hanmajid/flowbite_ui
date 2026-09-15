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

/// KBD component.
class FlowbiteKbd extends StatelessWidget {
  /// The KBD's child.
  final Widget child;

  /// The KBD's tap callback.
  final VoidCallback? onTap;

  /// Constructor.
  const FlowbiteKbd({required this.child, super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: .scaleDown,
      child: Material(
        borderRadius: .circular(12.0),
        color: FlowbiteTheme.of(context).bgNeutralTertiary,
        child: InkWell(
          onTap: onTap,
          borderRadius: .circular(12.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: .circular(12.0),
              border: .all(color: FlowbiteTheme.of(context).borderBaseMedium),
            ),
            padding: const .symmetric(vertical: 6.0, horizontal: 8.0),
            alignment: .center,
            child: child,
          ),
        ),
      ),
    );
  }

  /// Factory constructor for [FlowbiteKbd] with text as [child].
  factory FlowbiteKbd.text({required String text, VoidCallback? onTap}) {
    return FlowbiteKbd(
      onTap: onTap,
      child: Builder(
        builder: (context) {
          return Text(
            text,
            textAlign: .center,
            style: FlowbiteFontFamily.inter(
              fontWeight: .semibold,
              fontSize: .textXs,
              color: FlowbiteTheme.of(context).textHeading,
            ),
          );
        },
      ),
    );
  }

  /// Factory constructor for [FlowbiteKbd] with icon as [child].
  factory FlowbiteKbd.icon({
    required IconData icon,
    double? size,
    VoidCallback? onTap,
  }) {
    return FlowbiteKbd(
      onTap: onTap,
      child: Builder(
        builder: (context) {
          return Icon(
            icon,
            size: size,
            color: FlowbiteTheme.of(context).textHeading,
          );
        },
      ),
    );
  }
}

/// Preview class for [FlowbiteKbd].
///
/// Only used for documentation purpose.
class PreviewFlowbiteKbd extends StatelessWidget {
  /// Constructor.
  const PreviewFlowbiteKbd({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.0,
      child: Wrap(
        crossAxisAlignment: .start,
        spacing: 6.0,
        runSpacing: 6.0,
        children: [
          ...[
            'Shift',
            'Ctrl',
            'Tab',
            'Caps Lock',
            'Esc',
            'Spacebar',
            'Enter',
            'Q',
            'W',
            'E',
            'R',
            'T',
            'Y',
            'U',
            'I',
            'O',
            'P',
            'A',
            'S',
            'D',
            'F',
            'G',
            'H',
            'J',
            'K',
            'L',
            'Z',
            'X',
            'C',
            'V',
            'B',
            'N',
            'M',
            ...List.generate(12, (i) => 'F${i + 1}'),
          ].map((text) => FlowbiteKbd.text(text: text, onTap: () {})),
          ...[
            FlowbiteSolidIcons.caret_left,
            FlowbiteSolidIcons.caret_right,
            FlowbiteSolidIcons.caret_down,
            FlowbiteSolidIcons.caret_up,
          ].map(
            (icon) => FlowbiteKbd.icon(icon: icon, size: 14.0, onTap: () {}),
          ),
        ],
      ),
    );
  }
}

@FlowbitePreview(name: 'KBD - Light', group: 'KBD', brightness: .light)
@FlowbitePreview(name: 'KBD - Dark', group: 'KBD', brightness: .dark)
/// Widget preview for [FlowbiteKbd].
Widget previewFlowbiteKbd() {
  return const PreviewFlowbiteKbd();
}
