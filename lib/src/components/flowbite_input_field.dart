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

/// [FlowbiteInputField]'s size variant.
enum FlowbiteInputFieldSize {
  /// Small size variant.
  sm,

  /// Base/default size variant.
  base,

  /// Large size variant.
  lg,

  /// Extra large size variant.
  xl,
}

/// Input Field component.
class FlowbiteInputField extends StatefulWidget {
  /// The input field's size.
  ///
  /// Defaults to [FlowbiteInputFieldSize.base].
  final FlowbiteInputFieldSize size;

  /// Whether the input field is enabled.
  ///
  /// Defaults to true.
  final bool enabled;

  /// Whether the input field is read-only.
  ///
  /// Defaults to false.
  final bool readOnly;

  /// Whether the input field's text is obscured.
  ///
  /// Defaults to false.
  final bool obscureText;

  /// The input field's icon data.
  final IconData? icon;

  /// Whether to show clear icon as suffix.
  ///
  /// Defaults to true.
  final bool showClearIcon;

  /// The clear icon's tap callback.
  final VoidCallback? onTapClear;

  /// The input field's controller.
  final TextEditingController? controller;

  /// Whether the input field is in success state.
  ///
  /// Defaults to false.
  final bool isSuccess;

  /// Whether the input field is in danger state.
  ///
  /// Defaults to false.
  final bool isDanger;

  /// The input field's label text.
  final String? label;

  /// Whether the input field is required.
  ///
  /// Defaults to false.
  final bool isRequired;

  /// The input field label's icon data.
  final IconData? labelIcon;

  /// The input field's helper text.
  final String? helperText;

  /// The input field's hint text.
  final String? hintText;

  /// The input field's text input action.
  final TextInputAction? textInputAction;

  /// The input field's autofill hints.
  ///
  /// Defaults to empty array.
  final Iterable<String>? autofillHints;

  /// The input field's text capitalization.
  ///
  /// Defaults to [TextCapitalization.none].
  final TextCapitalization textCapitalization;

  /// The input field's keyboard type.
  final TextInputType? keyboardType;

  /// The input field's changed callback.
  final ValueChanged<String>? onChanged;

  /// The input field's submit callback.
  final ValueChanged<String>? onSubmitted;

  /// Constructor.
  const FlowbiteInputField({
    this.size = .base,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.icon,
    this.onTapClear,
    this.controller,
    this.isSuccess = false,
    this.isDanger = false,
    this.label,
    this.isRequired = false,
    this.labelIcon,
    this.helperText,
    this.hintText,
    this.showClearIcon = true,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.autofillHints = const <String>[],
    this.textCapitalization = .none,
    this.keyboardType,
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

  double get _iconSize => switch (widget.size) {
    .sm => 16.0,
    .base => 16.0,
    .lg => 20.0,
    .xl => 20.0,
  };

  double get _horizontalPadding => switch (widget.size) {
    .sm => 10.0,
    .base => 12.0,
    .lg => 14.0,
    .xl => 16.0,
  };

  double get _containerHeight => switch (widget.size) {
    .sm => 36.0,
    .base => 40.0,
    .lg => 48.0,
    .xl => 52.0,
  };

  FlowbiteFontSize get _fontSize => switch (widget.size) {
    .sm => .textSm,
    .base => .textSm,
    .lg => .textBase,
    .xl => .textBase,
  };

  Color _getIconColor(BuildContext context) {
    if (!widget.enabled) {
      return FlowbiteTheme.of(context).textFgDisabled;
    } else if (widget.readOnly) {
      return FlowbiteTheme.of(context).textBody;
    } else if (widget.isSuccess) {
      return FlowbiteTheme.of(context).textFgSuccessStrong;
    } else if (widget.isDanger) {
      return FlowbiteTheme.of(context).textFgDangerStrong;
    } else if (_isFocused) {
      return FlowbiteTheme.of(context).textFgBrand;
    }
    return FlowbiteTheme.of(context).textBodySubtle;
  }

  Color _getBorderColor(BuildContext context) {
    if (widget.isSuccess) {
      return FlowbiteTheme.of(context).borderSuccessSubtle;
    } else if (widget.isDanger) {
      return FlowbiteTheme.of(context).borderDangerSubtle;
    } else if (_isFocused && !widget.readOnly) {
      return FlowbiteTheme.of(context).borderBrand;
    }
    return FlowbiteTheme.of(context).borderBaseMedium;
  }

  Color _getBackgroundColor(BuildContext context) {
    if (widget.readOnly) {
      return FlowbiteTheme.of(context).bgNeutralTertiary;
    } else if (widget.isSuccess) {
      return FlowbiteTheme.of(context).bgSuccessSoft;
    } else if (widget.isDanger) {
      return FlowbiteTheme.of(context).bgDangerSoft;
    }
    return FlowbiteTheme.of(context).bgNeutralSecondaryMedium;
  }

  Color _getTextColor(BuildContext context) {
    if (!widget.enabled) {
      return FlowbiteTheme.of(context).textFgDisabled;
    } else if (widget.readOnly) {
      return FlowbiteTheme.of(context).textBody;
    } else if (widget.isSuccess) {
      return FlowbiteTheme.of(context).textFgSuccessStrong;
    } else if (widget.isDanger) {
      return FlowbiteTheme.of(context).textFgDangerStrong;
    }
    return FlowbiteTheme.of(context).textHeading;
  }

  Color _getCursorColor(BuildContext context) {
    if (widget.isSuccess) {
      return FlowbiteTheme.of(context).textFgSuccessStrong;
    } else if (widget.isDanger) {
      return FlowbiteTheme.of(context).textFgDangerStrong;
    }
    return FlowbiteTheme.of(context).textHeading;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Localizations(
        locale: const Locale('en'),
        delegates: const [
          DefaultWidgetsLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        child: Column(
          spacing: 10.0,
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            if (widget.label != null)
              FlowbiteInputLabel(
                label: widget.label!,
                isRequired: widget.isRequired,
                icon: widget.labelIcon,
              ),
            Container(
              padding: .symmetric(horizontal: _horizontalPadding),
              alignment: .center,
              height: _containerHeight,
              decoration: BoxDecoration(
                color: _getBackgroundColor(context),
                borderRadius: .circular(12.0),
                border: .all(color: _getBorderColor(context)),
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
                      onChanged: widget.onChanged,
                      onSubmitted: widget.onSubmitted,
                      controller: widget.controller,
                      textInputAction: widget.textInputAction,
                      autofillHints: widget.autofillHints,
                      textCapitalization: widget.textCapitalization,
                      keyboardType: widget.keyboardType,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: widget.hintText,
                        hintStyle: FlowbiteFontFamily.inter(
                          fontSize: _fontSize,
                          fontWeight: .normal,
                          color: widget.enabled
                              ? FlowbiteTheme.of(context).textBodySubtle
                              : FlowbiteTheme.of(context).textFgDisabled,
                        ),
                        border: InputBorder.none,
                      ),
                      cursorColor: _getCursorColor(context),
                      enabled: widget.enabled,
                      readOnly: widget.readOnly,
                      obscureText: widget.obscureText,
                      style: FlowbiteFontFamily.inter(
                        fontSize: _fontSize,
                        fontWeight: .normal,
                        color: _getTextColor(context),
                      ),
                    ),
                  ),
                  if (widget.showClearIcon)
                    InkWell(
                      onTap: widget.enabled && !widget.readOnly
                          ? widget.onTapClear
                          : null,
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
                  fontSize: .textXs,
                  fontWeight: .normal,
                  color: FlowbiteTheme.of(context).textBody,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

@FlowbitePreview(
  name: 'Input Field - Light',
  group: 'Input Field',
  brightness: .light,
)
@FlowbitePreview(
  name: 'Input Field - Dark',
  group: 'Input Field',
  brightness: .dark,
)
/// Widget preview for [FlowbiteInputField].
Widget previewFlowbiteInputField() {
  final width = 240.0;
  return Column(
    spacing: 6.0,
    children: FlowbiteInputFieldSize.values
        .map(
          (size) => Row(
            crossAxisAlignment: .start,
            spacing: 6.0,
            children: [
              SizedBox(
                width: width,
                child: FlowbiteInputField(
                  labelIcon: FlowbiteOutlineIcons.question_mark,
                  size: size,
                  icon: FlowbiteOutlineIcons.user,
                  hintText: 'Placeholder text',
                  onTapClear: () {},
                ),
              ),
              SizedBox(
                width: width,
                child: FlowbiteInputField(
                  size: size,
                  icon: FlowbiteOutlineIcons.user,
                  enabled: false,
                  controller: TextEditingController(text: 'name@company.com'),
                  onTapClear: () {},
                ),
              ),
              SizedBox(
                width: width,
                child: FlowbiteInputField(
                  size: size,
                  icon: FlowbiteOutlineIcons.user,
                  readOnly: true,
                  controller: TextEditingController(text: 'name@company.com'),
                  onTapClear: () {},
                ),
              ),
              SizedBox(
                width: width,
                child: FlowbiteInputField(
                  size: size,
                  icon: FlowbiteOutlineIcons.user,
                  isSuccess: true,
                  controller: TextEditingController(text: 'Write some text he'),
                  onTapClear: () {},
                ),
              ),
              SizedBox(
                width: width,
                child: FlowbiteInputField(
                  size: size,
                  icon: FlowbiteOutlineIcons.user,
                  isDanger: true,
                  controller: TextEditingController(text: 'Write some text he'),
                  onTapClear: () {},
                ),
              ),
            ],
          ),
        )
        .toList(),
  );
}
