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

enum FlowbiteInputFieldSize { sm, base, lg, xl }

class FlowbiteInputField extends StatefulWidget {
  final FlowbiteInputFieldSize size;
  final bool enabled;
  final bool readOnly;
  final IconData? icon;
  final VoidCallback? onTapClear;
  final TextEditingController? controller;
  final bool isSuccess;
  final bool isDanger;
  final String? label;
  final bool isRequired;
  final IconData? labelIcon;
  final String? helperText;

  const FlowbiteInputField({
    this.size = FlowbiteInputFieldSize.base,
    this.enabled = true,
    this.readOnly = false,
    this.icon,
    this.onTapClear,
    this.controller,
    this.isSuccess = false,
    this.isDanger = false,
    this.label,
    this.isRequired = false,
    this.labelIcon,
    this.helperText,
    super.key,
  });

  @override
  State<FlowbiteInputField> createState() => _FlowbiteInputFieldState();
}

class _FlowbiteInputFieldState extends State<FlowbiteInputField> {
  late final FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()
      ..addListener(() {
        setState(() {
          _isFocused = _focusNode.hasFocus;
        });
      });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  FlowbiteColorsExtension _colorExt(BuildContext context) =>
      Theme.of(context).extension<FlowbiteColorsExtension>()!;

  double get _iconSize => switch (widget.size) {
    FlowbiteInputFieldSize.sm => 16.0,
    FlowbiteInputFieldSize.base => 16.0,
    FlowbiteInputFieldSize.lg => 20.0,
    FlowbiteInputFieldSize.xl => 20.0,
  };

  double get _horizontalPadding => switch (widget.size) {
    FlowbiteInputFieldSize.sm => 10.0,
    FlowbiteInputFieldSize.base => 12.0,
    FlowbiteInputFieldSize.lg => 14.0,
    FlowbiteInputFieldSize.xl => 16.0,
  };

  double get _containerHeight => switch (widget.size) {
    FlowbiteInputFieldSize.sm => 36.0,
    FlowbiteInputFieldSize.base => 40.0,
    FlowbiteInputFieldSize.lg => 48.0,
    FlowbiteInputFieldSize.xl => 52.0,
  };

  FlowbiteFontSize get _fontSize => switch (widget.size) {
    FlowbiteInputFieldSize.sm => FlowbiteFontSize.textSm,
    FlowbiteInputFieldSize.base => FlowbiteFontSize.textSm,
    FlowbiteInputFieldSize.lg => FlowbiteFontSize.textBase,
    FlowbiteInputFieldSize.xl => FlowbiteFontSize.textBase,
  };

  Color _getIconColor(BuildContext context) {
    if (!widget.enabled) {
      return _colorExt(context).textFgDisabled;
    } else if (widget.readOnly) {
      return _colorExt(context).textBody;
    } else if (widget.isSuccess) {
      return _colorExt(context).textFgSuccessStrong;
    } else if (widget.isDanger) {
      return _colorExt(context).textFgDangerStrong;
    } else if (_isFocused) {
      return _colorExt(context).textFgBrand;
    }
    return _colorExt(context).textBodySubtle;
  }

  Color _getBorderColor(BuildContext context) {
    if (widget.isSuccess) {
      return _colorExt(context).borderSuccessSubtle;
    } else if (widget.isDanger) {
      return _colorExt(context).borderDangerSubtle;
    } else if (_isFocused && !widget.readOnly) {
      return _colorExt(context).borderBrand;
    }
    return _colorExt(context).borderBaseMedium;
  }

  Color _getBackgroundColor(BuildContext context) {
    if (widget.readOnly) {
      return _colorExt(context).bgNeutralTertiary;
    } else if (widget.isSuccess) {
      return _colorExt(context).bgSuccessSoft;
    } else if (widget.isDanger) {
      return _colorExt(context).bgDangerSoft;
    }
    return _colorExt(context).bgNeutralSecondaryMedium;
  }

  Color _getTextColor(BuildContext context) {
    if (!widget.enabled) {
      return _colorExt(context).textFgDisabled;
    } else if (widget.readOnly) {
      return _colorExt(context).textBody;
    } else if (widget.isSuccess) {
      return _colorExt(context).textFgSuccessStrong;
    } else if (widget.isDanger) {
      return _colorExt(context).textFgDangerStrong;
    }
    return _colorExt(context).textHeading;
  }

  Color _getCursorColor(BuildContext context) {
    if (widget.isSuccess) {
      return _colorExt(context).textFgSuccessStrong;
    } else if (widget.isDanger) {
      return _colorExt(context).textFgDangerStrong;
    }
    return _colorExt(context).textHeading;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null)
          FlowbiteInputLabel(
            label: widget.label!,
            isRequired: widget.isRequired,
            icon: widget.labelIcon,
          ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
          alignment: Alignment.center,
          height: _containerHeight,
          decoration: BoxDecoration(
            color: _getBackgroundColor(context),
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: _getBorderColor(context)),
          ),
          child: Row(
            spacing: 8.0,
            children: [
              if (widget.icon != null)
                Icon(
                  widget.icon,
                  size: _iconSize,
                  color: _getIconColor(context),
                ),
              Flexible(
                child: TextField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Placeholder text',
                    hintStyle: FlowbiteFontFamily.inter(
                      fontSize: _fontSize.value,
                      fontWeight: FlowbiteFontWeight.normal.value,
                      color: widget.enabled
                          ? _colorExt(context).textBodySubtle
                          : _colorExt(context).textFgDisabled,
                    ),
                    border: InputBorder.none,
                  ),
                  cursorColor: _getCursorColor(context),
                  enabled: widget.enabled,
                  readOnly: widget.readOnly,
                  style: FlowbiteFontFamily.inter(
                    fontSize: _fontSize.value,
                    fontWeight: FlowbiteFontWeight.normal.value,
                    color: _getTextColor(context),
                  ),
                ),
              ),
              GestureDetector(
                onTap: widget.onTapClear,
                child: Icon(
                  FlowbiteOutlineIcons.x,
                  size: _iconSize,
                  color: _getIconColor(context),
                ),
              ),
            ],
          ),
        ),
        if (widget.helperText != null)
          Text(
            widget.helperText!,
            style: FlowbiteFontFamily.inter(
              fontSize: FlowbiteFontSize.textXs.value,
              fontWeight: FlowbiteFontWeight.normal.value,
              color: _colorExt(context).textBody,
            ),
          ),
      ],
    );
  }
}
