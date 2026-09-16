import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

/// Stepper component.
class FlowbiteStepper extends StatelessWidget {
  /// The stepper's nav link type.
  ///
  /// Defaults to [FlowbiteStepperNavLinkType.normal].
  final FlowbiteStepperNavLinkType type;

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

  double get _verticalSpacing => switch (breakpoint) {
    .desktop || .tablet => 32.0,
    .mobile => 24.0,
  };
  double get _horizontalSpacing => switch (type) {
    .normal => switch (breakpoint) {
      .desktop || .tablet => 16.0,
      .mobile => 8.0,
    },
    .iconShape => 20.0,
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
      children.add(
        FlowbiteStepperNavLink(
          type: type,
          item: FlowbiteStepperNavLinkItem(
            label: item.label,
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
          case .iconShape:
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
        }
      }
    });
    return Column(
      crossAxisAlignment: .stretch,
      spacing: _verticalSpacing,
      children: [
        Row(
          mainAxisSize: breakpoint == .mobile ? .min : .max,
          spacing: _horizontalSpacing,
          children: children,
        ),
        child,
        Row(
          mainAxisAlignment: .spaceBetween,
          spacing: 12.0,
          children: breakpoint == .mobile
              ? [Expanded(child: previousButton), Expanded(child: nextButton)]
              : [previousButton, nextButton],
        ),
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
    return Row(
      mainAxisSize: .min,
      spacing: 16.0,
      children: FlowbiteStepperNavLinkType.values
          .map(
            (type) => Column(
              crossAxisAlignment: .start,
              spacing: 16.0,
              children: [FlowbiteBreakpoint.desktop, FlowbiteBreakpoint.mobile]
                  .map(
                    (breakpoint) => SizedBox(
                      width: breakpoint == .desktop ? 672.0 : 400.0,
                      child: FlowbiteStepper(
                        type: type,
                        breakpoint: breakpoint,
                        currentIndex: 1,
                        items: [
                          FlowbiteStepperNavLinkItem(
                            number: 1,
                            label: 'Personal Info',
                          ),
                          FlowbiteStepperNavLinkItem(
                            number: 2,
                            label: 'Account Info',
                            icon: FlowbiteOutlineIcons.user_circle,
                          ),
                          FlowbiteStepperNavLinkItem(
                            number: 3,
                            label: 'Payment Info',
                            icon: FlowbiteOutlineIcons.credit_card,
                          ),
                          if (breakpoint != .mobile || type != .normal)
                            FlowbiteStepperNavLinkItem(
                              number: 4,
                              label: 'Review',
                              icon: FlowbiteOutlineIcons.clipboard_list,
                            ),
                        ],
                        onTap: (_) {},
                        previousButton: type == .normal
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
                                    color: FlowbiteTheme.of(context).textBody,
                                  ),
                                  Text(
                                    'Prev: Personal Info',
                                    style: FlowbiteFontFamily.inter(
                                      fontWeight: .medium,
                                      fontSize: .textBase,
                                      color: FlowbiteTheme.of(context).textBody,
                                    ),
                                  ),
                                ],
                              ),
                        nextButton: type == .normal
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
