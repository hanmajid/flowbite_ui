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

import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

final class FlowbitePreview extends Preview {
  const FlowbitePreview({
    super.name,
    super.group,
    super.size,
    super.textScaleFactor,
    super.wrapper,
    super.brightness,
    super.localizations,
  }) : super(
         theme: brightness == Brightness.light
             ? FlowbitePreviewThemeData.new
             : FlowbitePreviewThemeData.newDark,
       );
}

final class FlowbitePreviewThemeData extends PreviewThemeData {
  final bool isDark;

  new() : isDark = false;

  FlowbitePreviewThemeData.newDark() : isDark = true;

  @override
  Widget apply(BuildContext context, Widget child) => Theme(
    data: isDark ? FlowbiteTheme.dark : FlowbiteTheme.light,
    child: Container(
      padding: const EdgeInsets.all(6.0),
      color: isDark
          ? FlowbiteColors.bgNeutralPrimaryDark
          : FlowbiteColors.bgNeutralPrimary,
      child: child,
    ),
  );
}
