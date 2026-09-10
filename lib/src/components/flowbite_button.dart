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

import 'package:flowbite_icons/flowbite_outline_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';

enum FlowbiteButtonSize { xs, sm, base, lg, xl }

enum FlowbiteButtonColor {
  brand,
  secondary,
  tertiary,
  success,
  danger,
  warning,
  dark,
  ghost,
}

class FlowbiteButton extends ButtonStyleButton {
  const FlowbiteButton({
    required super.onPressed,
    required Widget super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior,
    super.statesController,
    super.isSemanticButton,
    this.size = .base,
    this.color = .brand,
  }) : isIconOnly = false;

  final FlowbiteButtonSize size;
  final FlowbiteButtonColor color;
  final bool isIconOnly;

  FlowbiteButton.icon({
    required super.onPressed,
    required Widget label,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = .none,
    super.statesController,
    this.size = .base,
    this.color = .brand,
    Widget? leadingIcon,
    Widget? trailingIcon,
  }) : isIconOnly = false,
       super(
         child: leadingIcon != null || trailingIcon != null
             ? _FlowbiteButtonWithIconChild(
                 label: label,
                 leadingIcon: leadingIcon,
                 trailingIcon: trailingIcon,
               )
             : label,
       );

  const FlowbiteButton.iconOnly({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = .none,
    super.statesController,
    this.size = .base,
    this.color = .brand,
  }) : isIconOnly = true,
       super(child: icon);

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return _FlowbiteButtonDefaults(
      context,
      size: size,
      color: color,
      isIconOnly: isIconOnly,
    );
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return ElevatedButtonTheme.of(context).style;
  }
}

class _FlowbiteButtonWithIconChild extends StatelessWidget {
  const _FlowbiteButtonWithIconChild({
    required this.label,
    required this.leadingIcon,
    required this.trailingIcon,
  });

  final Widget label;
  final Widget? leadingIcon;
  final Widget? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      spacing: 6.0,
      children: <Widget>[
        ?leadingIcon,
        Flexible(child: label),
        ?trailingIcon,
      ],
    );
  }
}

class _FlowbiteButtonDefaults extends ButtonStyle {
  _FlowbiteButtonDefaults(
    this.context, {
    required this.size,
    required this.color,
    required this.isIconOnly,
  }) : super(
         animationDuration: kThemeChangeDuration,
         enableFeedback: true,
         alignment: .center,
       );

  final FlowbiteButtonSize size;
  final FlowbiteButtonColor color;
  final bool isIconOnly;
  final BuildContext context;
  late final ColorScheme _colors = Theme.of(context).colorScheme;
  late final FlowbiteColorsExtension _colorsExtension =
      Theme.of(context).extension<FlowbiteColorsExtension>() ??
      FlowbiteTheme.lightThemeColors;

  @override
  WidgetStatePropertyAll<TextStyle?> get textStyle {
    FlowbiteFontSize fontSize = switch (size) {
      .xs => .textXs,
      .lg || .xl => .textBase,
      .sm || .base || _ => .textSm,
    };
    return WidgetStatePropertyAll<TextStyle?>(
      FlowbiteFontFamily.inter(fontSize: fontSize, fontWeight: .medium),
    );
  }

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        switch (color) {
          case .brand:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.bgDisabled;
            } else if (states.contains(WidgetState.focused)) {
              return _colorsExtension.bgBrandStrong;
            } else if (states.contains(WidgetState.hovered)) {
              return _colorsExtension.bgBrandStrong;
            }
            return _colorsExtension.bgBrand;
          case .secondary:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.bgDisabled;
            } else if (states.contains(WidgetState.focused)) {
              return _colorsExtension.bgNeutralTertiaryMedium;
            } else if (states.contains(WidgetState.hovered)) {
              return _colorsExtension.bgNeutralTertiaryMedium;
            }
            return _colorsExtension.bgNeutralSecondaryMedium;
          case .tertiary:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.bgDisabled;
            } else if (states.contains(WidgetState.focused)) {
              return _colorsExtension.bgNeutralSecondaryMedium;
            } else if (states.contains(WidgetState.hovered)) {
              return _colorsExtension.bgNeutralSecondaryMedium;
            }
            return _colorsExtension.bgNeutralPrimarySoft;
          case .success:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.bgDisabled;
            } else if (states.contains(WidgetState.focused)) {
              return _colorsExtension.bgSuccessStrong;
            } else if (states.contains(WidgetState.hovered)) {
              return _colorsExtension.bgSuccessStrong;
            }
            return _colorsExtension.bgSuccess;
          case .danger:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.bgDisabled;
            } else if (states.contains(WidgetState.focused)) {
              return _colorsExtension.bgDangerStrong;
            } else if (states.contains(WidgetState.hovered)) {
              return _colorsExtension.bgDangerStrong;
            }
            return _colorsExtension.bgDanger;
          case .warning:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.bgDisabled;
            } else if (states.contains(WidgetState.focused)) {
              return _colorsExtension.bgWarningStrong;
            } else if (states.contains(WidgetState.hovered)) {
              return _colorsExtension.bgWarningStrong;
            }
            return _colorsExtension.bgWarning;
          case .dark:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.bgDisabled;
            } else if (states.contains(WidgetState.focused)) {
              return _colorsExtension.bgDarkStrong;
            } else if (states.contains(WidgetState.hovered)) {
              return _colorsExtension.bgDarkStrong;
            }
            return _colorsExtension.bgDark;
          case .ghost:
            if (states.contains(WidgetState.focused)) {
              return _colorsExtension.bgNeutralSecondaryMedium;
            } else if (states.contains(WidgetState.hovered)) {
              return _colorsExtension.bgNeutralSecondaryMedium;
            }
            return null;
        }
      });

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        switch (color) {
          case .brand:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.textFgDisabled;
            }
            return _colorsExtension.textWhite;
          case .secondary:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.textFgDisabled;
            } else if (states.contains(WidgetState.hovered)) {
              return _colorsExtension.textHeading;
            } else if (states.contains(WidgetState.focused)) {
              return _colorsExtension.textHeading;
            }
            return _colorsExtension.textBody;
          case .tertiary:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.textFgDisabled;
            } else if (states.contains(WidgetState.hovered)) {
              return _colorsExtension.textHeading;
            } else if (states.contains(WidgetState.focused)) {
              return _colorsExtension.textHeading;
            }
            return _colorsExtension.textBody;
          case .success:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.textFgDisabled;
            }
            return _colorsExtension.textWhite;
          case .danger:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.textFgDisabled;
            }
            return _colorsExtension.textWhite;
          case .warning:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.textFgDisabled;
            }
            return _colorsExtension.textWhite;
          case .dark:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.textFgDisabled;
            }
            return _colorsExtension.textWhite;
          case .ghost:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.textFgDisabled;
            }
            return _colorsExtension.textHeading;
        }
      });

  @override
  WidgetStateProperty<Color?>? get overlayColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        return null;
      });

  @override
  WidgetStateProperty<Color>? get shadowColor =>
      WidgetStatePropertyAll<Color>(_colors.shadow);

  @override
  WidgetStateProperty<Color>? get surfaceTintColor =>
      const WidgetStatePropertyAll<Color>(Colors.transparent);

  @override
  WidgetStateProperty<double>? get elevation =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        return 0.0;
      });

  @override
  WidgetStateProperty<EdgeInsetsGeometry>? get padding {
    if (isIconOnly) {
      return const WidgetStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsetsGeometry.zero,
      );
    }
    late EdgeInsetsGeometry finalPadding;
    switch (size) {
      case .xs:
        finalPadding = const .symmetric(horizontal: 12.0, vertical: 6.0);
      case .sm:
        finalPadding = const .symmetric(horizontal: 12.0, vertical: 8.0);
      case .base:
        finalPadding = const .symmetric(horizontal: 16.0, vertical: 10.0);
      case .lg:
        finalPadding = const .symmetric(horizontal: 20.0, vertical: 12.0);
      case .xl:
        finalPadding = const .symmetric(horizontal: 24.0, vertical: 14.0);
    }
    return WidgetStatePropertyAll<EdgeInsetsGeometry>(finalPadding);
  }

  @override
  WidgetStateProperty<Size>? get minimumSize {
    late Size minSize;
    switch (size) {
      case .xs:
        minSize = const Size(32.0, 32.0);
      case .sm:
        minSize = const Size(36.0, 36.0);
      case .base:
        minSize = const Size(40.0, 40.0);
      case .lg:
        minSize = const Size(48.0, 48.0);
      case .xl:
        minSize = const Size(52.0, 52.0);
    }
    return WidgetStatePropertyAll<Size>(minSize);
  }

  // No default fixedSize

  @override
  WidgetStateProperty<double>? get iconSize {
    if (isIconOnly) {
      late double height;
      switch (size) {
        case .xs:
          height = 14.0;
        case .sm:
          height = 16.0;
        case .base:
        case .lg:
        case .xl:
          height = 20.0;
      }
      return WidgetStatePropertyAll<double>(height);
    }
    late double height;
    switch (size) {
      case .xs:
        height = 14.0;
      case .sm:
      case .base:
      case .lg:
        height = 16.0;
      case .xl:
        height = 20.0;
    }
    return WidgetStatePropertyAll<double>(height);
  }

  @override
  WidgetStateProperty<Color>? get iconColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      switch (color) {
        case .brand:
          if (states.contains(WidgetState.disabled)) {
            return _colorsExtension.textFgDisabled;
          }
          return _colorsExtension.textWhite;
        case .secondary:
          if (states.contains(WidgetState.disabled)) {
            return _colorsExtension.textFgDisabled;
          } else if (states.contains(WidgetState.hovered)) {
            return _colorsExtension.textHeading;
          } else if (states.contains(WidgetState.focused)) {
            return _colorsExtension.textHeading;
          }
          return _colorsExtension.textBody;
        case .tertiary:
          if (states.contains(WidgetState.disabled)) {
            return _colorsExtension.textFgDisabled;
          } else if (states.contains(WidgetState.hovered)) {
            return _colorsExtension.textHeading;
          } else if (states.contains(WidgetState.focused)) {
            return _colorsExtension.textHeading;
          }
          return _colorsExtension.textBody;
        case .success:
          if (states.contains(WidgetState.disabled)) {
            return _colorsExtension.textFgDisabled;
          }
          return _colorsExtension.textWhite;
        case .danger:
          if (states.contains(WidgetState.disabled)) {
            return _colorsExtension.textFgDisabled;
          }
          return _colorsExtension.textWhite;
        case .warning:
          if (states.contains(WidgetState.disabled)) {
            return _colorsExtension.textFgDisabled;
          }
          return _colorsExtension.textWhite;
        case .dark:
          if (states.contains(WidgetState.disabled)) {
            return _colorsExtension.textFgDisabled;
          }
          return _colorsExtension.textWhite;
        case .ghost:
          if (states.contains(WidgetState.disabled)) {
            return _colorsExtension.textFgDisabled;
          }
          return _colorsExtension.textHeading;
      }
    });
  }

  @override
  WidgetStateProperty<Size?>? get fixedSize {
    late double height;
    switch (size) {
      case .xs:
        height = 32.0;
      case .sm:
        height = 36.0;
      case .base:
        height = 40.0;
      case .lg:
        height = 48.0;
      case .xl:
        height = 52.0;
    }
    if (isIconOnly) {
      return WidgetStatePropertyAll<Size>(Size(height, height));
    }
    return WidgetStatePropertyAll<Size>(Size.fromHeight(height));
  }

  @override
  WidgetStateProperty<Size>? get maximumSize {
    late double height;
    switch (size) {
      case .xs:
        height = 32.0;
      case .sm:
        height = 36.0;
      case .base:
        height = 40.0;
      case .lg:
        height = 48.0;
      case .xl:
        height = 52.0;
    }
    return WidgetStatePropertyAll<Size>(Size.fromHeight(height));
  }

  // No default side

  @override
  WidgetStateProperty<OutlinedBorder>? get shape =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        BorderSide side = .none;
        switch (color) {
          case .brand:
            side = states.contains(WidgetState.disabled)
                ? BorderSide(color: _colorsExtension.borderBaseMedium)
                : .none;
          case .secondary:
            side = BorderSide(color: _colorsExtension.borderBaseMedium);
          case .tertiary:
            if (states.contains(WidgetState.disabled)) {
              side = BorderSide(color: _colorsExtension.borderBaseMedium);
            } else {
              side = BorderSide(color: _colorsExtension.borderBase);
            }
          case .success:
            if (states.contains(WidgetState.disabled)) {
              side = BorderSide(color: _colorsExtension.borderBaseMedium);
            } else if (states.contains(WidgetState.focused)) {
              side = BorderSide(
                width: 2.0,
                color: _colorsExtension.borderSuccessSubtle,
                strokeAlign: BorderSide.strokeAlignOutside,
              );
            }
          case .danger:
            if (states.contains(WidgetState.disabled)) {
              side = BorderSide(color: _colorsExtension.borderBaseMedium);
            } else if (states.contains(WidgetState.focused)) {
              side = BorderSide(
                width: 2.0,
                color: _colorsExtension.borderDangerSubtle,
                strokeAlign: BorderSide.strokeAlignOutside,
              );
            }
          case .warning:
            if (states.contains(WidgetState.disabled)) {
              side = BorderSide(color: _colorsExtension.borderBaseMedium);
            } else if (states.contains(WidgetState.focused)) {
              side = BorderSide(
                width: 2.0,
                color: _colorsExtension.borderWarningSubtle,
                strokeAlign: BorderSide.strokeAlignOutside,
              );
            }
          case .dark:
            if (states.contains(WidgetState.disabled)) {
              side = BorderSide(color: _colorsExtension.borderBaseMedium);
            } else if (states.contains(WidgetState.focused)) {
              side = BorderSide(
                width: 2.0,
                color: _colorsExtension.borderBase,
                strokeAlign: BorderSide.strokeAlignOutside,
              );
            }
          case .ghost:
            if (states.contains(WidgetState.focused)) {
              side = BorderSide(
                width: 2.0,
                color: _colorsExtension.borderLight,
                strokeAlign: BorderSide.strokeAlignOutside,
              );
            }
        }
        return RoundedRectangleBorder(
          borderRadius: .circular(12.0),
          side: side,
        );
      });

  @override
  WidgetStateProperty<MouseCursor?>? get mouseCursor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return SystemMouseCursors.basic;
        }
        return SystemMouseCursors.click;
      });

  @override
  VisualDensity? get visualDensity => Theme.of(context).visualDensity;

  @override
  MaterialTapTargetSize? get tapTargetSize =>
      Theme.of(context).materialTapTargetSize;

  @override
  InteractiveInkFeatureFactory? get splashFactory =>
      Theme.of(context).splashFactory;
}

@FlowbitePreview(name: 'Button - Light', group: 'Button', brightness: .light)
@FlowbitePreview(name: 'Button - Dark', group: 'Button', brightness: .dark)
Widget previewFlowbiteButton() {
  return Column(
    spacing: 12.0,
    crossAxisAlignment: .start,
    children: FlowbiteButtonColor.values
        .map(
          (color) => Column(
            crossAxisAlignment: .start,
            spacing: 6.0,
            children: [
              Row(
                crossAxisAlignment: .start,
                spacing: 6.0,
                children: [
                  ...FlowbiteButtonSize.values.map(
                    (size) => Column(
                      spacing: 6.0,
                      children: [
                        FlowbiteButton.icon(
                          label: const Text('Button text'),
                          onPressed: () {},
                          leadingIcon: const Icon(
                            FlowbiteOutlineIcons.arrow_left,
                          ),
                          trailingIcon: const Icon(
                            FlowbiteOutlineIcons.arrow_right,
                          ),
                          color: color,
                          size: size,
                        ),
                        FlowbiteButton.icon(
                          label: const Text('Button text'),
                          onPressed: null,
                          leadingIcon: const Icon(
                            FlowbiteOutlineIcons.arrow_left,
                          ),
                          trailingIcon: const Icon(
                            FlowbiteOutlineIcons.arrow_right,
                          ),
                          color: color,
                          size: size,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: .start,
                spacing: 6.0,
                children: [
                  ...FlowbiteButtonSize.values.map(
                    (size) => Column(
                      spacing: 6.0,
                      children: [
                        FlowbiteButton.iconOnly(
                          onPressed: () {},
                          icon: const Icon(FlowbiteOutlineIcons.heart),
                          color: color,
                          size: size,
                        ),
                        FlowbiteButton.iconOnly(
                          onPressed: null,
                          icon: const Icon(FlowbiteOutlineIcons.heart),
                          color: color,
                          size: size,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
        .toList(),
  );
}
