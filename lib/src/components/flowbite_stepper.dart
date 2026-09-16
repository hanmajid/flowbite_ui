import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

/// [FlowbiteStepper]'s type variant.
enum FlowbiteStepperType {
  /// The default/normal type variant.
  normal,

  /// Only icons & links type variant.
  onlyIconLink,

  /// Icon & text type variant.
  iconText,

  /// Vertical type variant.
  vertical,

  /// Vertical with cards type variant.
  verticalCard,
}

/// Stepper component.
class FlowbiteStepper extends StatelessWidget {
  /// The stepper's type.
  ///
  /// Defaults to [FlowbiteStepperType.normal].
  final FlowbiteStepperType type;

  /// The stepper's breakpoint variant.
  ///
  /// Defaults to [FlowbiteBreakpoint.desktop].
  final FlowbiteBreakpoint breakpoint;

  /// The stepper's items.
  final List<FlowbiteStepperNavLinkItem> items;

  /// The currently active index.
  final int currentIndex;

  /// The stepper's tap callback.
  final ValueChanged<int>? onTap;

  /// The stepper's content.
  final Widget child;

  /// The stepper's previous button.
  final Widget previousButton;

  /// The stepper's next button.
  final Widget nextButton;

  /// Constructor.
  const FlowbiteStepper({
    required this.previousButton,
    required this.nextButton,
    required this.child,
    required this.items,
    required this.currentIndex,
    this.type = .normal,
    this.breakpoint = .desktop,
    this.onTap,
    super.key,
  });

  double get _verticalSpacing => switch (type) {
    .normal => switch (breakpoint) {
      .desktop || .tablet => 32.0,
      .mobile => 24.0,
    },
    .onlyIconLink => 32.0,
    .iconText => 32.0,
    .vertical => switch (breakpoint) {
      .desktop || .tablet => 48.0,
      .mobile => 32.0,
    },
    .verticalCard => switch (breakpoint) {
      .desktop || .tablet => 48.0,
      .mobile => 32.0,
    },
  };
  double get _horizontalSpacing => switch (type) {
    .normal => switch (breakpoint) {
      .desktop || .tablet => 16.0,
      .mobile => 8.0,
    },
    .onlyIconLink => 20.0,
    .iconText => 20.0,
    .vertical => 0.0,
    .verticalCard => 16.0,
  };

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    items.forEachIndexed((index, item) {
      FlowbiteStepperNavLinkState finalState = item.state;
      if (finalState != .disabled || finalState != .error) {
        finalState = currentIndex == index
            ? .active
            : (currentIndex > index ? .completed : .inactive);
      }
      final FlowbiteStepperNavLinkType navLinkType = switch (type) {
        .normal => .normal,
        .onlyIconLink => .iconShape,
        .iconText => .iconShapeText,
        .vertical => .iconShapeText,
        .verticalCard => .cardAlert,
      };
      children.add(
        FlowbiteStepperNavLink(
          type: navLinkType,
          item: FlowbiteStepperNavLinkItem(
            label: item.label,
            subtitle: item.subtitle,
            number: item.number,
            icon: item.icon,
            state: finalState,
          ),
          fontSize: .textSm,
          onTap: onTap != null
              ? () {
                  onTap!(index);
                }
              : null,
        ),
      );
      if (index < items.length - 1) {
        switch (type) {
          case .normal:
            if (breakpoint == .mobile) {
              children.add(
                Transform.rotate(
                  angle: 10.98 * (math.pi / 180),
                  child: Container(
                    height: 16.0,
                    width: 1.0,
                    color: FlowbiteTheme.of(context).borderBase,
                  ),
                ),
              );
            } else {
              children.add(
                Expanded(
                  child: Container(
                    height: 1,
                    color: FlowbiteTheme.of(context).borderBase,
                  ),
                ),
              );
            }
          case .onlyIconLink:
            children.add(
              Expanded(
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: .circular(2.0),
                    color: FlowbiteTheme.of(context).borderBase,
                  ),
                ),
              ),
            );
          case .iconText:
            if (breakpoint == .desktop) {
              children.add(
                Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: .circular(2.0),
                    color: FlowbiteTheme.of(context).borderBase,
                  ),
                ),
              );
            } else {
              children.add(
                Row(
                  children: [
                    Container(
                      width: 4.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        borderRadius: .circular(2.0),
                        color: FlowbiteTheme.of(context).borderBase,
                      ),
                    ),
                  ],
                ),
              );
            }
          case .vertical:
            children.add(
              Container(
                width: 36.0,
                alignment: .center,
                child: Container(
                  width: 1.0,
                  height: 56.0,
                  color: FlowbiteTheme.of(context).borderBase,
                ),
              ),
            );
          case .verticalCard:
          // Do nothing
        }
      }
    });
    late Widget navigation;
    if ((type == .iconText && breakpoint == .mobile) || type == .vertical) {
      navigation = Column(
        crossAxisAlignment: type == .vertical ? .start : .stretch,
        mainAxisSize: .min,
        spacing: _horizontalSpacing,
        children: children,
      );
    } else if (type == .verticalCard) {
      navigation = SizedBox(
        width: breakpoint == .desktop ? 288.0 : null,
        child: Column(
          crossAxisAlignment: .stretch,
          mainAxisSize: .min,
          spacing: _horizontalSpacing,
          children: children,
        ),
      );
    } else {
      navigation = Row(
        mainAxisSize: breakpoint == .mobile ? .min : .max,
        spacing: _horizontalSpacing,
        children: children,
      );
    }
    if ((type == .vertical || type == .verticalCard) &&
        breakpoint == .desktop) {
      return Row(
        crossAxisAlignment: .start,
        spacing: _verticalSpacing,
        children: [
          navigation,
          Expanded(
            child: Column(
              crossAxisAlignment: .stretch,
              spacing: 32.0,
              children: [
                child,
                Row(
                  mainAxisAlignment: .spaceBetween,
                  spacing: 12.0,
                  children: [previousButton, nextButton],
                ),
              ],
            ),
          ),
        ],
      );
    }
    List<Widget> buttons = [];
    if (type == .iconText) {
      buttons = [nextButton];
    } else if (type == .vertical ||
        (type == .vertical && breakpoint == .mobile)) {
      buttons = [previousButton, nextButton];
    } else if (breakpoint == .mobile) {
      buttons = [Expanded(child: previousButton), Expanded(child: nextButton)];
    } else {
      buttons = [previousButton, nextButton];
    }
    return Column(
      crossAxisAlignment: .stretch,
      spacing: _verticalSpacing,
      children: [
        navigation,
        child,
        Row(mainAxisAlignment: .spaceBetween, spacing: 12.0, children: buttons),
      ],
    );
  }
}

/// Preview class for [FlowbiteStepper].
///
/// Only used for documentation purpose.
class PreviewFlowbiteStepper extends StatelessWidget {
  /// Constructor.
  const PreviewFlowbiteStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 64.0,
      children: FlowbiteStepperType.values
          .map(
            (type) => Row(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              spacing: 16.0,
              children: [FlowbiteBreakpoint.desktop, FlowbiteBreakpoint.mobile]
                  .map(
                    (breakpoint) => Row(
                      children: [
                        SizedBox(
                          width: breakpoint == .desktop ? 800.0 : 400.0,
                          child: FlowbiteStepper(
                            type: type,
                            breakpoint: breakpoint,
                            currentIndex: 1,
                            items: [
                              FlowbiteStepperNavLinkItem(
                                number: 1,
                                label: 'Personal Info',
                                subtitle: 'Helper text here',
                              ),
                              FlowbiteStepperNavLinkItem(
                                number: 2,
                                label: 'Account Info',
                                subtitle: 'Helper text here',
                                icon: FlowbiteOutlineIcons.user_circle,
                              ),
                              FlowbiteStepperNavLinkItem(
                                number: 3,
                                label: 'Payment Info',
                                subtitle: 'Helper text here',
                                icon: FlowbiteOutlineIcons.credit_card,
                              ),
                              if (breakpoint != .mobile || type != .normal)
                                FlowbiteStepperNavLinkItem(
                                  number: 4,
                                  label: 'Review',
                                  subtitle: 'Helper text here',
                                  icon: FlowbiteOutlineIcons.clipboard_list,
                                ),
                            ],
                            onTap: (_) {},
                            previousButton:
                                type != .onlyIconLink && type != .verticalCard
                                ? FlowbiteButton(
                                    onPressed: () {},
                                    color: .secondary,
                                    child: const Text('Prev: Personal Info'),
                                  )
                                : Row(
                                    spacing: 6.0,
                                    children: [
                                      Icon(
                                        FlowbiteOutlineIcons.arrow_left,
                                        size: 18.0,
                                        color: FlowbiteTheme.of(context)
                                            .textBody,
                                      ),
                                      Text(
                                        'Prev: Personal Info',
                                        style: FlowbiteFontFamily.inter(
                                          fontWeight: .medium,
                                          fontSize: .textBase,
                                          color: FlowbiteTheme.of(context)
                                              .textBody,
                                        ),
                                      ),
                                    ],
                                  ),
                            nextButton:
                                type != .onlyIconLink && type != .verticalCard
                                ? FlowbiteButton(
                                    onPressed: () {},
                                    child: const Text('Next: Payment Info'),
                                  )
                                : Row(
                                    spacing: 6.0,
                                    children: [
                                      Text(
                                        'Next: Payment Info',
                                        style: FlowbiteFontFamily.inter(
                                          fontWeight: .medium,
                                          fontSize: .textBase,
                                          color: FlowbiteTheme.of(context)
                                              .textFgBrand,
                                        ),
                                      ),
                                      Icon(
                                        FlowbiteOutlineIcons.arrow_right,
                                        size: 18.0,
                                        color: FlowbiteTheme.of(context)
                                            .textFgBrand,
                                      ),
                                    ],
                                  ),
                            child: Container(
                              height: 177.0,
                              decoration: BoxDecoration(
                                color: FlowbiteTheme.of(context)
                                    .bgNeutralSecondarySoft,
                                border: .all(
                                  color: FlowbiteTheme.of(context).borderBase,
                                ),
                                borderRadius: .circular(12.0),
                              ),
                              alignment: .center,
                              child: Text(
                                'Your content here',
                                textAlign: .center,
                                style: FlowbiteFontFamily.inter(
                                  fontWeight: .medium,
                                  fontSize: .textLg,
                                  color: FlowbiteTheme.of(context).textBody,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}

@FlowbitePreview(name: 'Stepper - Light', group: 'Stepper', brightness: .light)
@FlowbitePreview(name: 'Stepper - Dark', group: 'Stepper', brightness: .dark)
/// Widget preview for [FlowbiteStepper].
Widget previewFlowbiteStepper() {
  return const PreviewFlowbiteStepper();
}
