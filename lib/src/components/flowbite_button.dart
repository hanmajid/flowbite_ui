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
    this.size = FlowbiteButtonSize.base,
    this.color = FlowbiteButtonColor.brand,
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
    super.clipBehavior = Clip.none,
    super.statesController,
    this.size = FlowbiteButtonSize.base,
    this.color = FlowbiteButtonColor.brand,
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
    super.clipBehavior = Clip.none,
    super.statesController,
    this.size = FlowbiteButtonSize.base,
    this.color = FlowbiteButtonColor.brand,
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
      mainAxisSize: MainAxisSize.min,
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
         alignment: Alignment.center,
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
      FlowbiteButtonSize.xs => FlowbiteFontSize.textXs,
      FlowbiteButtonSize.lg ||
      FlowbiteButtonSize.xl => FlowbiteFontSize.textBase,
      FlowbiteButtonSize.sm ||
      FlowbiteButtonSize.base ||
      _ => FlowbiteFontSize.textSm,
    };
    return WidgetStatePropertyAll<TextStyle?>(
      FlowbiteFontFamily.inter(
        fontSize: fontSize.value,
        fontWeight: FlowbiteFontWeight.medium.value,
      ),
    );
  }

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        switch (color) {
          case FlowbiteButtonColor.brand:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.bgDisabled;
            } else if (states.contains(WidgetState.focused)) {
              return _colorsExtension.bgBrandStrong;
            } else if (states.contains(WidgetState.hovered)) {
              return _colorsExtension.bgBrandStrong;
            }
            return _colorsExtension.bgBrand;
          case FlowbiteButtonColor.secondary:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.bgDisabled;
            } else if (states.contains(WidgetState.focused)) {
              return _colorsExtension.bgNeutralTertiaryMedium;
            } else if (states.contains(WidgetState.hovered)) {
              return _colorsExtension.bgNeutralTertiaryMedium;
            }
            return _colorsExtension.bgNeutralSecondaryMedium;
          case FlowbiteButtonColor.tertiary:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.bgDisabled;
            } else if (states.contains(WidgetState.focused)) {
              return _colorsExtension.bgNeutralSecondaryMedium;
            } else if (states.contains(WidgetState.hovered)) {
              return _colorsExtension.bgNeutralSecondaryMedium;
            }
            return _colorsExtension.bgNeutralPrimarySoft;
          case FlowbiteButtonColor.success:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.bgDisabled;
            } else if (states.contains(WidgetState.focused)) {
              return _colorsExtension.bgSuccessStrong;
            } else if (states.contains(WidgetState.hovered)) {
              return _colorsExtension.bgSuccessStrong;
            }
            return _colorsExtension.bgSuccess;
          case FlowbiteButtonColor.danger:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.bgDisabled;
            } else if (states.contains(WidgetState.focused)) {
              return _colorsExtension.bgDangerStrong;
            } else if (states.contains(WidgetState.hovered)) {
              return _colorsExtension.bgDangerStrong;
            }
            return _colorsExtension.bgDanger;
          case FlowbiteButtonColor.warning:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.bgDisabled;
            } else if (states.contains(WidgetState.focused)) {
              return _colorsExtension.bgWarningStrong;
            } else if (states.contains(WidgetState.hovered)) {
              return _colorsExtension.bgWarningStrong;
            }
            return _colorsExtension.bgWarning;
          case FlowbiteButtonColor.dark:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.bgDisabled;
            } else if (states.contains(WidgetState.focused)) {
              return _colorsExtension.bgDarkStrong;
            } else if (states.contains(WidgetState.hovered)) {
              return _colorsExtension.bgDarkStrong;
            }
            return _colorsExtension.bgDark;
          case FlowbiteButtonColor.ghost:
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
          case FlowbiteButtonColor.brand:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.textFgDisabled;
            }
            return _colorsExtension.textWhite;
          case FlowbiteButtonColor.secondary:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.textFgDisabled;
            } else if (states.contains(WidgetState.hovered)) {
              return _colorsExtension.textHeading;
            } else if (states.contains(WidgetState.focused)) {
              return _colorsExtension.textHeading;
            }
            return _colorsExtension.textBody;
          case FlowbiteButtonColor.tertiary:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.textFgDisabled;
            } else if (states.contains(WidgetState.hovered)) {
              return _colorsExtension.textHeading;
            } else if (states.contains(WidgetState.focused)) {
              return _colorsExtension.textHeading;
            }
            return _colorsExtension.textBody;
          case FlowbiteButtonColor.success:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.textFgDisabled;
            }
            return _colorsExtension.textWhite;
          case FlowbiteButtonColor.danger:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.textFgDisabled;
            }
            return _colorsExtension.textWhite;
          case FlowbiteButtonColor.warning:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.textFgDisabled;
            }
            return _colorsExtension.textWhite;
          case FlowbiteButtonColor.dark:
            if (states.contains(WidgetState.disabled)) {
              return _colorsExtension.textFgDisabled;
            }
            return _colorsExtension.textWhite;
          case FlowbiteButtonColor.ghost:
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
      case FlowbiteButtonSize.xs:
        finalPadding = const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 6.0,
        );
      case FlowbiteButtonSize.sm:
        finalPadding = const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        );
      case FlowbiteButtonSize.base:
        finalPadding = const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 10.0,
        );
      case FlowbiteButtonSize.lg:
        finalPadding = const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 12.0,
        );
      case FlowbiteButtonSize.xl:
        finalPadding = const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 14.0,
        );
    }
    return WidgetStatePropertyAll<EdgeInsetsGeometry>(finalPadding);
  }

  @override
  WidgetStateProperty<Size>? get minimumSize {
    late Size minSize;
    switch (size) {
      case FlowbiteButtonSize.xs:
        minSize = const Size(32.0, 32.0);
      case FlowbiteButtonSize.sm:
        minSize = const Size(36.0, 36.0);
      case FlowbiteButtonSize.base:
        minSize = const Size(40.0, 40.0);
      case FlowbiteButtonSize.lg:
        minSize = const Size(48.0, 48.0);
      case FlowbiteButtonSize.xl:
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
        case FlowbiteButtonSize.xs:
          height = 14.0;
        case FlowbiteButtonSize.sm:
          height = 16.0;
        case FlowbiteButtonSize.base:
        case FlowbiteButtonSize.lg:
        case FlowbiteButtonSize.xl:
          height = 20.0;
      }
      return WidgetStatePropertyAll<double>(height);
    }
    late double height;
    switch (size) {
      case FlowbiteButtonSize.xs:
        height = 14.0;
      case FlowbiteButtonSize.sm:
      case FlowbiteButtonSize.base:
      case FlowbiteButtonSize.lg:
        height = 16.0;
      case FlowbiteButtonSize.xl:
        height = 20.0;
    }
    return WidgetStatePropertyAll<double>(height);
  }

  @override
  WidgetStateProperty<Color>? get iconColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      switch (color) {
        case FlowbiteButtonColor.brand:
          if (states.contains(WidgetState.disabled)) {
            return _colorsExtension.textFgDisabled;
          }
          return _colorsExtension.textWhite;
        case FlowbiteButtonColor.secondary:
          if (states.contains(WidgetState.disabled)) {
            return _colorsExtension.textFgDisabled;
          } else if (states.contains(WidgetState.hovered)) {
            return _colorsExtension.textHeading;
          } else if (states.contains(WidgetState.focused)) {
            return _colorsExtension.textHeading;
          }
          return _colorsExtension.textBody;
        case FlowbiteButtonColor.tertiary:
          if (states.contains(WidgetState.disabled)) {
            return _colorsExtension.textFgDisabled;
          } else if (states.contains(WidgetState.hovered)) {
            return _colorsExtension.textHeading;
          } else if (states.contains(WidgetState.focused)) {
            return _colorsExtension.textHeading;
          }
          return _colorsExtension.textBody;
        case FlowbiteButtonColor.success:
          if (states.contains(WidgetState.disabled)) {
            return _colorsExtension.textFgDisabled;
          }
          return _colorsExtension.textWhite;
        case FlowbiteButtonColor.danger:
          if (states.contains(WidgetState.disabled)) {
            return _colorsExtension.textFgDisabled;
          }
          return _colorsExtension.textWhite;
        case FlowbiteButtonColor.warning:
          if (states.contains(WidgetState.disabled)) {
            return _colorsExtension.textFgDisabled;
          }
          return _colorsExtension.textWhite;
        case FlowbiteButtonColor.dark:
          if (states.contains(WidgetState.disabled)) {
            return _colorsExtension.textFgDisabled;
          }
          return _colorsExtension.textWhite;
        case FlowbiteButtonColor.ghost:
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
      case FlowbiteButtonSize.xs:
        height = 32.0;
      case FlowbiteButtonSize.sm:
        height = 36.0;
      case FlowbiteButtonSize.base:
        height = 40.0;
      case FlowbiteButtonSize.lg:
        height = 48.0;
      case FlowbiteButtonSize.xl:
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
      case FlowbiteButtonSize.xs:
        height = 32.0;
      case FlowbiteButtonSize.sm:
        height = 36.0;
      case FlowbiteButtonSize.base:
        height = 40.0;
      case FlowbiteButtonSize.lg:
        height = 48.0;
      case FlowbiteButtonSize.xl:
        height = 52.0;
    }
    return WidgetStatePropertyAll<Size>(Size.fromHeight(height));
  }

  // No default side

  @override
  WidgetStateProperty<OutlinedBorder>? get shape =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        BorderSide side = BorderSide.none;
        switch (color) {
          case FlowbiteButtonColor.brand:
            side = states.contains(WidgetState.disabled)
                ? BorderSide(color: _colorsExtension.borderBaseMedium)
                : BorderSide.none;
          case FlowbiteButtonColor.secondary:
            side = BorderSide(color: _colorsExtension.borderBaseMedium);
          case FlowbiteButtonColor.tertiary:
            if (states.contains(WidgetState.disabled)) {
              side = BorderSide(color: _colorsExtension.borderBaseMedium);
            } else {
              side = BorderSide(color: _colorsExtension.borderBase);
            }
          case FlowbiteButtonColor.success:
            if (states.contains(WidgetState.disabled)) {
              side = BorderSide(color: _colorsExtension.borderBaseMedium);
            } else if (states.contains(WidgetState.focused)) {
              side = BorderSide(
                width: 2.0,
                color: _colorsExtension.borderSuccessSubtle,
                strokeAlign: BorderSide.strokeAlignOutside,
              );
            }
          case FlowbiteButtonColor.danger:
            if (states.contains(WidgetState.disabled)) {
              side = BorderSide(color: _colorsExtension.borderBaseMedium);
            } else if (states.contains(WidgetState.focused)) {
              side = BorderSide(
                width: 2.0,
                color: _colorsExtension.borderDangerSubtle,
                strokeAlign: BorderSide.strokeAlignOutside,
              );
            }
          case FlowbiteButtonColor.warning:
            if (states.contains(WidgetState.disabled)) {
              side = BorderSide(color: _colorsExtension.borderBaseMedium);
            } else if (states.contains(WidgetState.focused)) {
              side = BorderSide(
                width: 2.0,
                color: _colorsExtension.borderWarningSubtle,
                strokeAlign: BorderSide.strokeAlignOutside,
              );
            }
          case FlowbiteButtonColor.dark:
            if (states.contains(WidgetState.disabled)) {
              side = BorderSide(color: _colorsExtension.borderBaseMedium);
            } else if (states.contains(WidgetState.focused)) {
              side = BorderSide(
                width: 2.0,
                color: _colorsExtension.borderBase,
                strokeAlign: BorderSide.strokeAlignOutside,
              );
            }
          case FlowbiteButtonColor.ghost:
            if (states.contains(WidgetState.focused)) {
              side = BorderSide(
                width: 2.0,
                color: _colorsExtension.borderLight,
                strokeAlign: BorderSide.strokeAlignOutside,
              );
            }
        }
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
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
