import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

/// Stepper component.
class FlowbiteStepper extends StatelessWidget {
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
    this.breakpoint = .desktop,
    this.onTap,
    super.key,
  });

  double get _verticalSpacing => switch (breakpoint) {
    .desktop || .tablet => 32.0,
    .mobile => 24.0,
  };
  double get _horizontalSpacing => switch (breakpoint) {
    .desktop || .tablet => 16.0,
    .mobile => 8.0,
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
          item: FlowbiteStepperNavLinkItem(
            label: item.label,
            number: item.number,
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
    return Column(
      crossAxisAlignment: .start,
      spacing: 16.0,
      children: [FlowbiteBreakpoint.desktop, FlowbiteBreakpoint.mobile]
          .map(
            (breakpoint) => SizedBox(
              width: breakpoint == .desktop ? 672.0 : 400.0,
              child: FlowbiteStepper(
                breakpoint: breakpoint,
                currentIndex: 1,
                items: [
                  FlowbiteStepperNavLinkItem(number: 1, label: 'Personal Info'),
                  FlowbiteStepperNavLinkItem(number: 2, label: 'Account Info'),
                  FlowbiteStepperNavLinkItem(number: 3, label: 'Payment Info'),
                  if (breakpoint == .desktop)
                    FlowbiteStepperNavLinkItem(number: 4, label: 'Review'),
                ],
                onTap: (_) {},
                previousButton: FlowbiteButton(
                  onPressed: () {},
                  color: .secondary,
                  child: const Text('Prev: Personal Info'),
                ),
                nextButton: FlowbiteButton(
                  onPressed: () {},
                  child: const Text('Next: Payment Info'),
                ),
                child: Container(
                  height: 177.0,
                  decoration: BoxDecoration(
                    color: FlowbiteTheme.of(context).borderBase,
                    border: .all(
                      color: FlowbiteTheme.of(context).bgNeutralSecondarySoft,
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
    );
  }
}

@FlowbitePreview(name: 'Stepper - Light', group: 'Stepper', brightness: .light)
@FlowbitePreview(name: 'Stepper - Dark', group: 'Stepper', brightness: .dark)
/// Widget preview for [FlowbiteStepper].
Widget previewFlowbiteStepper() {
  return const PreviewFlowbiteStepper();
}
