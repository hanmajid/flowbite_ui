import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';

class ColorSection extends StatelessWidget {
  const ColorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24.0,
      children: [
        _buildPrimitiveColorsSection(context),
        _buildTextColorVariables(context),
        _buildBackgroundColorVariables(context),
        _buildBorderColorVariables(context),
      ],
    );
  }

  Widget _buildPrimitiveColorsSection(BuildContext context) {
    return Column(
      spacing: 8.0,
      children: [
        Text('Primitive Colors'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 8.0,
            children: [
              ...[
                FlowbiteColors.brand,
                FlowbiteColors.slate,
                FlowbiteColors.gray,
                FlowbiteColors.zinc,
                FlowbiteColors.neutral,
                FlowbiteColors.stone,
                FlowbiteColors.red,
                FlowbiteColors.orange,
                FlowbiteColors.amber,
                FlowbiteColors.yellow,
                FlowbiteColors.lime,
                FlowbiteColors.green,
                FlowbiteColors.emerald,
                FlowbiteColors.teal,
                FlowbiteColors.cyan,
                FlowbiteColors.sky,
                FlowbiteColors.indigo,
                FlowbiteColors.violet,
                FlowbiteColors.purple,
                FlowbiteColors.fuschia,
                FlowbiteColors.pink,
                FlowbiteColors.rose,
              ].map(
                (colors) => Column(
                  spacing: 8.0,
                  children:
                      [950, 900, 800, 700, 600, 500, 400, 300, 200, 100, 50]
                          .map(
                            (shade) => Container(
                              height: 40.0,
                              width: 40.0,
                              color: colors[shade],
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextColorVariables(BuildContext context) {
    return Column(
      spacing: 8.0,
      children: [
        Text('Text Color Variables'),
        ...[
          (
            name: 'text-white',
            color: FlowbiteColors.textWhite,
            colorDark: FlowbiteColors.textWhite,
          ),
          (
            name: 'text-black',
            color: FlowbiteColors.textBlack,
            colorDark: FlowbiteColors.textBlack,
          ),
          (
            name: 'text-heading',
            color: FlowbiteColors.textHeading,
            colorDark: FlowbiteColors.textHeadingDark,
          ),
          (
            name: 'text-body',
            color: FlowbiteColors.textBody,
            colorDark: FlowbiteColors.textBodyDark,
          ),
          (
            name: 'text-body-subtle',
            color: FlowbiteColors.textBodySubtle,
            colorDark: FlowbiteColors.textBodySubtleDark,
          ),
          (
            name: 'text-fg-brand-subtle',
            color: FlowbiteColors.textFgBrandSubtle,
            colorDark: FlowbiteColors.textFgBrandSubtleDark,
          ),
          (
            name: 'text-fg-brand-strong',
            color: FlowbiteColors.textFgBrandStrong,
            colorDark: FlowbiteColors.textFgBrandStrongDark,
          ),
          (
            name: 'text-fg-success',
            color: FlowbiteColors.textFgSuccess,
            colorDark: FlowbiteColors.textFgSuccessDark,
          ),
          (
            name: 'text-fg-success-strong',
            color: FlowbiteColors.textFgSuccessStrong,
            colorDark: FlowbiteColors.textFgSuccessStrongDark,
          ),
          (
            name: 'text-fg-danger',
            color: FlowbiteColors.textFgDanger,
            colorDark: FlowbiteColors.textFgDangerDark,
          ),
          (
            name: 'text-fg-danger-strong',
            color: FlowbiteColors.textFgDangerStrong,
            colorDark: FlowbiteColors.textFgDangerStrongDark,
          ),
          (
            name: 'text-fg-warning-subtle',
            color: FlowbiteColors.textFgWarningSubtle,
            colorDark: FlowbiteColors.textFgWarningSubtleDark,
          ),
          (
            name: 'text-fg-warning',
            color: FlowbiteColors.textFgWarning,
            colorDark: FlowbiteColors.textFgWarningDark,
          ),
          (
            name: 'text-fg-yellow',
            color: FlowbiteColors.textFgYellow,
            colorDark: FlowbiteColors.textFgYellowDark,
          ),
          (
            name: 'text-fg-info',
            color: FlowbiteColors.textFgInfo,
            colorDark: FlowbiteColors.textFgInfoDark,
          ),
          (
            name: 'text-fg-disabled',
            color: FlowbiteColors.textFgDisabled,
            colorDark: FlowbiteColors.textFgDisabledDark,
          ),
          (
            name: 'text-fg-purple',
            color: FlowbiteColors.textFgPurple,
            colorDark: FlowbiteColors.textFgPurpleDark,
          ),
          (
            name: 'text-fg-cyan',
            color: FlowbiteColors.textFgCyan,
            colorDark: FlowbiteColors.textFgCyanDark,
          ),
          (
            name: 'text-fg-indigo',
            color: FlowbiteColors.textFgIndigo,
            colorDark: FlowbiteColors.textFgIndigoDark,
          ),
          (
            name: 'text-fg-pink',
            color: FlowbiteColors.textFgPink,
            colorDark: FlowbiteColors.textFgPinkDark,
          ),
          (
            name: 'text-fg-lime',
            color: FlowbiteColors.textFgLime,
            colorDark: FlowbiteColors.textFgLimeDark,
          ),
        ].map(
          (colorVar) => Row(
            spacing: 8.0,
            children: [
              Expanded(
                child: _buildColorVariableCard(
                  name: colorVar.name,
                  color: colorVar.color,
                ),
              ),
              Expanded(
                child: _buildColorVariableCard(
                  name: colorVar.name,
                  color: colorVar.colorDark,
                  isDark: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBackgroundColorVariables(BuildContext context) {
    return Column(
      spacing: 8.0,
      children: [
        Text('Background Color Variables'),
        ...[
          (
            name: 'bg-white',
            color: FlowbiteColors.bgWhite,
            colorDark: FlowbiteColors.bgWhite,
          ),
          (
            name: 'bg-neutral-primary-soft',
            color: FlowbiteColors.bgNeutralPrimarySoft,
            colorDark: FlowbiteColors.bgNeutralPrimarySoftDark,
          ),
          (
            name: 'bg-neutral-primary',
            color: FlowbiteColors.bgNeutralPrimary,
            colorDark: FlowbiteColors.bgNeutralPrimaryDark,
          ),
          (
            name: 'bg-neutral-primary-medium',
            color: FlowbiteColors.bgNeutralPrimaryMedium,
            colorDark: FlowbiteColors.bgNeutralPrimaryMediumDark,
          ),
          (
            name: 'bg-neutral-primary-strong',
            color: FlowbiteColors.bgNeutralPrimaryStrong,
            colorDark: FlowbiteColors.bgNeutralPrimaryStrongDark,
          ),
          (
            name: 'bg-neutral-secondary-soft',
            color: FlowbiteColors.bgNeutralSecondarySoft,
            colorDark: FlowbiteColors.bgNeutralSecondarySoftDark,
          ),
          (
            name: 'bg-neutral-secondary',
            color: FlowbiteColors.bgNeutralSecondary,
            colorDark: FlowbiteColors.bgNeutralSecondaryDark,
          ),
          (
            name: 'bg-neutral-secondary-medium',
            color: FlowbiteColors.bgNeutralSecondaryMedium,
            colorDark: FlowbiteColors.bgNeutralSecondaryMediumDark,
          ),
          (
            name: 'bg-neutral-secondary-strong',
            color: FlowbiteColors.bgNeutralSecondaryStrong,
            colorDark: FlowbiteColors.bgNeutralSecondaryStrongDark,
          ),
          (
            name: 'bg-neutral-tertiary-soft',
            color: FlowbiteColors.bgNeutralTertiarySoft,
            colorDark: FlowbiteColors.bgNeutralTertiarySoftDark,
          ),
          (
            name: 'bg-neutral-tertiary',
            color: FlowbiteColors.bgNeutralTertiary,
            colorDark: FlowbiteColors.bgNeutralTertiaryDark,
          ),
          (
            name: 'bg-neutral-tertiary-medium',
            color: FlowbiteColors.bgNeutralTertiaryMedium,
            colorDark: FlowbiteColors.bgNeutralTertiaryMediumDark,
          ),
          (
            name: 'bg-neutral-quaternary',
            color: FlowbiteColors.bgNeutralQuaternary,
            colorDark: FlowbiteColors.bgNeutralQuaternaryDark,
          ),
          (
            name: 'bg-neutral-quaternary-medium',
            color: FlowbiteColors.bgNeutralQuaternaryMedium,
            colorDark: FlowbiteColors.bgNeutralQuaternaryMediumDark,
          ),
          (
            name: 'bg-gray',
            color: FlowbiteColors.bgGray,
            colorDark: FlowbiteColors.bgGrayDark,
          ),
          (
            name: 'bg-brand-softer',
            color: FlowbiteColors.bgBrandSofter,
            colorDark: FlowbiteColors.bgBrandSofterDark,
          ),
          (
            name: 'bg-brand-soft',
            color: FlowbiteColors.bgBrandSoft,
            colorDark: FlowbiteColors.bgBrandSoftDark,
          ),
          (
            name: 'bg-brand-medium',
            color: FlowbiteColors.bgBrandMedium,
            colorDark: FlowbiteColors.bgBrandMediumDark,
          ),
          (
            name: 'bg-brand',
            color: FlowbiteColors.bgBrand,
            colorDark: FlowbiteColors.bgBrandDark,
          ),
          (
            name: 'bg-brand-strong',
            color: FlowbiteColors.bgBrandStrong,
            colorDark: FlowbiteColors.bgBrandStrongDark,
          ),
          (
            name: 'bg-success-soft',
            color: FlowbiteColors.bgSuccessSoft,
            colorDark: FlowbiteColors.bgSuccessSoftDark,
          ),
          (
            name: 'bg-success-medium',
            color: FlowbiteColors.bgSuccessMedium,
            colorDark: FlowbiteColors.bgSuccessMediumDark,
          ),
          (
            name: 'bg-success',
            color: FlowbiteColors.bgSuccess,
            colorDark: FlowbiteColors.bgSuccessDark,
          ),
          (
            name: 'bg-success-strong',
            color: FlowbiteColors.bgSuccessStrong,
            colorDark: FlowbiteColors.bgSuccessStrongDark,
          ),
          (
            name: 'bg-danger-soft',
            color: FlowbiteColors.bgDangerSoft,
            colorDark: FlowbiteColors.bgDangerSoftDark,
          ),
          (
            name: 'bg-danger-medium',
            color: FlowbiteColors.bgDangerMedium,
            colorDark: FlowbiteColors.bgDangerMediumDark,
          ),
          (
            name: 'bg-danger',
            color: FlowbiteColors.bgDanger,
            colorDark: FlowbiteColors.bgDangerDark,
          ),
          (
            name: 'bg-danger-strong',
            color: FlowbiteColors.bgDangerStrong,
            colorDark: FlowbiteColors.bgDangerStrongDark,
          ),
          (
            name: 'bg-warning-soft',
            color: FlowbiteColors.bgWarningSoft,
            colorDark: FlowbiteColors.bgWarningSoftDark,
          ),
          (
            name: 'bg-warning-medium',
            color: FlowbiteColors.bgWarningMedium,
            colorDark: FlowbiteColors.bgWarningMediumDark,
          ),
          (
            name: 'bg-warning',
            color: FlowbiteColors.bgWarning,
            colorDark: FlowbiteColors.bgWarningDark,
          ),
          (
            name: 'bg-warning-strong',
            color: FlowbiteColors.bgWarningStrong,
            colorDark: FlowbiteColors.bgWarningStrongDark,
          ),
          (
            name: 'bg-dark-strong',
            color: FlowbiteColors.bgDarkStrong,
            colorDark: FlowbiteColors.bgDarkStrongDark,
          ),
          (
            name: 'bg-dark',
            color: FlowbiteColors.bgDark,
            colorDark: FlowbiteColors.bgDarkDark,
          ),
          (
            name: 'bg-disabled',
            color: FlowbiteColors.bgDisabled,
            colorDark: FlowbiteColors.bgDisabledDark,
          ),
          (
            name: 'bg-purple',
            color: FlowbiteColors.bgPurple,
            colorDark: FlowbiteColors.bgPurpleDark,
          ),
          (
            name: 'bg-sky',
            color: FlowbiteColors.bgSky,
            colorDark: FlowbiteColors.bgSkyDark,
          ),
          (
            name: 'bg-teal',
            color: FlowbiteColors.bgTeal,
            colorDark: FlowbiteColors.bgTealDark,
          ),
          (
            name: 'bg-pink',
            color: FlowbiteColors.bgPink,
            colorDark: FlowbiteColors.bgPinkDark,
          ),
          (
            name: 'bg-cyan',
            color: FlowbiteColors.bgCyan,
            colorDark: FlowbiteColors.bgCyanDark,
          ),
          (
            name: 'bg-fuschia',
            color: FlowbiteColors.bgFuschia,
            colorDark: FlowbiteColors.bgFuschiaDark,
          ),
          (
            name: 'bg-indigo',
            color: FlowbiteColors.bgIndigo,
            colorDark: FlowbiteColors.bgIndigoDark,
          ),
          (
            name: 'bg-orange',
            color: FlowbiteColors.bgOrange,
            colorDark: FlowbiteColors.bgOrangeDark,
          ),
        ].map(
          (colorVar) => Row(
            spacing: 8.0,
            children: [
              Expanded(
                child: _buildColorVariableCard(
                  name: colorVar.name,
                  color: colorVar.color,
                ),
              ),
              Expanded(
                child: _buildColorVariableCard(
                  name: colorVar.name,
                  color: colorVar.colorDark,
                  isDark: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBorderColorVariables(BuildContext context) {
    return Column(
      spacing: 8.0,
      children: [
        Text('Border Color Variables'),
        ...[
          (
            name: 'border-dark',
            color: FlowbiteColors.borderDark,
            colorDark: FlowbiteColors.borderDark,
          ),
          (
            name: 'border-buffer',
            color: FlowbiteColors.borderBuffer,
            colorDark: FlowbiteColors.borderBufferDark,
          ),
          (
            name: 'border-buffer-medium',
            color: FlowbiteColors.borderBufferMedium,
            colorDark: FlowbiteColors.borderBufferMediumDark,
          ),
          (
            name: 'border-buffer-strong',
            color: FlowbiteColors.borderBufferStrong,
            colorDark: FlowbiteColors.borderBufferStrongDark,
          ),
          (
            name: 'border-muted',
            color: FlowbiteColors.borderMuted,
            colorDark: FlowbiteColors.borderMutedDark,
          ),
          (
            name: 'border-light-subtle',
            color: FlowbiteColors.borderLightSubtle,
            colorDark: FlowbiteColors.borderLightSubtleDark,
          ),
          (
            name: 'border-light',
            color: FlowbiteColors.borderLight,
            colorDark: FlowbiteColors.borderLightDark,
          ),
          (
            name: 'border-light-medium',
            color: FlowbiteColors.borderLightMedium,
            colorDark: FlowbiteColors.borderLightMediumDark,
          ),
          (
            name: 'border-base-soft',
            color: FlowbiteColors.borderBaseSoft,
            colorDark: FlowbiteColors.borderBaseSoftDark,
          ),
          (
            name: 'border-base',
            color: FlowbiteColors.borderBase,
            colorDark: FlowbiteColors.borderBaseDark,
          ),
          (
            name: 'border-base-medium',
            color: FlowbiteColors.borderBaseMedium,
            colorDark: FlowbiteColors.borderBaseMediumDark,
          ),
          (
            name: 'border-base-strong',
            color: FlowbiteColors.borderBaseStrong,
            colorDark: FlowbiteColors.borderBaseStrongDark,
          ),
          (
            name: 'border-success-subtle',
            color: FlowbiteColors.borderSuccessSubtle,
            colorDark: FlowbiteColors.borderSuccessSubtleDark,
          ),
          (
            name: 'border-success',
            color: FlowbiteColors.borderSuccess,
            colorDark: FlowbiteColors.borderSuccessDark,
          ),
          (
            name: 'border-danger-subtle',
            color: FlowbiteColors.borderDangerSubtle,
            colorDark: FlowbiteColors.borderDangerSubtleDark,
          ),
          (
            name: 'border-danger',
            color: FlowbiteColors.borderDanger,
            colorDark: FlowbiteColors.borderDangerDark,
          ),
          (
            name: 'border-warning-subtle',
            color: FlowbiteColors.borderWarningSubtle,
            colorDark: FlowbiteColors.borderWarningSubtleDark,
          ),
          (
            name: 'border-warning',
            color: FlowbiteColors.borderWarning,
            colorDark: FlowbiteColors.borderWarningDark,
          ),
          (
            name: 'border-brand-subtle',
            color: FlowbiteColors.borderBrandSubtle,
            colorDark: FlowbiteColors.borderBrandSubtleDark,
          ),
          (
            name: 'border-brand-light',
            color: FlowbiteColors.borderBrandLight,
            colorDark: FlowbiteColors.borderBrandLightDark,
          ),
          (
            name: 'border-brand',
            color: FlowbiteColors.borderBrand,
            colorDark: FlowbiteColors.borderBrandDark,
          ),
          (
            name: 'border-purple',
            color: FlowbiteColors.borderPurple,
            colorDark: FlowbiteColors.borderPurpleDark,
          ),
          (
            name: 'border-orange',
            color: FlowbiteColors.borderOrange,
            colorDark: FlowbiteColors.borderOrangeDark,
          ),
          (
            name: 'border-dark-subtle',
            color: FlowbiteColors.borderDarkSubtle,
            colorDark: FlowbiteColors.borderDarkSubtleDark,
          ),
        ].map(
          (colorVar) => Row(
            spacing: 8.0,
            children: [
              Expanded(
                child: _buildColorVariableCard(
                  name: colorVar.name,
                  color: colorVar.color,
                ),
              ),
              Expanded(
                child: _buildColorVariableCard(
                  name: colorVar.name,
                  color: colorVar.colorDark,
                  isDark: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColorVariableCard({
    required String name,
    required Color color,
    bool isDark = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: isDark ? FlowbiteColors.gray.shade800 : FlowbiteColors.white,
        border: Border.all(
          color: isDark ? Color(0xFF333E4F) : FlowbiteColors.gray.shade200,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 8.0,
            children: [
              FlutterLogo(size: 20.0),
              Text(
                name,
                style: FlowbiteFontFamily.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0,
                  color: isDark
                      ? FlowbiteColors.textBodyDark
                      : FlowbiteColors.textBody,
                ),
              ),
            ],
          ),
          Container(
            height: 20.0,
            width: 20.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: color,
              border: color == Colors.white && !isDark
                  ? Border.all(color: FlowbiteColors.gray.shade200)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
