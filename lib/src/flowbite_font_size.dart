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

enum FlowbiteFontSize {
  textXxs(value: 8),
  textXs(value: 12),
  textSm(value: 14),
  textBase(value: 16),
  textLg(value: 18),
  textXl(value: 20),
  text2xl(value: 24),
  text3xl(value: 30),
  text4xl(value: 36),
  text5xl(value: 48),
  text6xl(value: 60);

  final double value;

  const new({required this.value});
}
