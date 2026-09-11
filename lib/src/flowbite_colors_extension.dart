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

import 'package:material_ui/material_ui.dart';

class FlowbiteColorsExtension extends ThemeExtension<FlowbiteColorsExtension> {
  FlowbiteColorsExtension({
    required this.textWhite,
    required this.textBlack,
    required this.textHeading,
    required this.textBody,
    required this.textBodySubtle,
    required this.textFgBrandSubtle,
    required this.textFgBrand,
    required this.textFgBrandStrong,
    required this.textFgSuccess,
    required this.textFgSuccessStrong,
    required this.textFgDanger,
    required this.textFgDangerStrong,
    required this.textFgWarningSubtle,
    required this.textFgWarning,
    required this.textFgYellow,
    required this.textFgInfo,
    required this.textFgDisabled,
    required this.textFgPurple,
    required this.textFgCyan,
    required this.textFgIndigo,
    required this.textFgPink,
    required this.textFgLime,
    required this.bgWhite,
    required this.bgNeutralPrimarySoft,
    required this.bgNeutralPrimary,
    required this.bgNeutralPrimaryMedium,
    required this.bgNeutralPrimaryStrong,
    required this.bgNeutralSecondarySoft,
    required this.bgNeutralSecondary,
    required this.bgNeutralSecondaryMedium,
    required this.bgNeutralSecondaryStrong,
    required this.bgNeutralTertiarySoft,
    required this.bgNeutralTertiary,
    required this.bgNeutralTertiaryMedium,
    required this.bgNeutralQuaternary,
    required this.bgNeutralQuaternaryMedium,
    required this.bgGray,
    required this.bgBrandSofter,
    required this.bgBrandSoft,
    required this.bgBrandMedium,
    required this.bgBrand,
    required this.bgBrandStrong,
    required this.bgSuccessSoft,
    required this.bgSuccessMedium,
    required this.bgSuccess,
    required this.bgSuccessStrong,
    required this.bgDangerSoft,
    required this.bgDangerMedium,
    required this.bgDanger,
    required this.bgDangerStrong,
    required this.bgWarningSoft,
    required this.bgWarningMedium,
    required this.bgWarning,
    required this.bgWarningStrong,
    required this.bgDarkStrong,
    required this.bgDark,
    required this.bgDisabled,
    required this.bgPurple,
    required this.bgSky,
    required this.bgTeal,
    required this.bgPink,
    required this.bgCyan,
    required this.bgFuschia,
    required this.bgIndigo,
    required this.bgOrange,
    required this.bgVariantsGray,
    required this.borderDark,
    required this.borderBuffer,
    required this.borderBufferMedium,
    required this.borderBufferStrong,
    required this.borderMuted,
    required this.borderLightSubtle,
    required this.borderLight,
    required this.borderLightMedium,
    required this.borderBaseSoft,
    required this.borderBase,
    required this.borderBaseMedium,
    required this.borderBaseStrong,
    required this.borderSuccessSubtle,
    required this.borderSuccess,
    required this.borderDangerSubtle,
    required this.borderDanger,
    required this.borderWarningSubtle,
    required this.borderWarning,
    required this.borderBrandSubtle,
    required this.borderBrandLight,
    required this.borderBrand,
    required this.borderPurple,
    required this.borderOrange,
    required this.borderDarkSubtle,
  });

  /// Text color variables.
  final Color textWhite;
  final Color textBlack;
  final Color textHeading;
  final Color textBody;
  final Color textBodySubtle;
  final Color textFgBrandSubtle;
  final Color textFgBrand;
  final Color textFgBrandStrong;
  final Color textFgSuccess;
  final Color textFgSuccessStrong;
  final Color textFgDanger;
  final Color textFgDangerStrong;
  final Color textFgWarningSubtle;
  final Color textFgWarning;
  final Color textFgYellow;
  final Color textFgInfo;
  final Color textFgDisabled;
  final Color textFgPurple;
  final Color textFgCyan;
  final Color textFgIndigo;
  final Color textFgPink;
  final Color textFgLime;

  // Background color variables.
  final Color bgWhite;
  final Color bgNeutralPrimarySoft;
  final Color bgNeutralPrimary;
  final Color bgNeutralPrimaryMedium;
  final Color bgNeutralPrimaryStrong;
  final Color bgNeutralSecondarySoft;
  final Color bgNeutralSecondary;
  final Color bgNeutralSecondaryMedium;
  final Color bgNeutralSecondaryStrong;
  final Color bgNeutralTertiarySoft;
  final Color bgNeutralTertiary;
  final Color bgNeutralTertiaryMedium;
  final Color bgNeutralQuaternary;
  final Color bgNeutralQuaternaryMedium;
  final Color bgGray;
  final Color bgBrandSofter;
  final Color bgBrandSoft;
  final Color bgBrandMedium;
  final Color bgBrand;
  final Color bgBrandStrong;
  final Color bgSuccessSoft;
  final Color bgSuccessMedium;
  final Color bgSuccess;
  final Color bgSuccessStrong;
  final Color bgDangerSoft;
  final Color bgDangerMedium;
  final Color bgDanger;
  final Color bgDangerStrong;
  final Color bgWarningSoft;
  final Color bgWarningMedium;
  final Color bgWarning;
  final Color bgWarningStrong;
  final Color bgDarkStrong;
  final Color bgDark;
  final Color bgDisabled;
  final Color bgPurple;
  final Color bgSky;
  final Color bgTeal;
  final Color bgPink;
  final Color bgCyan;
  final Color bgFuschia;
  final Color bgIndigo;
  final Color bgOrange;
  final Color bgVariantsGray;

  // Border color variables.
  final Color borderDark;
  final Color borderBuffer;
  final Color borderBufferMedium;
  final Color borderBufferStrong;
  final Color borderMuted;
  final Color borderLightSubtle;
  final Color borderLight;
  final Color borderLightMedium;
  final Color borderBaseSoft;
  final Color borderBase;
  final Color borderBaseMedium;
  final Color borderBaseStrong;
  final Color borderSuccessSubtle;
  final Color borderSuccess;
  final Color borderDangerSubtle;
  final Color borderDanger;
  final Color borderWarningSubtle;
  final Color borderWarning;
  final Color borderBrandSubtle;
  final Color borderBrandLight;
  final Color borderBrand;
  final Color borderPurple;
  final Color borderOrange;
  final Color borderDarkSubtle;

  @override
  ThemeExtension<FlowbiteColorsExtension> copyWith({
    Color? textWhite,
    Color? textBlack,
    Color? textHeading,
    Color? textBody,
    Color? textBodySubtle,
    Color? textFgBrandSubtle,
    Color? textFgBrand,
    Color? textFgBrandStrong,
    Color? textFgSuccess,
    Color? textFgSuccessStrong,
    Color? textFgDanger,
    Color? textFgDangerStrong,
    Color? textFgWarningSubtle,
    Color? textFgWarning,
    Color? textFgYellow,
    Color? textFgInfo,
    Color? textFgDisabled,
    Color? textFgPurple,
    Color? textFgCyan,
    Color? textFgIndigo,
    Color? textFgPink,
    Color? textFgLime,
    Color? bgWhite,
    Color? bgNeutralPrimarySoft,
    Color? bgNeutralPrimary,
    Color? bgNeutralPrimaryMedium,
    Color? bgNeutralPrimaryStrong,
    Color? bgNeutralSecondarySoft,
    Color? bgNeutralSecondary,
    Color? bgNeutralSecondaryMedium,
    Color? bgNeutralSecondaryStrong,
    Color? bgNeutralTertiarySoft,
    Color? bgNeutralTertiary,
    Color? bgNeutralTertiaryMedium,
    Color? bgNeutralQuaternary,
    Color? bgNeutralQuaternaryMedium,
    Color? bgGray,
    Color? bgBrandSofter,
    Color? bgBrandSoft,
    Color? bgBrandMedium,
    Color? bgBrand,
    Color? bgBrandStrong,
    Color? bgSuccessSoft,
    Color? bgSuccessMedium,
    Color? bgSuccess,
    Color? bgSuccessStrong,
    Color? bgDangerSoft,
    Color? bgDangerMedium,
    Color? bgDanger,
    Color? bgDangerStrong,
    Color? bgWarningSoft,
    Color? bgWarningMedium,
    Color? bgWarning,
    Color? bgWarningStrong,
    Color? bgDarkStrong,
    Color? bgDark,
    Color? bgDisabled,
    Color? bgPurple,
    Color? bgSky,
    Color? bgTeal,
    Color? bgPink,
    Color? bgCyan,
    Color? bgFuschia,
    Color? bgIndigo,
    Color? bgOrange,
    Color? bgVariantsGray,
    Color? borderDark,
    Color? borderBuffer,
    Color? borderBufferMedium,
    Color? borderBufferStrong,
    Color? borderMuted,
    Color? borderLightSubtle,
    Color? borderLight,
    Color? borderLightMedium,
    Color? borderBaseSoft,
    Color? borderBase,
    Color? borderBaseMedium,
    Color? borderBaseStrong,
    Color? borderSuccessSubtle,
    Color? borderSuccess,
    Color? borderDangerSubtle,
    Color? borderDanger,
    Color? borderWarningSubtle,
    Color? borderWarning,
    Color? borderBrandSubtle,
    Color? borderBrandLight,
    Color? borderBrand,
    Color? borderPurple,
    Color? borderOrange,
    Color? borderDarkSubtle,
  }) {
    return FlowbiteColorsExtension(
      textWhite: textWhite ?? this.textWhite,
      textBlack: textBlack ?? this.textBlack,
      textHeading: textHeading ?? this.textHeading,
      textBody: textBody ?? this.textBody,
      textBodySubtle: textBodySubtle ?? this.textBodySubtle,
      textFgBrandSubtle: textFgBrandSubtle ?? this.textFgBrandSubtle,
      textFgBrand: textFgBrand ?? this.textFgBrand,
      textFgBrandStrong: textFgBrandStrong ?? this.textFgBrandStrong,
      textFgSuccess: textFgSuccess ?? this.textFgSuccess,
      textFgSuccessStrong: textFgSuccessStrong ?? this.textFgSuccessStrong,
      textFgDanger: textFgDanger ?? this.textFgDanger,
      textFgDangerStrong: textFgDangerStrong ?? this.textFgDangerStrong,
      textFgWarningSubtle: textFgWarningSubtle ?? this.textFgWarningSubtle,
      textFgWarning: textFgWarning ?? this.textFgWarning,
      textFgYellow: textFgYellow ?? this.textFgYellow,
      textFgInfo: textFgInfo ?? this.textFgInfo,
      textFgDisabled: textFgDisabled ?? this.textFgDisabled,
      textFgPurple: textFgPurple ?? this.textFgPurple,
      textFgCyan: textFgCyan ?? this.textFgCyan,
      textFgIndigo: textFgIndigo ?? this.textFgIndigo,
      textFgPink: textFgPink ?? this.textFgPink,
      textFgLime: textFgLime ?? this.textFgLime,
      bgWhite: bgWhite ?? this.bgWhite,
      bgNeutralPrimarySoft: bgNeutralPrimarySoft ?? this.bgNeutralPrimarySoft,
      bgNeutralPrimary: bgNeutralPrimary ?? this.bgNeutralPrimary,
      bgNeutralPrimaryMedium:
          bgNeutralPrimaryMedium ?? this.bgNeutralPrimaryMedium,
      bgNeutralPrimaryStrong:
          bgNeutralPrimaryStrong ?? this.bgNeutralPrimaryStrong,
      bgNeutralSecondarySoft:
          bgNeutralSecondarySoft ?? this.bgNeutralSecondarySoft,
      bgNeutralSecondary: bgNeutralSecondary ?? this.bgNeutralSecondary,
      bgNeutralSecondaryMedium:
          bgNeutralSecondaryMedium ?? this.bgNeutralSecondaryMedium,
      bgNeutralSecondaryStrong:
          bgNeutralSecondaryStrong ?? this.bgNeutralSecondaryStrong,
      bgNeutralTertiarySoft:
          bgNeutralTertiarySoft ?? this.bgNeutralTertiarySoft,
      bgNeutralTertiary: bgNeutralTertiary ?? this.bgNeutralTertiary,
      bgNeutralTertiaryMedium:
          bgNeutralTertiaryMedium ?? this.bgNeutralTertiaryMedium,
      bgNeutralQuaternary: bgNeutralQuaternary ?? this.bgNeutralQuaternary,
      bgNeutralQuaternaryMedium:
          bgNeutralQuaternaryMedium ?? this.bgNeutralQuaternaryMedium,
      bgGray: bgGray ?? this.bgGray,
      bgBrandSofter: bgBrandSofter ?? this.bgBrandSofter,
      bgBrandSoft: bgBrandSoft ?? this.bgBrandSoft,
      bgBrandMedium: bgBrandMedium ?? this.bgBrandMedium,
      bgBrand: bgBrand ?? this.bgBrand,
      bgBrandStrong: bgBrandStrong ?? this.bgBrandStrong,
      bgSuccessSoft: bgSuccessSoft ?? this.bgSuccessSoft,
      bgSuccessMedium: bgSuccessMedium ?? this.bgSuccessMedium,
      bgSuccess: bgSuccess ?? this.bgSuccess,
      bgSuccessStrong: bgSuccessStrong ?? this.bgSuccessStrong,
      bgDangerSoft: bgDangerSoft ?? this.bgDangerSoft,
      bgDangerMedium: bgDangerMedium ?? this.bgDangerMedium,
      bgDanger: bgDanger ?? this.bgDanger,
      bgDangerStrong: bgDangerStrong ?? this.bgDangerStrong,
      bgWarningSoft: bgWarningSoft ?? this.bgWarningSoft,
      bgWarningMedium: bgWarningMedium ?? this.bgWarningMedium,
      bgWarning: bgWarning ?? this.bgWarning,
      bgWarningStrong: bgWarningStrong ?? this.bgWarningStrong,
      bgDarkStrong: bgDarkStrong ?? this.bgDarkStrong,
      bgDark: bgDark ?? this.bgDark,
      bgDisabled: bgDisabled ?? this.bgDisabled,
      bgPurple: bgPurple ?? this.bgPurple,
      bgSky: bgSky ?? this.bgSky,
      bgTeal: bgTeal ?? this.bgTeal,
      bgPink: bgPink ?? this.bgPink,
      bgCyan: bgCyan ?? this.bgCyan,
      bgFuschia: bgFuschia ?? this.bgFuschia,
      bgIndigo: bgIndigo ?? this.bgIndigo,
      bgOrange: bgOrange ?? this.bgOrange,
      bgVariantsGray: bgVariantsGray ?? this.bgVariantsGray,
      borderDark: borderDark ?? this.borderDark,
      borderBuffer: borderBuffer ?? this.borderBuffer,
      borderBufferMedium: borderBufferMedium ?? this.borderBufferMedium,
      borderBufferStrong: borderBufferStrong ?? this.borderBufferStrong,
      borderMuted: borderMuted ?? this.borderMuted,
      borderLightSubtle: borderLightSubtle ?? this.borderLightSubtle,
      borderLight: borderLight ?? this.borderLight,
      borderLightMedium: borderLightMedium ?? this.borderLightMedium,
      borderBaseSoft: borderBaseSoft ?? this.borderBaseSoft,
      borderBase: borderBase ?? this.borderBase,
      borderBaseMedium: borderBaseMedium ?? this.borderBaseMedium,
      borderBaseStrong: borderBaseStrong ?? this.borderBaseStrong,
      borderSuccessSubtle: borderSuccessSubtle ?? this.borderSuccessSubtle,
      borderSuccess: borderSuccess ?? this.borderSuccess,
      borderDangerSubtle: borderDangerSubtle ?? this.borderDangerSubtle,
      borderDanger: borderDanger ?? this.borderDanger,
      borderWarningSubtle: borderWarningSubtle ?? this.borderWarningSubtle,
      borderWarning: borderWarning ?? this.borderWarning,
      borderBrandSubtle: borderBrandSubtle ?? this.borderBrandSubtle,
      borderBrandLight: borderBrandLight ?? this.borderBrandLight,
      borderBrand: borderBrand ?? this.borderBrand,
      borderPurple: borderPurple ?? this.borderPurple,
      borderOrange: borderOrange ?? this.borderOrange,
      borderDarkSubtle: borderDarkSubtle ?? this.borderDarkSubtle,
    );
  }

  @override
  ThemeExtension<FlowbiteColorsExtension> lerp(
    covariant ThemeExtension<FlowbiteColorsExtension>? other,
    double t,
  ) {
    if (other is! FlowbiteColorsExtension) {
      return this;
    }

    return FlowbiteColorsExtension(
      textWhite: Color.lerp(textWhite, other.textWhite, t)!,
      textBlack: Color.lerp(textBlack, other.textBlack, t)!,
      textHeading: Color.lerp(textHeading, other.textHeading, t)!,
      textBody: Color.lerp(textBody, other.textBody, t)!,
      textBodySubtle: Color.lerp(textBodySubtle, other.textBodySubtle, t)!,
      textFgBrandSubtle: Color.lerp(
        textFgBrandSubtle,
        other.textFgBrandSubtle,
        t,
      )!,
      textFgBrand: Color.lerp(textFgBrand, other.textFgBrand, t)!,
      textFgBrandStrong: Color.lerp(
        textFgBrandStrong,
        other.textFgBrandStrong,
        t,
      )!,
      textFgSuccess: Color.lerp(textFgSuccess, other.textFgSuccess, t)!,
      textFgSuccessStrong: Color.lerp(
        textFgSuccessStrong,
        other.textFgSuccessStrong,
        t,
      )!,
      textFgDanger: Color.lerp(textFgDanger, other.textFgDanger, t)!,
      textFgDangerStrong: Color.lerp(
        textFgDangerStrong,
        other.textFgDangerStrong,
        t,
      )!,
      textFgWarningSubtle: Color.lerp(
        textFgWarningSubtle,
        other.textFgWarningSubtle,
        t,
      )!,
      textFgWarning: Color.lerp(textFgWarning, other.textFgWarning, t)!,
      textFgYellow: Color.lerp(textFgYellow, other.textFgYellow, t)!,
      textFgInfo: Color.lerp(textFgInfo, other.textFgInfo, t)!,
      textFgDisabled: Color.lerp(textFgDisabled, other.textFgDisabled, t)!,
      textFgPurple: Color.lerp(textFgPurple, other.textFgPurple, t)!,
      textFgCyan: Color.lerp(textFgCyan, other.textFgCyan, t)!,
      textFgIndigo: Color.lerp(textFgIndigo, other.textFgIndigo, t)!,
      textFgPink: Color.lerp(textFgPink, other.textFgPink, t)!,
      textFgLime: Color.lerp(textFgLime, other.textFgLime, t)!,
      bgWhite: Color.lerp(bgWhite, other.bgWhite, t)!,
      bgNeutralPrimarySoft: Color.lerp(
        bgNeutralPrimarySoft,
        other.bgNeutralPrimarySoft,
        t,
      )!,
      bgNeutralPrimary: Color.lerp(
        bgNeutralPrimary,
        other.bgNeutralPrimary,
        t,
      )!,
      bgNeutralPrimaryMedium: Color.lerp(
        bgNeutralPrimaryMedium,
        other.bgNeutralPrimaryMedium,
        t,
      )!,
      bgNeutralPrimaryStrong: Color.lerp(
        bgNeutralPrimaryStrong,
        other.bgNeutralPrimaryStrong,
        t,
      )!,
      bgNeutralSecondarySoft: Color.lerp(
        bgNeutralSecondarySoft,
        other.bgNeutralSecondarySoft,
        t,
      )!,
      bgNeutralSecondary: Color.lerp(
        bgNeutralSecondary,
        other.bgNeutralSecondary,
        t,
      )!,
      bgNeutralSecondaryMedium: Color.lerp(
        bgNeutralSecondaryMedium,
        other.bgNeutralSecondaryMedium,
        t,
      )!,
      bgNeutralSecondaryStrong: Color.lerp(
        bgNeutralSecondaryStrong,
        other.bgNeutralSecondaryStrong,
        t,
      )!,
      bgNeutralTertiarySoft: Color.lerp(
        bgNeutralTertiarySoft,
        other.bgNeutralTertiarySoft,
        t,
      )!,
      bgNeutralTertiary: Color.lerp(
        bgNeutralTertiary,
        other.bgNeutralTertiary,
        t,
      )!,
      bgNeutralTertiaryMedium: Color.lerp(
        bgNeutralTertiaryMedium,
        other.bgNeutralTertiaryMedium,
        t,
      )!,
      bgNeutralQuaternary: Color.lerp(
        bgNeutralQuaternary,
        other.bgNeutralQuaternary,
        t,
      )!,
      bgNeutralQuaternaryMedium: Color.lerp(
        bgNeutralQuaternaryMedium,
        other.bgNeutralQuaternaryMedium,
        t,
      )!,
      bgGray: Color.lerp(bgGray, other.bgGray, t)!,
      bgBrandSofter: Color.lerp(bgBrandSofter, other.bgBrandSofter, t)!,
      bgBrandSoft: Color.lerp(bgBrandSoft, other.bgBrandSoft, t)!,
      bgBrandMedium: Color.lerp(bgBrandMedium, other.bgBrandMedium, t)!,
      bgBrand: Color.lerp(bgBrand, other.bgBrand, t)!,
      bgBrandStrong: Color.lerp(bgBrandStrong, other.bgBrandStrong, t)!,
      bgSuccessSoft: Color.lerp(bgSuccessSoft, other.bgSuccessSoft, t)!,
      bgSuccessMedium: Color.lerp(bgSuccessMedium, other.bgSuccessMedium, t)!,
      bgSuccess: Color.lerp(bgSuccess, other.bgSuccess, t)!,
      bgSuccessStrong: Color.lerp(bgSuccessStrong, other.bgSuccessStrong, t)!,
      bgDangerSoft: Color.lerp(bgDangerSoft, other.bgDangerSoft, t)!,
      bgDangerMedium: Color.lerp(bgDangerMedium, other.bgDangerMedium, t)!,
      bgDanger: Color.lerp(bgDanger, other.bgDanger, t)!,
      bgDangerStrong: Color.lerp(bgDangerStrong, other.bgDangerStrong, t)!,
      bgWarningSoft: Color.lerp(bgWarningSoft, other.bgWarningSoft, t)!,
      bgWarningMedium: Color.lerp(bgWarningMedium, other.bgWarningMedium, t)!,
      bgWarning: Color.lerp(bgWarning, other.bgWarning, t)!,
      bgWarningStrong: Color.lerp(bgWarningStrong, other.bgWarningStrong, t)!,
      bgDarkStrong: Color.lerp(bgDarkStrong, other.bgDarkStrong, t)!,
      bgDark: Color.lerp(bgDark, other.bgDark, t)!,
      bgDisabled: Color.lerp(bgDisabled, other.bgDisabled, t)!,
      bgPurple: Color.lerp(bgPurple, other.bgPurple, t)!,
      bgSky: Color.lerp(bgSky, other.bgSky, t)!,
      bgTeal: Color.lerp(bgTeal, other.bgTeal, t)!,
      bgPink: Color.lerp(bgPink, other.bgPink, t)!,
      bgCyan: Color.lerp(bgCyan, other.bgCyan, t)!,
      bgFuschia: Color.lerp(bgFuschia, other.bgFuschia, t)!,
      bgIndigo: Color.lerp(bgIndigo, other.bgIndigo, t)!,
      bgOrange: Color.lerp(bgOrange, other.bgOrange, t)!,
      bgVariantsGray: Color.lerp(bgVariantsGray, other.bgVariantsGray, t)!,
      borderDark: Color.lerp(borderDark, other.borderDark, t)!,
      borderBuffer: Color.lerp(borderBuffer, other.borderBuffer, t)!,
      borderBufferMedium: Color.lerp(
        borderBufferMedium,
        other.borderBufferMedium,
        t,
      )!,
      borderBufferStrong: Color.lerp(
        borderBufferStrong,
        other.borderBufferStrong,
        t,
      )!,
      borderMuted: Color.lerp(borderMuted, other.borderMuted, t)!,
      borderLightSubtle: Color.lerp(
        borderLightSubtle,
        other.borderLightSubtle,
        t,
      )!,
      borderLight: Color.lerp(borderLight, other.borderLight, t)!,
      borderLightMedium: Color.lerp(
        borderLightMedium,
        other.borderLightMedium,
        t,
      )!,
      borderBaseSoft: Color.lerp(borderBaseSoft, other.borderBaseSoft, t)!,
      borderBase: Color.lerp(borderBase, other.borderBase, t)!,
      borderBaseMedium: Color.lerp(
        borderBaseMedium,
        other.borderBaseMedium,
        t,
      )!,
      borderBaseStrong: Color.lerp(
        borderBaseStrong,
        other.borderBaseStrong,
        t,
      )!,
      borderSuccessSubtle: Color.lerp(
        borderSuccessSubtle,
        other.borderSuccessSubtle,
        t,
      )!,
      borderSuccess: Color.lerp(borderSuccess, other.borderSuccess, t)!,
      borderDangerSubtle: Color.lerp(
        borderDangerSubtle,
        other.borderDangerSubtle,
        t,
      )!,
      borderDanger: Color.lerp(borderDanger, other.borderDanger, t)!,
      borderWarningSubtle: Color.lerp(
        borderWarningSubtle,
        other.borderWarningSubtle,
        t,
      )!,
      borderWarning: Color.lerp(borderWarning, other.borderWarning, t)!,
      borderBrandSubtle: Color.lerp(
        borderBrandSubtle,
        other.borderBrandSubtle,
        t,
      )!,
      borderBrandLight: Color.lerp(
        borderBrandLight,
        other.borderBrandLight,
        t,
      )!,
      borderBrand: Color.lerp(borderBrand, other.borderBrand, t)!,
      borderPurple: Color.lerp(borderPurple, other.borderPurple, t)!,
      borderOrange: Color.lerp(borderOrange, other.borderOrange, t)!,
      borderDarkSubtle: Color.lerp(
        borderDarkSubtle,
        other.borderDarkSubtle,
        t,
      )!,
    );
  }
}
