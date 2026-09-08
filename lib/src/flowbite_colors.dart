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

import 'package:flutter/widgets.dart';

class FlowbiteColor extends ColorSwatch<int> {
  const FlowbiteColor(super.primary, super._swatch);

  /// The lightest shade.
  Color get shade50 => this[50]!;

  /// The second lightest shade.
  Color get shade100 => this[100]!;

  /// The third lightest shade.
  Color get shade200 => this[200]!;

  /// The fourth lightest shade.
  Color get shade300 => this[300]!;

  /// The fifth lightest shade.
  Color get shade400 => this[400]!;

  /// The default shade.
  Color get shade500 => this[500]!;

  /// The fifth darkest shade.
  Color get shade600 => this[600]!;

  /// The fourth darkest shade.
  Color get shade700 => this[700]!;

  /// The third darkest shade.
  Color get shade800 => this[800]!;

  /// The second darkest shade.
  Color get shade900 => this[900]!;

  /// The darkest shade.
  Color get shade950 => this[950]!;
}

abstract final class FlowbiteColors {
  /// Brand
  static const FlowbiteColor brand = FlowbiteColor(
    _brandPrimaryValue,
    <int, Color>{
      50: Color(0xFFEFF6FF),
      100: Color(0xFFDBEAFE),
      200: Color(0xFFBEDBFF),
      300: Color(0xFF8EC5FF),
      400: Color(0xFF51A2FF),
      500: Color(_brandPrimaryValue),
      600: Color(0xFF155DFC),
      700: Color(0xFF1447E6),
      800: Color(0xFF193CB8),
      900: Color(0xFF1C398E),
      950: Color(0xFF162455),
    },
  );
  static const int _brandPrimaryValue = 0xFF2B7FFF;
  static const FlowbiteColor blue = brand;

  /// Slate
  static const FlowbiteColor slate = FlowbiteColor(
    _slatePrimaryValue,
    <int, Color>{
      50: Color(0xFFF8FAFC),
      100: Color(0xFFF1F5F9),
      200: Color(0xFFE2E8F0),
      300: Color(0xFFCAD5E2),
      400: Color(0xFF90A1B9),
      500: Color(_slatePrimaryValue),
      600: Color(0xFF45556C),
      700: Color(0xFF314158),
      800: Color(0xFF1D293D),
      900: Color(0xFF0F172B),
      950: Color(0xFF020618),
    },
  );
  static const int _slatePrimaryValue = 0xFF62748E;

  /// Gray
  static const FlowbiteColor gray = FlowbiteColor(
    _grayPrimaryValue,
    <int, Color>{
      50: Color(0xFFF9FAFB),
      100: Color(0xFFF3F4F6),
      200: Color(0xFFE5E7EB),
      300: Color(0xFFD1D5DC),
      400: Color(0xFF99A1AF),
      500: Color(_grayPrimaryValue),
      600: Color(0xFF4A5565),
      700: Color(0xFF364153),
      800: Color(0xFF1E2939),
      900: Color(0xFF101828),
      950: Color(0xFF030712),
    },
  );
  static const int _grayPrimaryValue = 0xFF6A7282;

  /// Zinc
  static const FlowbiteColor zinc = FlowbiteColor(
    _zincPrimaryValue,
    <int, Color>{
      50: Color(0xFFFAFAFA),
      100: Color(0xFFF4F4F5),
      200: Color(0xFFE4E4E7),
      300: Color(0xFFD4D4D8),
      400: Color(0xFF9F9FA9),
      500: Color(_zincPrimaryValue),
      600: Color(0xFF52525C),
      700: Color(0xFF3F3F46),
      800: Color(0xFF27272A),
      900: Color(0xFF18181B),
      950: Color(0xFF09090B),
    },
  );
  static const int _zincPrimaryValue = 0xFF71717B;

  /// Neutral
  static const FlowbiteColor neutral = FlowbiteColor(
    _neutralPrimaryValue,
    <int, Color>{
      50: Color(0xFFFAFAFA),
      100: Color(0xFFF5F5F5),
      200: Color(0xFFE5E5E5),
      300: Color(0xFFD4D4D4),
      400: Color(0xFFA1A1A1),
      500: Color(_neutralPrimaryValue),
      600: Color(0xFF525252),
      700: Color(0xFF404040),
      800: Color(0xFF262626),
      900: Color(0xFF171717),
      950: Color(0xFF0A0A0A),
    },
  );
  static const int _neutralPrimaryValue = 0xFF737373;

  /// Stone
  static const FlowbiteColor stone = FlowbiteColor(
    _stonePrimaryValue,
    <int, Color>{
      50: Color(0xFFFAFAF9),
      100: Color(0xFFF5F5F4),
      200: Color(0xFFE7E5E4),
      300: Color(0xFFD6D3D1),
      400: Color(0xFFA6A09B),
      500: Color(_stonePrimaryValue),
      600: Color(0xFF57534D),
      700: Color(0xFF44403B),
      800: Color(0xFF292524),
      900: Color(0xFF1C1917),
      950: Color(0xFF0C0A09),
    },
  );
  static const int _stonePrimaryValue = 0xFF79716B;

  /// Red
  static const FlowbiteColor red = FlowbiteColor(_redPrimaryValue, <int, Color>{
    50: Color(0xFFFEF2F2),
    100: Color(0xFFFFE2E2),
    200: Color(0xFFFFC9C9),
    300: Color(0xFFFFA2A2),
    400: Color(0xFFFF6467),
    500: Color(_redPrimaryValue),
    600: Color(0xFFE7000B),
    700: Color(0xFFC10007),
    800: Color(0xFF9F0712),
    900: Color(0xFF82181A),
    950: Color(0xFF460809),
  });
  static const int _redPrimaryValue = 0xFFFB2C36;

  /// Orange
  static const FlowbiteColor orange = FlowbiteColor(
    _orangePrimaryValue,
    <int, Color>{
      50: Color(0xFFFFF8F1),
      100: Color(0xFFFEECDC),
      200: Color(0xFFFCD9BD),
      300: Color(0xFFFDBA8C),
      400: Color(0xFFFF8A4C),
      500: Color(_orangePrimaryValue),
      600: Color(0xFFD03801),
      700: Color(0xFFB43403),
      800: Color(0xFF8A2C0D),
      900: Color(0xFF771D1D),
      950: Color(0xFF441306),
    },
  );
  static const int _orangePrimaryValue = 0xFFFF5A1F;

  /// Amber
  static const FlowbiteColor amber = FlowbiteColor(
    _amberPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFFBEB),
      100: Color(0xFFFEF3C6),
      200: Color(0xFFFEE685),
      300: Color(0xFFFFD230),
      400: Color(0xFFFFB900),
      500: Color(_amberPrimaryValue),
      600: Color(0xFFE17100),
      700: Color(0xFFBB4D00),
      800: Color(0xFF973C00),
      900: Color(0xFF7B3306),
      950: Color(0xFF461901),
    },
  );
  static const int _amberPrimaryValue = 0xFFFE9A00;

  /// Yellow
  static const FlowbiteColor yellow = FlowbiteColor(
    _yellowPrimaryValue,
    <int, Color>{
      50: Color(0xFFFEFCE8),
      100: Color(0xFFFEF9C2),
      200: Color(0xFFFFF085),
      300: Color(0xFFFFDF20),
      400: Color(0xFFFDC700),
      500: Color(_yellowPrimaryValue),
      600: Color(0xFFD08700),
      700: Color(0xFFA65F00),
      800: Color(0xFF894B00),
      900: Color(0xFF733E0A),
      950: Color(0xFF432004),
    },
  );
  static const int _yellowPrimaryValue = 0xFFF0B100;

  /// Lime
  static const FlowbiteColor lime = FlowbiteColor(
    _limePrimaryValue,
    <int, Color>{
      50: Color(0xFFF7FEE7),
      100: Color(0xFFECFCCA),
      200: Color(0xFFD8F999),
      300: Color(0xFFBBF451),
      400: Color(0xFF9AE600),
      500: Color(_limePrimaryValue),
      600: Color(0xFF5EA500),
      700: Color(0xFF497D00),
      800: Color(0xFF3C6300),
      900: Color(0xFF35530E),
      950: Color(0xFF192E03),
    },
  );
  static const int _limePrimaryValue = 0xFF7CCF00;

  /// Green
  static const FlowbiteColor green = FlowbiteColor(
    _greenPrimaryValue,
    <int, Color>{
      50: Color(0xFFF0FDF4),
      100: Color(0xFFDCFCE7),
      200: Color(0xFFB9F8CF),
      300: Color(0xFF7BF1A8),
      400: Color(0xFF05DF72),
      500: Color(_greenPrimaryValue),
      600: Color(0xFF00A63E),
      700: Color(0xFF008236),
      800: Color(0xFF016630),
      900: Color(0xFF0D542B),
      950: Color(0xFF032E15),
    },
  );
  static const int _greenPrimaryValue = 0xFF00C950;

  /// Emerald
  static const FlowbiteColor emerald = FlowbiteColor(
    _emeraldPrimaryValue,
    <int, Color>{
      50: Color(0xFFECFDF5),
      100: Color(0xFFD0FAE5),
      200: Color(0xFFA4F4CF),
      300: Color(0xFF5EE9B5),
      400: Color(0xFF00D492),
      500: Color(_emeraldPrimaryValue),
      600: Color(0xFF009966),
      700: Color(0xFF007A55),
      800: Color(0xFF006045),
      900: Color(0xFF004F3B),
      950: Color(0xFF002C22),
    },
  );
  static const int _emeraldPrimaryValue = 0xFF00BC7D;

  /// Teal
  static const FlowbiteColor teal = FlowbiteColor(
    _tealPrimaryValue,
    <int, Color>{
      50: Color(0xFFF0FDFA),
      100: Color(0xFFCBFBF1),
      200: Color(0xFF96F7E4),
      300: Color(0xFF46ECD5),
      400: Color(0xFF00D5BE),
      500: Color(_tealPrimaryValue),
      600: Color(0xFF009689),
      700: Color(0xFF00786F),
      800: Color(0xFF005F59),
      900: Color(0xFF0D4E4A),
      950: Color(0xFF032F2E),
    },
  );
  static const int _tealPrimaryValue = 0xFF00BBA7;

  /// Cyan
  static const FlowbiteColor cyan = FlowbiteColor(
    _cyanPrimaryValue,
    <int, Color>{
      50: Color(0xFFECFEFF),
      100: Color(0xFFCEFAFE),
      200: Color(0xFFA2F4FD),
      300: Color(0xFF53EAFD),
      400: Color(0xFF00D3F2),
      500: Color(_cyanPrimaryValue),
      600: Color(0xFF0092B8),
      700: Color(0xFF007595),
      800: Color(0xFF005F78),
      900: Color(0xFF104E64),
      950: Color(0xFF053345),
    },
  );
  static const int _cyanPrimaryValue = 0xFF00B8DB;

  /// Sky
  static const FlowbiteColor sky = FlowbiteColor(_skyPrimaryValue, <int, Color>{
    50: Color(0xFFF0F9FF),
    100: Color(0xFFDFF2FE),
    200: Color(0xFFB8E6FE),
    300: Color(0xFF74D4FF),
    400: Color(0xFF00BCFF),
    500: Color(_skyPrimaryValue),
    600: Color(0xFF0084D1),
    700: Color(0xFF0069A8),
    800: Color(0xFF00598A),
    900: Color(0xFF024A70),
    950: Color(0xFF052F4A),
  });
  static const int _skyPrimaryValue = 0xFF00A6F4;

  /// Indigo
  static const FlowbiteColor indigo = FlowbiteColor(
    _indigoPrimaryValue,
    <int, Color>{
      50: Color(0xFFEEF2FF),
      100: Color(0xFFE0E7FF),
      200: Color(0xFFC6D2FF),
      300: Color(0xFFA3B3FF),
      400: Color(0xFF7C86FF),
      500: Color(_indigoPrimaryValue),
      600: Color(0xFF4F39F6),
      700: Color(0xFF432DD7),
      800: Color(0xFF372AAC),
      900: Color(0xFF312C85),
      950: Color(0xFF1E1A4D),
    },
  );
  static const int _indigoPrimaryValue = 0xFF615FFF;

  /// Violet
  static const FlowbiteColor violet = FlowbiteColor(
    _violetPrimaryValue,
    <int, Color>{
      50: Color(0xFFF5F3FF),
      100: Color(0xFFEDE9FE),
      200: Color(0xFFDDD6FF),
      300: Color(0xFFC4B4FF),
      400: Color(0xFFA684FF),
      500: Color(_violetPrimaryValue),
      600: Color(0xFF7F22FE),
      700: Color(0xFF7008E7),
      800: Color(0xFF5D0EC0),
      900: Color(0xFF4D179A),
      950: Color(0xFF2F0D68),
    },
  );
  static const int _violetPrimaryValue = 0xFF8E51FF;

  /// Purple
  static const FlowbiteColor purple = FlowbiteColor(
    _purplePrimaryValue,
    <int, Color>{
      50: Color(0xFFFAF5FF),
      100: Color(0xFFF3E8FF),
      200: Color(0xFFE9D4FF),
      300: Color(0xFFDAB2FF),
      400: Color(0xFFC27AFF),
      500: Color(_purplePrimaryValue),
      600: Color(0xFF9810FA),
      700: Color(0xFF8200DB),
      800: Color(0xFF6E11B0),
      900: Color(0xFF59168B),
      950: Color(0xFF3C0366),
    },
  );
  static const int _purplePrimaryValue = 0xFFAD46FF;

  /// Fuschia
  static const FlowbiteColor fuschia = FlowbiteColor(
    _fuschiaPrimaryValue,
    <int, Color>{
      50: Color(0xFFFDF4FF),
      100: Color(0xFFFAE8FF),
      200: Color(0xFFF6CFFF),
      300: Color(0xFFF4A8FF),
      400: Color(0xFFED6AFF),
      500: Color(_fuschiaPrimaryValue),
      600: Color(0xFFC800DE),
      700: Color(0xFFA800B7),
      800: Color(0xFF8A0194),
      900: Color(0xFF721378),
      950: Color(0xFF4B004F),
    },
  );
  static const int _fuschiaPrimaryValue = 0xFFE12AFB;

  /// Pink
  static const FlowbiteColor pink = FlowbiteColor(
    _pinkPrimaryValue,
    <int, Color>{
      50: Color(0xFFFDF2F8),
      100: Color(0xFFFCE7F3),
      200: Color(0xFFFCCEE8),
      300: Color(0xFFFDA5D5),
      400: Color(0xFFFB64B6),
      500: Color(_pinkPrimaryValue),
      600: Color(0xFFE60076),
      700: Color(0xFFC6005C),
      800: Color(0xFFA3004C),
      900: Color(0xFF861043),
      950: Color(0xFF510424),
    },
  );
  static const int _pinkPrimaryValue = 0xFFF6339A;

  /// Rose
  static const FlowbiteColor rose = FlowbiteColor(
    _rosePrimaryValue,
    <int, Color>{
      50: Color(0xFFFFF1F2),
      100: Color(0xFFFFE4E6),
      200: Color(0xFFFFCCD3),
      300: Color(0xFFFFA1AD),
      400: Color(0xFFFF637E),
      500: Color(_rosePrimaryValue),
      600: Color(0xFFEC003F),
      700: Color(0xFFC70036),
      800: Color(0xFFA50036),
      900: Color(0xFF8B0836),
      950: Color(0xFF4D0218),
    },
  );
  static const int _rosePrimaryValue = 0xFFFF2056;

  static Color white = const Color(0xFFFFFFFF);

  /// Text color variables.
  /// 1. Light mode.
  static Color textWhite = white;
  static Color textBlack = gray.shade900;
  static Color textHeading = gray.shade900;
  static Color textBody = gray.shade600;
  static Color textBodySubtle = gray.shade500;
  static Color textFgBrandSubtle = blue.shade200;
  static Color textFgBrand = blue.shade700;
  static Color textFgBrandStrong = blue.shade900;
  static Color textFgSuccess = emerald.shade700;
  static Color textFgSuccessStrong = emerald.shade900;
  static Color textFgDanger = rose.shade700;
  static Color textFgDangerStrong = rose.shade900;
  static Color textFgWarningSubtle = orange.shade600;
  static Color textFgWarning = orange.shade900;
  static Color textFgYellow = yellow.shade400;
  static Color textFgInfo = blue.shade900;
  static Color textFgDisabled = gray.shade400;
  static Color textFgPurple = purple.shade600;
  static Color textFgCyan = cyan.shade600;
  static Color textFgIndigo = indigo.shade600;
  static Color textFgPink = pink.shade600;
  static Color textFgLime = lime.shade600;

  /// 2. Dark mode.
  static Color textHeadingDark = white;
  static Color textBodyDark = gray.shade400;
  static Color textBodySubtleDark = gray.shade400;
  static Color textFgBrandSubtleDark = blue.shade200;
  static Color textFgBrandDark = blue.shade500;
  static Color textFgBrandStrongDark = blue.shade400;
  static Color textFgSuccessDark = emerald.shade600;
  static Color textFgSuccessStrongDark = emerald.shade300;
  static Color textFgDangerDark = rose.shade500;
  static Color textFgDangerStrongDark = rose.shade300;
  static Color textFgWarningSubtleDark = orange.shade500;
  static Color textFgWarningDark = orange.shade300;
  static Color textFgYellowDark = yellow.shade400;
  static Color textFgInfoDark = blue.shade300;
  static Color textFgDisabledDark = gray.shade600;
  static Color textFgPurpleDark = purple.shade500;
  static Color textFgCyanDark = cyan.shade500;
  static Color textFgIndigoDark = indigo.shade500;
  static Color textFgPinkDark = pink.shade500;
  static Color textFgLimeDark = lime.shade500;

  /// Background color variables.
  /// 1. Light mode.
  static Color bgWhite = white;
  static Color bgNeutralPrimarySoft = white;
  static Color bgNeutralPrimary = white;
  static Color bgNeutralPrimaryMedium = white;
  static Color bgNeutralPrimaryStrong = white;
  static Color bgNeutralSecondarySoft = gray.shade50;
  static Color bgNeutralSecondary = gray.shade50;
  static Color bgNeutralSecondaryMedium = gray.shade50;
  static Color bgNeutralSecondaryStrong = gray.shade50;
  static Color bgNeutralTertiarySoft = gray.shade100;
  static Color bgNeutralTertiary = gray.shade100;
  static Color bgNeutralTertiaryMedium = gray.shade100;
  static Color bgNeutralQuaternary = gray.shade200;
  static Color bgNeutralQuaternaryMedium = gray.shade200;
  static Color bgGray = gray.shade300;
  static Color bgBrandSofter = blue.shade50;
  static Color bgBrandSoft = blue.shade100;
  static Color bgBrandMedium = blue.shade200;
  static Color bgBrand = blue.shade700;
  static Color bgBrandStrong = blue.shade800;
  static Color bgSuccessSoft = emerald.shade50;
  static Color bgSuccessMedium = emerald.shade100;
  static Color bgSuccess = emerald.shade700;
  static Color bgSuccessStrong = emerald.shade800;
  static Color bgDangerSoft = rose.shade50;
  static Color bgDangerMedium = rose.shade100;
  static Color bgDanger = rose.shade700;
  static Color bgDangerStrong = rose.shade800;
  static Color bgWarningSoft = orange.shade50;
  static Color bgWarningMedium = orange.shade100;
  static Color bgWarning = orange.shade500;
  static Color bgWarningStrong = orange.shade700;
  static Color bgDarkStrong = gray.shade900;
  static Color bgDark = gray.shade800;
  static Color bgDisabled = gray.shade100;
  static Color bgPurple = purple.shade500;
  static Color bgSky = sky.shade500;
  static Color bgTeal = teal.shade600;
  static Color bgPink = pink.shade600;
  static Color bgCyan = cyan.shade500;
  static Color bgFuschia = fuschia.shade600;
  static Color bgIndigo = indigo.shade600;
  static Color bgOrange = orange.shade400;

  /// 2. Dark mode.
  static Color bgNeutralPrimarySoftDark = gray.shade900;
  static Color bgNeutralPrimaryDark = gray.shade950;
  static Color bgNeutralPrimaryMediumDark = gray.shade800;
  static Color bgNeutralPrimaryStrongDark = gray.shade700;
  static Color bgNeutralSecondarySoftDark = gray.shade200;
  static Color bgNeutralSecondaryDark = gray.shade950;
  static Color bgNeutralSecondaryMediumDark = gray.shade800;
  static Color bgNeutralSecondaryStrongDark = gray.shade700;
  static Color bgNeutralTertiarySoftDark = gray.shade900;
  static Color bgNeutralTertiaryDark = gray.shade800;
  static Color bgNeutralTertiaryMediumDark = gray.shade700;
  static Color bgNeutralQuaternaryDark = gray.shade700;
  static Color bgNeutralQuaternaryMediumDark = gray.shade600;
  static Color bgGrayDark = gray.shade600;
  static Color bgBrandSofterDark = blue.shade950;
  static Color bgBrandSoftDark = blue.shade900;
  static Color bgBrandMediumDark = blue.shade900;
  static Color bgBrandDark = blue.shade600;
  static Color bgBrandStrongDark = blue.shade700;
  static Color bgSuccessSoftDark = emerald.shade950;
  static Color bgSuccessMediumDark = emerald.shade900;
  static Color bgSuccessDark = emerald.shade600;
  static Color bgSuccessStrongDark = emerald.shade700;
  static Color bgDangerSoftDark = rose.shade950;
  static Color bgDangerMediumDark = rose.shade900;
  static Color bgDangerDark = rose.shade700;
  static Color bgDangerStrongDark = rose.shade700;
  static Color bgWarningSoftDark = orange.shade950;
  static Color bgWarningMediumDark = orange.shade900;
  static Color bgWarningDark = orange.shade600;
  static Color bgWarningStrongDark = orange.shade700;
  static Color bgDarkStrongDark = gray.shade800;
  static Color bgDarkDark = gray.shade800;
  static Color bgDisabledDark = gray.shade800;
  static Color bgPurpleDark = purple.shade500;
  static Color bgSkyDark = sky.shade500;
  static Color bgTealDark = teal.shade500;
  static Color bgPinkDark = pink.shade500;
  static Color bgCyanDark = cyan.shade500;
  static Color bgFuschiaDark = fuschia.shade500;
  static Color bgIndigoDark = indigo.shade500;
  static Color bgOrangeDark = orange.shade400;

  /// Border color variables.
  /// 1. Light mode.
  static Color borderDark = gray.shade600;
  static Color borderBuffer = white;
  static Color borderBufferMedium = white;
  static Color borderBufferStrong = white;
  static Color borderMuted = gray.shade50;
  static Color borderLightSubtle = gray.shade100;
  static Color borderLight = gray.shade100;
  static Color borderLightMedium = gray.shade100;
  static Color borderBaseSoft = gray.shade200;
  static Color borderBase = gray.shade200;
  static Color borderBaseMedium = gray.shade200;
  static Color borderBaseStrong = gray.shade200;
  static Color borderSuccessSubtle = emerald.shade200;
  static Color borderSuccess = emerald.shade700;
  static Color borderDangerSubtle = rose.shade200;
  static Color borderDanger = rose.shade700;
  static Color borderWarningSubtle = orange.shade200;
  static Color borderWarning = orange.shade600;
  static Color borderBrandSubtle = blue.shade200;
  static Color borderBrandLight = blue.shade600;
  static Color borderBrand = blue.shade700;
  static Color borderPurple = purple.shade500;
  static Color borderOrange = orange.shade400;
  static Color borderDarkSubtle = gray.shade800;

  /// 2. Dark mode.
  static Color borderBufferDark = gray.shade950;
  static Color borderBufferMediumDark = gray.shade900;
  static Color borderBufferStrongDark = gray.shade800;
  static Color borderMutedDark = gray.shade900;
  static Color borderLightSubtleDark = gray.shade900;
  static Color borderLightDark = gray.shade800;
  static Color borderLightMediumDark = gray.shade700;
  static Color borderBaseSoftDark = gray.shade900;
  static Color borderBaseDark = gray.shade800;
  static Color borderBaseMediumDark = gray.shade700;
  static Color borderBaseStrongDark = gray.shade600;
  static Color borderSuccessSubtleDark = emerald.shade900;
  static Color borderSuccessDark = emerald.shade600;
  static Color borderDangerSubtleDark = rose.shade900;
  static Color borderDangerDark = rose.shade600;
  static Color borderWarningSubtleDark = orange.shade900;
  static Color borderWarningDark = orange.shade500;
  static Color borderBrandSubtleDark = blue.shade900;
  static Color borderBrandLightDark = blue.shade600;
  static Color borderBrandDark = blue.shade500;
  static Color borderPurpleDark = purple.shade500;
  static Color borderOrangeDark = orange.shade400;
  static Color borderDarkSubtleDark = gray.shade700;
}
