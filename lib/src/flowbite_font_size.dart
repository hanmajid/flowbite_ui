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

/// Flowbite UI's font size variant.
enum FlowbiteFontSize {
  /// XXS size variant.
  textXxs(value: 8),

  /// XS size variant.
  textXs(value: 12),

  /// SM size variant.
  textSm(value: 14),

  /// Base/default size variant.
  textBase(value: 16),

  /// LG size variant.
  textLg(value: 18),

  /// XL size variant.
  textXl(value: 20),

  /// 2XL size variant.
  text2xl(value: 24),

  /// 3XL size variant.
  text3xl(value: 30),

  /// 4XL size variant.
  text4xl(value: 36),

  /// 5XL size variant.
  text5xl(value: 48),

  /// 6XL size variant.
  text6xl(value: 60);

  /// The font size's value.
  final double value;

  const new({required this.value});
}
