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

/// Rating component.
class FlowbiteRating extends StatelessWidget {
  /// The rating's value.
  ///
  /// Defaults to 0.0.
  final double value;

  /// The rating's on change callback.
  final ValueChanged<double>? onChanged;

  /// Whether the rating use badge.
  ///
  /// Defaults to false.
  final bool useBadge;

  /// Constructor
  const FlowbiteRating({
    this.value = 0.0,
    this.onChanged,
    this.useBadge = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      spacing: 8.0,
      children: [
        Row(
          mainAxisSize: .min,
          spacing: 4.0,
          children: [
            ...List.generate(5, (index) {
              final isFilled = value >= index + 1;
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onChanged != null
                      ? () {
                          if (index + 1 == value) {
                            onChanged!(0.0);
                          } else {
                            onChanged!(index + 1);
                          }
                        }
                      : null,
                  child: Image.asset(
                    isFilled
                        ? 'assets/images/star-filled.png'
                        : 'assets/images/star.png',
                    package: 'flowbite_ui',
                    width: 20.0,
                    height: 20.0,
                  ),
                ),
              );
            }),
          ],
        ),
        useBadge
            ? FlowbiteBadge(
                size: .sm,
                child: Text(
                  '${value.toStringAsFixed(1)} out of 5',
                  style: FlowbiteFontFamily.inter(
                    fontWeight: .medium,
                    fontSize: .textXs,
                    color: FlowbiteTheme.of(context).textFgBrandStrong,
                  ),
                ),
              )
            : Text(
                value.toStringAsFixed(1),
                style: FlowbiteFontFamily.inter(
                  fontWeight: .normal,
                  fontSize: .textSm,
                  color: FlowbiteTheme.of(context).textBody,
                ),
              ),
      ],
    );
  }
}

/// Rating Radio Input component.
class FlowbiteRatingRadioInput extends StatelessWidget {
  /// The rating's value.
  ///
  /// Defaults to 0.0.
  final double value;

  /// The rating's on change callback.
  final ValueChanged<double>? onChanged;

  /// The rating's start label.
  final String startLabel;

  /// The rating's end label.
  final String endLabel;

  /// Constructor.
  const FlowbiteRatingRadioInput({
    required this.startLabel,
    required this.endLabel,
    this.value = 0.0,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.0,
      mainAxisSize: .min,
      children: [
        Text(
          startLabel,
          style: FlowbiteFontFamily.inter(
            fontWeight: .normal,
            fontSize: .textSm,
            color: FlowbiteTheme.of(context).textHeading,
          ),
        ),
        Row(
          mainAxisSize: .min,
          children: [
            ...List.generate(6, (index) {
              return _FlowbiteRatingRadioInputItem(
                index: index,
                value: value,
                onChanged: onChanged,
              );
            }),
          ],
        ),
        Text(
          endLabel,
          style: FlowbiteFontFamily.inter(
            fontWeight: .normal,
            fontSize: .textSm,
            color: FlowbiteTheme.of(context).textHeading,
          ),
        ),
      ],
    );
  }
}

class _FlowbiteRatingRadioInputItem extends StatefulWidget {
  final int index;
  final double value;
  final ValueChanged<double>? onChanged;

  const new({
    required this.index,
    required this.value,
    required this.onChanged,
  });

  @override
  State<_FlowbiteRatingRadioInputItem> createState() =>
      _FlowbiteRatingRadioInputItemState();
}

class _FlowbiteRatingRadioInputItemState
    extends State<_FlowbiteRatingRadioInputItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isFilled = widget.value >= widget.index;
    BorderRadius borderRadius = .zero;
    if (widget.index == 0) {
      borderRadius = const .only(
        topLeft: .circular(12.0),
        bottomLeft: .circular(12.0),
      );
    } else if (widget.index == 5) {
      borderRadius = const .only(
        topRight: .circular(12.0),
        bottomRight: .circular(12.0),
      );
    }
    return Material(
      borderRadius: borderRadius,
      color: isFilled
          ? FlowbiteTheme.of(context).bgBrandSofter
          : (_isHovered
                ? FlowbiteTheme.of(context).bgNeutralSecondaryMedium
                : FlowbiteTheme.of(context).bgNeutralPrimarySoft),
      child: InkWell(
        borderRadius: borderRadius,
        hoverColor: isFilled
            ? FlowbiteTheme.of(context).bgBrandSofter
            : FlowbiteTheme.of(context).bgNeutralSecondaryMedium,
        onHover: (value) {
          setState(() {
            _isHovered = value;
          });
        },
        onTap: widget.onChanged != null
            ? () {
                if (widget.index == widget.value) {
                  widget.onChanged!(0.0);
                } else {
                  widget.onChanged!(widget.index.toDouble());
                }
              }
            : null,
        child: Container(
          alignment: .center,
          height: 36.0,
          width: 36.0,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: .all(
              color: isFilled
                  ? FlowbiteTheme.of(context).borderBrandSubtle
                  : (_isHovered
                        ? FlowbiteTheme.of(context).borderBaseMedium
                        : FlowbiteTheme.of(context).borderBase),
            ),
          ),
          child: Text(
            widget.index.toString(),
            textAlign: .center,
            style: FlowbiteFontFamily.inter(
              fontWeight: .medium,
              fontSize: .textSm,
              color: isFilled
                  ? FlowbiteTheme.of(context).textFgBrandStrong
                  : FlowbiteTheme.of(context).textHeading,
            ),
          ),
        ),
      ),
    );
  }
}

/// Preview class for [FlowbiteRating] and [FlowbiteRatingRadioInput].
///
/// Only used for documentation purpose.
class PreviewFlowbiteRating extends StatefulWidget {
  /// Constructor.
  const PreviewFlowbiteRating({super.key});

  @override
  State<PreviewFlowbiteRating> createState() => _PreviewFlowbiteRatingState();
}

class _PreviewFlowbiteRatingState extends State<PreviewFlowbiteRating> {
  double _rating = 4.8;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      spacing: 24.0,
      children: [
        FlowbiteRating(
          value: _rating,
          onChanged: (value) {
            setState(() {
              _rating = value;
            });
          },
        ),
        FlowbiteRating(
          value: _rating,
          useBadge: true,
          onChanged: (value) {
            setState(() {
              _rating = value;
            });
          },
        ),
        FlowbiteRatingRadioInput(
          value: _rating,
          startLabel: 'Not likely',
          endLabel: 'Very likely',
          onChanged: (value) {
            setState(() {
              _rating = value;
            });
          },
        ),
      ],
    );
  }
}

@FlowbitePreview(name: 'Rating - Light', group: 'Rating', brightness: .light)
@FlowbitePreview(name: 'Rating - Dark', group: 'Rating', brightness: .dark)
/// Widget preview for [FlowbiteRating] and [FlowbiteRatingRadioInput].
Widget previewFlowbiteRating() {
  return const PreviewFlowbiteRating();
}
