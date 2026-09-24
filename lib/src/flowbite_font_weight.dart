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
// Flowbite library (Copyright (c) Bergside Inc.), which is licensed
// under the MIT License.

import 'package:flutter/widgets.dart';

/// Flowbite UI's font weight variant.
enum FlowbiteFontWeight {
  /// Normal weight variant.
  normal(value: FontWeight(400)),

  /// Medium weight variant.
  medium(value: FontWeight(500)),

  /// Semibold weight variant.
  semibold(value: FontWeight(600)),

  /// Bold weight variant.
  bold(value: FontWeight(700)),

  /// Extrabold weight variant.
  extrabold(value: FontWeight(800));

  /// The weight's value.
  final FontWeight value;

  const new({required this.value});
}
