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

/// [FlowbiteRadioInputCard]'s data model.
class FlowbiteRadioInputCardData<T> {
  /// The input's value.
  final T value;

  /// The input's icon.
  final IconData icon;

  /// The input's title.
  final String title;

  /// The input's subtitle.
  final String subtitle;

  /// Constructor.
  new({
    required this.value,
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

/// Radio Input Card component.
class FlowbiteRadioInputCard<T> extends StatefulWidget {
  /// The input's data.
  final FlowbiteRadioInputCardData<T> data;

  /// Whether the radio is checked.
  ///
  /// Defaults to false.
  final bool isChecked;

  /// The input's on change callback.
  final ValueChanged<bool> onChanged;

  /// Constructor.
  const FlowbiteRadioInputCard({
    required this.data,
    required this.onChanged,
    this.isChecked = false,
    super.key,
  });

  @override
  State<FlowbiteRadioInputCard<T>> createState() =>
      _FlowbiteRadioInputCardState<T>();
}

class _FlowbiteRadioInputCardState<T> extends State<FlowbiteRadioInputCard<T>> {
  bool _isHovered = false;

  Color _getBorderColor(BuildContext context) => widget.isChecked
      ? FlowbiteTheme.of(context).borderBrandSubtle
      : (_isHovered
            ? FlowbiteTheme.of(context).borderBaseMedium
            : FlowbiteTheme.of(context).borderBase);

  Color _getBackgroundColor(BuildContext context) => widget.isChecked
      ? FlowbiteTheme.of(context).bgBrandSofter
      : (_isHovered
            ? FlowbiteTheme.of(context).bgNeutralSecondaryMedium
            : FlowbiteTheme.of(context).bgNeutralPrimarySoft);

  Color? _getIconShapeBackgroundColor(BuildContext context) =>
      widget.isChecked ? FlowbiteTheme.of(context).bgBrandSoft : null;

  FlowbiteIconShapeColor get _iconShapeColor =>
      widget.isChecked ? .brand : .gray;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: .circular(12.0),
      color: _getBackgroundColor(context),
      child: InkWell(
        onTap: () {
          widget.onChanged(!widget.isChecked);
        },
        onHover: (value) {
          setState(() {
            _isHovered = value;
          });
        },
        hoverColor: FlowbiteTheme.of(context).bgNeutralSecondaryMedium,
        borderRadius: .circular(12.0),
        child: Container(
          decoration: BoxDecoration(
            border: .all(color: _getBorderColor(context)),
            borderRadius: .circular(12.0),
          ),
          padding: const .all(16.0),
          child: Row(
            spacing: 10.0,
            crossAxisAlignment: .start,
            children: [
              FlowbiteIconShape(
                icon: widget.data.icon,
                type: .square,
                color: _iconShapeColor,
                backgroundColor: _getIconShapeBackgroundColor(context),
              ),
              Expanded(
                child: Column(
                  spacing: 4.0,
                  crossAxisAlignment: .stretch,
                  children: [
                    Text(
                      widget.data.title,
                      style: FlowbiteFontFamily.inter(
                        fontWeight: .medium,
                        fontSize: .textSm,
                        color: FlowbiteTheme.of(context).textHeading,
                      ),
                    ),
                    Text(
                      widget.data.subtitle,
                      style: FlowbiteFontFamily.inter(
                        fontWeight: .normal,
                        fontSize: .textSm,
                        color: FlowbiteTheme.of(context).textBody,
                      ),
                    ),
                  ],
                ),
              ),
              FlowbiteRadioInput(
                isChecked: widget.isChecked,
                onChanged: widget.onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Preview class for [FlowbiteRadioInputCard].
///
/// Only used for documentation purpose.
class PreviewFlowbiteRadioInputCard extends StatefulWidget {
  /// Constructor.
  const PreviewFlowbiteRadioInputCard({super.key});

  @override
  State<PreviewFlowbiteRadioInputCard> createState() =>
      _PreviewFlowbiteRadioInputCardState();
}

class _PreviewFlowbiteRadioInputCardState
    extends State<PreviewFlowbiteRadioInputCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.0,
      child: Column(
        spacing: 6.0,
        children: [
          FlowbiteRadioInputCard(
            isChecked: false,
            onChanged: (value) {},
            data: FlowbiteRadioInputCardData(
              value: 1,
              icon: FlowbiteOutlineIcons.truck,
              title: 'Delivery at home',
              subtitle: 'Get it delivered to your door.',
            ),
          ),
          FlowbiteRadioInputCard(
            isChecked: true,
            onChanged: (value) {},
            data: FlowbiteRadioInputCardData(
              value: 2,
              icon: FlowbiteOutlineIcons.truck,
              title: 'Delivery at home',
              subtitle: 'Get it delivered to your door.',
            ),
          ),
        ],
      ),
    );
  }
}

@FlowbitePreview(
  name: 'Radio Input Card - Light',
  group: 'Radio Input',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Radio Input Card - Dark',
  group: 'Radio Input',
  brightness: .dark,
)
/// Widget preview for [FlowbiteRadioInputCard].
Widget previewFlowbiteRadioInputCard() => const PreviewFlowbiteRadioInputCard();
