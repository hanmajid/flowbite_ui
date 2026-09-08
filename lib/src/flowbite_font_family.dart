import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlowbiteFontFamily {
  static void init() {
    // Register font licenses.
    LicenseRegistry.addLicense(() async* {
      // Inter
      final inter = await rootBundle.loadString('assets/fonts/Inter/OFL.txt');
      yield LicenseEntryWithLineBreaks(['Inter'], inter);
    });
  }

  /// Returns [TextStyle] with 'Inter' as font family.
  static TextStyle inter({
    TextStyle? textStyle,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) {
    return TextStyle(
      package: 'flowbite_ui',
      fontFamily: 'Inter',
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontVariations: fontWeight != null
          ? [FontVariation('wght', fontWeight.value.toDouble())]
          : null,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }
}
