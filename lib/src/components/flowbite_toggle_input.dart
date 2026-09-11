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

import 'package:collection/collection.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

/// [FlowbiteToggleInput]'s item model.
class FlowbiteToggleInputItem {
  /// The item's label.
  final String label;

  /// Constructor.
  new({required this.label});
}

/// Toggle Input component.
class FlowbiteToggleInput extends StatelessWidget {
  /// The component's items.
  final List<FlowbiteToggleInputItem> items;

  /// The currently active index.
  final int? currentIndex;

  /// Toggle input's tap callback.
  final ValueChanged<int>? onTap;

  /// Constructor.
  const FlowbiteToggleInput({
    required this.items,
    this.currentIndex,
    this.onTap,
    super.key,
  });

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      FlowbiteTheme.extension(context);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .all(6.0),
      decoration: BoxDecoration(
        color: _colorExt(context).bgNeutralTertiaryMedium,
        borderRadius: .circular(12.0),
      ),
      child: Row(
        mainAxisSize: .min,
        spacing: 2.0,
        children: items
            .mapIndexed(
              (index, item) => _FlowbiteToggleInputWidget(
                item: item,
                isActive: index == currentIndex,
                onTap: onTap != null
                    ? () {
                        onTap!(index);
                      }
                    : null,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _FlowbiteToggleInputWidget extends StatelessWidget {
  final FlowbiteToggleInputItem item;
  final bool isActive;
  final VoidCallback? onTap;

  const new({required this.item, required this.isActive, required this.onTap});

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      FlowbiteTheme.extension(context);

  Color _getTextColor(BuildContext context) =>
      isActive ? _colorExt(context).textHeading : _colorExt(context).textBody;

  BorderRadius get _borderRadius => isActive ? .circular(6.0) : .circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isActive
          ? _colorExt(context).bgNeutralPrimaryMedium
          : Colors.transparent,
      borderRadius: _borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: _borderRadius,
        child: Container(
          height: 24.0,
          decoration: BoxDecoration(borderRadius: _borderRadius),
          padding: const .symmetric(horizontal: 8.0),
          alignment: .center,
          child: Text(
            item.label,
            textAlign: .center,
            style: FlowbiteFontFamily.inter(
              fontWeight: .medium,
              fontSize: .textXs,
              color: _getTextColor(context),
            ),
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
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.0,
      children: [
        FlowbiteToggleInput(
          items: [
            FlowbiteToggleInputItem(label: 'Toggle'),
            FlowbiteToggleInputItem(label: 'Toggle'),
            FlowbiteToggleInputItem(label: 'Toggle'),
            FlowbiteToggleInputItem(label: 'Toggle'),
          ],
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
        ),
      ],
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
