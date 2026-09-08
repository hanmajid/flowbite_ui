import 'package:flutter/widgets.dart';

enum FlowbiteFontWeight {
  normal(value: FontWeight(400)),
  medium(value: FontWeight(500)),
  semibold(value: FontWeight(600)),
  bold(value: FontWeight(700)),
  extrabold(value: FontWeight(800));

  final FontWeight value;

  const new({required this.value});
}
