# Flowbite UI

[![pub package](https://img.shields.io/pub/v/flowbite_ui.svg)](https://pub.dev/packages/flowbite_ui)

**Unofficial** Flutter package for **Flowbite UI Kit**. Flowbite UI Kit is made by [Themesberg](https://www.figma.com/@themesberg) and licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).

## Installation

Add `flowbite_ui` dependency to your Flutter project:

```yaml
dependencies:
  flowbite_ui: ^<latest-version>
  # Optional:
  flowbite_icons: ^<latest-version>
```

## Getting Started

Before using the components below, make sure that `theme` and `darkTheme` are set properly in your app:

```dart
MaterialApp(
  theme: FlowbiteTheme.light, // Set light theme
  darkTheme: FlowbiteTheme.dark, // Set dark theme
  themeMode: ThemeMode.system, // Optional: Make the app follow system's theme.
  home: Scaffold(
    body: Text('My App'),
  ),
)
```

## Reference

### Components

### Alert

Illustrations:

<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/alert-light.png" />
<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/alert-dark.png" />

Usage example:

```dart
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flowbite_icons/flowbite_icons.dart';

// Default/Normal
FlowbiteAlert(
  text: "Great job! You've acknowledged this significant alert message.",
  color: FlowbiteAlertColor.normal,
  onTapClose: () {},
)
// Complex
FlowbiteAlert.complex(
  heading: 'Alert heading',
  text: "Great job! You've acknowledged this significant alert message.",
  color: FlowbiteAlertColor.normal,
  onTapClose: () {},
  buttonLabel: 'Learn more',
  leadingIcon: Icon(FlowbiteOutlineIcons.open_book),
  onPressedButton: () {},
)
// Small
FlowbiteAlert.small(
  text: "Great job! You've acknowledged this significant alert message.",
  badgeText: 'New',
  color: FlowbiteAlertColor.normal,
  onTapClose: () {},
  onTap: () {},
)
// Border Top
FlowbiteAlert.borderTop(
  text: "Great job! You've acknowledged this significant alert message.",
  color: FlowbiteAlertColor.normal,
  onTapClose: () {},
)
```

### Avatar

Illustrations:

<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/avatar-light.png" />
<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/avatar-dark.png" />

Usage example:

```dart
import 'package:flowbite_ui/flowbite_ui.dart';

// With Image
FlowbiteAvatar(
  size: FlowbiteAvatarSize.base, // default
  image: const AssetImage(
    'assets/images/avatar-jese-leos.png',
    package: 'flowbite_ui',
  ),
)
// With Dot
FlowbiteAvatar(
  size: FlowbiteAvatarSize.base, // default
  image: const AssetImage(
    'assets/images/avatar-jese-leos.png',
    package: 'flowbite_ui',
  ),
  showDot: true,
  dotStatus: FlowbiteAvatarDotStatus.online,
)
// With Remove Button
FlowbiteAvatar(
  size: FlowbiteAvatarSize.base, // default
  image: const AssetImage(
    'assets/images/avatar-jese-leos.png',
    package: 'flowbite_ui',
  ),
  showRemoveButton: true,
  onTapRemoveButton: () {},
)
// With Placeholder
FlowbiteAvatar(
  size: FlowbiteAvatarSize.base, // default
  placeholder: 'PH',
)
```

### Avatar Group Label

Illustrations:

<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/avatar-group-label-light.png" />
<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/avatar-group-label-dark.png" />

Usage example:

```dart
import 'package:flowbite_ui/flowbite_ui.dart';

FlowbiteAvatarGroupLabel(
  avatarImage: const AssetImage(
    'assets/images/avatar-jese-leos.png',
    package: 'flowbite_ui',
  ),
  title: 'Jese Leos',
  subtitle: 'name@flowbite.com', // optional
  size: FlowbiteAvatarGroupLabelSize.base, // default
)
```

### Button

Illustrations:

<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/button-light.png" />
<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/button-dark.png" />

Usage example:

```dart
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flowbite_icons/flowbite_icons.dart';

// With Icon
FlowbiteButton.icon(
  onPressed: () {},
  label: Text('Button text'),
  leadingIcon: Icon(FlowbiteOutlineIcons.arrow_left),
  trailingIcon: Icon(FlowbiteOutlineIcons.arrow_right),
  color: FlowbiteButtonColor.brand, // default
  size: FlowbiteButtonSize.base, // default
)
// Icon Only
FlowbiteButton.iconOnly(
  onPressed: () {},
  icon: Icon(FlowbiteOutlineIcons.heart),
  color: FlowbiteButtonColor.brand, // default
  size: FlowbiteButtonSize.base, // default
)
// Outlined With Icon
FlowbiteOutlinedButton.icon(
  onPressed: () {},
  label: Text('Button text'),
  leadingIcon: Icon(FlowbiteOutlineIcons.arrow_left),
  trailingIcon: Icon(FlowbiteOutlineIcons.arrow_right),
  color: FlowbiteOutlinedButtonColor.success, // default
  size: FlowbiteButtonSize.base, // default
)
// Outlined Icon Only
FlowbiteOutlinedButton.iconOnly(
  onPressed: () {},
  icon: Icon(FlowbiteOutlineIcons.heart),
  color: FlowbiteOutlinedButtonColor.success, // default
  size: FlowbiteButtonSize.base, // default
)
```

### Icon Shape

Illustrations:

<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/icon-shape-light.png" width="300" />
<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/icon-shape-dark.png" width="300" />

Usage example:

```dart
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flowbite_icons/flowbite_icons.dart';

FlowbiteIconShape(
  icon: FlowbiteOutlineIcons.fire,
  type: FlowbiteIconShapeType.circle, // default
  color: FlowbiteIconShapeColor.brand, // default
  size: FlowbiteIconShapeSize.base, // default
)
```

### Spinner

Illustrations:

<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/spinner-light.png" width="300" />
<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/spinner-dark.png" width="300" />

Usage example:

```dart
import 'package:flowbite_ui/flowbite_ui.dart';

FlowbiteSpinner(
  size: FlowbiteSpinnerSize.base, // default
  showTrack: true, // default
  value: null, // default
)
```

## Issues

For issues, file directly in the [repository](https://github.com/hanmajid/flowbite_ui/issues).

## Find this library useful? ❤️

Support it by joining **[stargazers](https://github.com/hanmajid/flowbite_ui/stargazers)** for this repository. ⭐️ <br>
Also, **[follow me](https://github.com/hanmajid)** on GitHub for my next project! 🤩

## License

```xml
Copyright 2026 hanmajid (Muhammad Farhan Majid)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
