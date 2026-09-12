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
import 'package:flowbite_ui/flowbite_ui.dart';

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

### Accordion

Illustrations:

<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/accordion-light.png" width="300" />
<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/accordion-dark.png" width="300" />

Usage example:

```dart
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flowbite_icons/flowbite_icons.dart';

FlowbiteAccordion(
  breakpoint: .desktop, // default
  style: .normal, // default
  items: [
    FlowbiteAccordionItem(
      icon: FlowbiteOutlineIcons.question_mark,
      header: 'Can I use Flowbite in open-source projects?',
      initiallyExpanded: true,
      child: Text('Content'),
      subitems: [
        FlowbiteAccordionItem(
          header: 'How to install Flowbite for my Next.js project?',
          child: Text('Content'),
        ),
        FlowbiteAccordionItem(
          header: 'How to install Flowbite for my React project?',
          initiallyExpanded: true,
          child: Text('Content'),
        ),
      ],
    ),
    FlowbiteAccordionItem(
      icon: FlowbiteOutlineIcons.question_mark,
      header: 'Can I contribute to the Flowbite project?',
      child: Text('Content'),
    ),
    FlowbiteAccordionItem(
      icon: FlowbiteOutlineIcons.question_mark,
      header: 'What are the main features of Flowbite?',
      child: Text('Content'),
    ),
  ],
)
```

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
  image: FlowbiteAvatarDefaultAssets.jeseLeos.toAssetImage(),
)
// With Dot
FlowbiteAvatar(
  size: FlowbiteAvatarSize.base, // default
  image: FlowbiteAvatarDefaultAssets.jeseLeos.toAssetImage(),
  showDot: true,
  dotStatus: FlowbiteAvatarDotStatus.online,
)
// With Remove Button
FlowbiteAvatar(
  size: FlowbiteAvatarSize.base, // default
  image: FlowbiteAvatarDefaultAssets.jeseLeos.toAssetImage(),
  showRemoveButton: true,
  onTapRemoveButton: () {},
)
// With Placeholder
FlowbiteAvatar(
  size: FlowbiteAvatarSize.base, // default
  placeholder: 'PH',
)
```

### Avatar Group

Illustrations:

<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/avatar-group-light.png" />
<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/avatar-group-dark.png" />

Usage example:

```dart
import 'package:flowbite_ui/flowbite_ui.dart';

FlowbiteAvatarGroup(
  avatars: [
    FlowbiteAvatarDefaultAssets.josephMcFall.toAssetImage(),
    FlowbiteAvatarDefaultAssets.neilSims.toAssetImage(),
    FlowbiteAvatarDefaultAssets.karenNelson.toAssetImage(),
    FlowbiteAvatarDefaultAssets.robertBrown.toAssetImage(),
    FlowbiteAvatarDefaultAssets.leslieLivingston.toAssetImage(),
  ].map((image) => FlowbiteAvatar(image: image)).toList(),
  size: FlowbiteAvatarGroupSize .base,
  counter: '+10', // optional
)
```

### Avatar Group Label

Illustrations:

<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/avatar-group-label-light.png" width="300" />
<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/avatar-group-label-dark.png" width="300" />

Usage example:

```dart
import 'package:flowbite_ui/flowbite_ui.dart';

FlowbiteAvatarGroupLabel(
  avatarImage: FlowbiteAvatarDefaultAssets.jeseLeos.toAssetImage(),
  title: 'Jese Leos',
  subtitle: 'name@flowbite.com', // optional
  size: FlowbiteAvatarGroupLabelSize.base, // default
)
```

### Badge

Illustrations:

<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/badge-light.png" />
<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/badge-dark.png" />

Usage example:

```dart
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flowbite_icons/flowbite_icons.dart';

// With Icon
FlowbiteBadge.icon(
  text: 'Badge text',
  icon: FlowbiteOutlineIcons.clock,
  theme: FlowbiteBadgeTheme.brand, // default
  size: FlowbiteBadgeSize.sm, // default
  onTap: () {},
)
// With Avatar
FlowbiteBadge.avatar(
  text: 'Badge text',
  avatar: FlowbiteAvatar(
    image: FlowbiteAvatarDefaultAssets.bonnieGreen.toAssetImage(),
  ),
  theme: FlowbiteBadgeTheme.brand, // default
  size: FlowbiteBadgeSize.sm, // default
  onTap: () {},
)
// With Dot
FlowbiteBadge.dot(
  text: 'Badge text',
  theme: FlowbiteBadgeTheme.brand, // default
  size: FlowbiteBadgeSize.sm, // default
  onTap: () {},
)
// With Spinner
FlowbiteBadge.spinner(
  text: 'Badge text',
  spinner: const FlowbiteSpinner(value: 0.3),
  theme: FlowbiteBadgeTheme.brand, // default
  size: FlowbiteBadgeSize.sm, // default
  onTap: () {},
)
// With Secondary Text
FlowbiteBadge.icon(
  text: 'Badge text',
  secondaryText: 'Secondary text',
  icon: FlowbiteOutlineIcons.clock,
  theme: FlowbiteBadgeTheme.brand, // default
  size: FlowbiteBadgeSize.sm, // default
  onTap: () {},
)
// Icon Only
FlowbiteBadge.iconOnly(
  icon: FlowbiteOutlineIcons.clock,
  theme: FlowbiteBadgeTheme.brand, // default
  size: FlowbiteBadgeSize.sm, // default
  onTap: () {},
)
// Text Only
FlowbiteBadge.textOnly(
  text: '1',
  theme: FlowbiteBadgeTheme.brand, // default
  size: FlowbiteBadgeSize.sm, // default
  onTap: () {},
)
```

### Button

Illustrations:

<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/button-light.png" width="300" />
<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/button-dark.png" width="300" />

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

### Button Group

Illustrations:

<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/button-group-light.png" width="300" />
<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/button-group-dark.png" width="300" />

Usage example:

```dart
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flowbite_icons/flowbite_icons.dart';

FlowbiteButtonGroup(
  color: .gray, // default
  size: .base, // default
  items: [
    FlowbiteButtonGroupItem(
      text: 'Messages',
      icon: FlowbiteOutlineIcons.envelope,
      badge: FlowbiteBadge.textOnly(text: '1', theme: .danger, size: .xs),
      onTap: () {},
    ),
    FlowbiteButtonGroupItem(
      icon: FlowbiteOutlineIcons.angle_down,
      onTap: () {},
    ),
  ],
)
```

### Bottom Navigation

Illustrations:

<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/bottom-navigation-light.png" width="300" />
<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/bottom-navigation-dark.png" width="300" />

Usage example:

```dart
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flowbite_icons/flowbite_icons.dart';

// Normal, Bordered
FlowbiteBottomNavigation(
  style: FlowbiteBottomNavigationStyle.normal, // default
  items: [
    FlowbiteBottomNavigationItem(
      icon: FlowbiteOutlineIcons.wallet,
      label: 'Wallet',
    ),
    FlowbiteBottomNavigationItem(
      icon: FlowbiteOutlineIcons.wallet,
      label: 'Wallet',
    ),
    FlowbiteBottomNavigationItem(
      icon: FlowbiteOutlineIcons.wallet,
      label: 'Wallet',
    ),
    FlowbiteBottomNavigationItem(
      icon: FlowbiteOutlineIcons.wallet,
      label: 'Wallet',
    ),
  ],
  currentIndex: 0,
  onTap: (value) {},
)
// Pagination
FlowbiteBottomNavigation(
  style: FlowbiteBottomNavigationStyle.pagination,
  items: [
    FlowbiteBottomNavigationItem(
      icon: FlowbiteOutlineIcons.wallet,
      label: 'Wallet',
    ),
    FlowbiteBottomNavigationItem(
      icon: FlowbiteOutlineIcons.wallet,
      label: 'Wallet',
    ),
    FlowbiteBottomNavigationItem(
      label: '1 of 246',
      isPaginationButton: true,
    ),
    FlowbiteBottomNavigationItem(
      icon: FlowbiteOutlineIcons.wallet,
      label: 'Wallet',
    ),
    FlowbiteBottomNavigationItem(
      icon: FlowbiteOutlineIcons.wallet,
      label: 'Wallet',
    ),
  ],
  currentIndex: 0,
  onTap: (value) {},
)
// Action Button
FlowbiteBottomNavigation(
  style: FlowbiteBottomNavigationStyle.actionButton,
  items: [
    FlowbiteBottomNavigationItem(
      icon: FlowbiteOutlineIcons.wallet,
      label: 'Wallet',
    ),
    FlowbiteBottomNavigationItem(
      icon: FlowbiteOutlineIcons.wallet,
      label: 'Wallet',
    ),
    FlowbiteBottomNavigationItem(
      icon: FlowbiteOutlineIcons.plus,
      isActive: true,
    ),
    FlowbiteBottomNavigationItem(
      icon: FlowbiteOutlineIcons.wallet,
      label: 'Wallet',
    ),
    FlowbiteBottomNavigationItem(
      icon: FlowbiteOutlineIcons.wallet,
      label: 'Wallet',
    ),
  ],
  currentIndex: 0,
  onTap: (value) {},
)
// Segment Controls
FlowbiteBottomNavigation(
  style: FlowbiteBottomNavigationStyle.segmentControls,
  items: [
    FlowbiteBottomNavigationItem(
      icon: FlowbiteOutlineIcons.wallet,
      label: 'Wallet',
    ),
    FlowbiteBottomNavigationItem(
      icon: FlowbiteOutlineIcons.wallet,
      label: 'Wallet',
    ),
    FlowbiteBottomNavigationItem(
      icon: FlowbiteOutlineIcons.plus,
      isActive: true,
    ),
    FlowbiteBottomNavigationItem(
      icon: FlowbiteOutlineIcons.wallet,
      label: 'Wallet',
    ),
    FlowbiteBottomNavigationItem(
      icon: FlowbiteOutlineIcons.wallet,
      label: 'Wallet',
    ),
  ],
  toggleInput: FlowbiteToggleInput(
    items: [
      FlowbiteToggleInputItem(label: 'Toggle'),
      FlowbiteToggleInputItem(label: 'Toggle'),
      FlowbiteToggleInputItem(label: 'Toggle'),
      FlowbiteToggleInputItem(label: 'Toggle'),
    ],
    currentIndex: 0,
    onTap: (_) {},
  ),
  currentIndex: 0,
  onTap: (value) {},
)
```


### Breadcrumb

Illustrations:

<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/breadcrumb-light.png" width="300" />
<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/breadcrumb-dark.png" width="300" />

Usage example:

```dart
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flowbite_icons/flowbite_icons.dart';

FlowbiteBreadcrumb(
  items: [
    FlowbiteBreadcrumbItemWidget(
      item: FlowbiteBreadcrumbItem(label: 'flowbite.com'),
      onTap: () {},
    ),
    FlowbiteBreadcrumbItemWidget(
      item: FlowbiteBreadcrumbItem(label: 'develop'),
      onTap: () {},
    ),
    FlowbiteBreadcrumbItemWidget(
      item: FlowbiteBreadcrumbItem(
        label: 'Issue #312',
        showSeparatorIcon: false,
      ),
      onTap: () {},
    ),
    FlowbiteBadge.textOnly(
      text: 'docs',
      size: .sm,
      theme: .brand,
      isCircle: false,
    ),
    FlowbiteButton.icon(
      onPressed: () {},
      label: const Text('Fix #6597'),
      leadingIcon: const Icon(FlowbiteOutlineIcons.code_branch),
      trailingIcon: const Icon(FlowbiteOutlineIcons.angle_down),
      color: .secondary,
      size: .xs,
    ),
  ],
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

### Jumbotron

Illustrations:

<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/jumbotron-light.png" width="300" />
<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/jumbotron-dark.png" width="300" />

Usage example:

```dart
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flowbite_icons/flowbite_icons.dart';

FlowbiteJumbotron(
  breakpoint: FlowbiteJumbotronBreakpoint.desktop, // default
  title: "We invest in the world's potential",
  subtitle: '''Here at flowbite we focus on markets where technology, innovation, and capital can unlock long-term value and drive economic growth.''',
  actions: Row(
    mainAxisSize: .min,
    spacing: 6.0,
    mainAxisAlignment: .center,
    children: [
      FlowbiteButton.icon(
        onPressed: () {},
        label: const Text('Get started'),
        trailingIcon: const Icon(FlowbiteOutlineIcons.arrow_right),
        size: .lg,
      ),
      FlowbiteButton.icon(
        onPressed: () {},
        label: const Text('Learn more'),
        color: .secondary,
        size: .lg,
      ),
    ],
  ),
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

### Toast

Illustrations:

<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/toast-light.png" width="300" />
<img src="https://github.com/hanmajid/flowbite_ui/raw/dev/images/toast-dark.png" width="300" />

Usage example:

```dart
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flowbite_icons/flowbite_icons.dart';

// Avatar & button
ScaffoldMessenger.of(context).showSnackBar(
  FlowbiteToast.avatarButton(
    context: context,
    avatar: FlowbiteAvatar(
      image: FlowbiteAvatarDefaultAssets.bonnieGreen.toAssetImage(),
    ),
    title: 'Bonnie Green',
    message: '''"Hi Bonnie, I appreciate you sharing your insights on Flowbite."''',
    button: FlowbiteButton.icon(
      onPressed: () {},
      label: const Text('Reply'),
      leadingIcon: const Icon(FlowbiteOutlineIcons.reply_all),
      size: .xs,
    ),
  )
);

// Icon shape & text
FlowbiteToast.iconShapeText(
  context: context,
  iconShape: const FlowbiteIconShape(
    icon: FlowbiteOutlineIcons.check,
    color: .green,
    type: .square,
  ),
  message: 'Notification message here!',
)

// Icon & text
FlowbiteToast.iconText(
  context: context,
  icon: FlowbiteOutlineIcons.papper_plane,
  message: 'Message sent successfully.',
)

// With header
FlowbiteToast.header(
  context: context,
  header: 'New notification',
  avatar: FlowbiteAvatar(
    image: FlowbiteAvatarDefaultAssets.bonnieGreen.toAssetImage(),
  ),
  title: 'Bonnie Green',
  message: 'commented on your photo',
  caption: 'a few seconds ago',
  buttons: [
    FlowbiteButton(
      onPressed: () {},
      size: .xs,
      color: .secondary,
      child: const Text('Close'),
    ),
    FlowbiteButton.icon(
      onPressed: () {},
      size: .xs,
      label: const Text('Reply'),
      leadingIcon: const Icon(FlowbiteOutlineIcons.reply_all),
    ),
  ],
)

// Icon shape & buttons
FlowbiteToast.iconShapeButtons(
  context: context,
  iconShape: const FlowbiteIconShape(
    icon: FlowbiteOutlineIcons.arrow_right,
    color: .brand,
    type: .square,
  ),
  title: 'Update available',
  message: 'The latest software version is now accessible for download.',
  buttons: [
    FlowbiteButton(
      onPressed: () {},
      size: .xs,
      color: .secondary,
      child: const Text('Not now'),
    ),
    FlowbiteButton.icon(
      onPressed: () {},
      size: .xs,
      label: const Text('Update'),
      leadingIcon: const Icon(FlowbiteOutlineIcons.download),
    ),
  ],
)

// With illustration
FlowbiteToast.illustration(
  context: context,
  illustration: FlowbiteIllustration(
    data: FlowbiteIllustrationData.smartphoneApplicationFeatures,
    mode: Theme.of(context).brightness == .dark ? .dark : .light,
  ),
  title: 'Connect your wallet',
  message:
      'Connect your wallet by clicking the bottom-right blue button.',
  buttons: [
    FlowbiteButton(
      onPressed: () {},
      size: .xs,
      color: .secondary,
      child: const Text('Close'),
    ),
    FlowbiteButton.icon(
      onPressed: () {},
      size: .xs,
      label: const Text('Connect'),
      trailingIcon: const Icon(FlowbiteOutlineIcons.fingerprint),
    ),
  ],
)

// With progress bar
FlowbiteToast.progressBar(
  context: context,
  iconShape: const FlowbiteIconShape(
    icon: FlowbiteOutlineIcons.cloud_arrow_up,
    type: .square,
  ),
  title: 'Uploading in progress',
  message: '''Please wait while your file is being uploaded. This may take a moment.''',
  buttons: [
    FlowbiteButton(
      onPressed: () {},
      size: .xs,
      color: .secondary,
      child: const Text('Cancel'),
    ),
    FlowbiteButton(
      onPressed: () {},
      size: .xs,
      child: const Text('Go to uploads'),
    ),
  ],
)

// Warning
FlowbiteToast.warning(
  context: context,
  icon: FlowbiteOutlineIcons.exclamation,
  title: 'Upload your invoice',
  message: '''Upload your invoice in one of the supported formats (PDF, JPG, PNG) with a maximum file size of 5MB. Ensure that all relevant details are visible for verification.''',
  buttons: [
    FlowbiteOutlinedButton(
      onPressed: () {},
      size: .xs,
      color: .warning,
      child: const Text('Remind me later'),
    ),
    FlowbiteButton.icon(
      onPressed: () {},
      size: .xs,
      color: .warning,
      leadingIcon: const Icon(FlowbiteOutlineIcons.upload),
      label: const Text('Upload invoice'),
    ),
  ],
)

// Error
FlowbiteToast.error(
  context: context,
  icon: FlowbiteOutlineIcons.info,
  title: 'Whoops! Something went wrong',
  message: '''The file format is not supported. Please upload a valid file type (PDF, JPG, PNG).''',
  buttons: [
    FlowbiteOutlinedButton(
      onPressed: () {},
      size: .xs,
      color: .danger,
      child: const Text('Close'),
    ),
    FlowbiteButton.icon(
      onPressed: () {},
      size: .xs,
      color: .danger,
      leadingIcon: const Icon(FlowbiteOutlineIcons.upload),
      label: const Text('Try again'),
    ),
  ],
),
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

This repository contains code adapted and ported from the open-source
Flowbite library (Copyright (c) Bergside Inc.), which is licensed
under the MIT License.
```
