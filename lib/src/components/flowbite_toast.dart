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

import 'package:flowbite_icons/flowbite_icons.dart';
import 'package:flowbite_illustrations/flowbite_illustrations.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

/// Toast component.
class FlowbiteToast extends SnackBar {
  /// Constructor.
  const FlowbiteToast({required super.content, super.margin, super.key})
    : super(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        behavior: .floating,
      );

  /// Factory constructor for avatar button variant.
  factory FlowbiteToast.avatarButton({
    required BuildContext context,
    required FlowbiteAvatar avatar,
    required FlowbiteButton button,
    required String title,
    required String message,
    double width = 380.0,
  }) {
    return FlowbiteToast(
      margin: .only(
        bottom: 0.0,
        left: 0.0,
        right: MediaQuery.of(context).size.width - width,
      ),
      content: _buildContainer(
        context,
        child: Row(
          crossAxisAlignment: .start,
          spacing: 12.0,
          mainAxisSize: .min,
          children: [
            FlowbiteAvatar(
              image: avatar.image,
              placeholder: avatar.placeholder,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                spacing: 12.0,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    spacing: 2.0,
                    children: [
                      Text(
                        title,
                        style: FlowbiteFontFamily.inter(
                          fontWeight: .semibold,
                          fontSize: .textBase,
                          color: FlowbiteTheme.extension(context).textHeading,
                        ),
                      ),
                      Text(
                        message,
                        style: FlowbiteFontFamily.inter(
                          fontWeight: .normal,
                          fontSize: .textSm,
                          color: FlowbiteTheme.extension(context).textBody,
                        ),
                      ),
                    ],
                  ),
                  button,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Factory constructor for icon shape + text variant.
  factory FlowbiteToast.iconShapeText({
    required BuildContext context,
    required FlowbiteIconShape iconShape,
    required String message,
    double width = 320.0,
  }) {
    return FlowbiteToast(
      margin: .only(
        bottom: 0.0,
        left: 0.0,
        right: MediaQuery.of(context).size.width - width,
      ),
      content: _buildContainer(
        context,
        showCloseButton: false,
        child: Row(
          spacing: 10.0,
          children: [
            FlowbiteIconShape(
              icon: iconShape.icon,
              size: .base,
              color: iconShape.color,
              type: iconShape.type,
            ),
            Expanded(
              child: Text(
                message,
                style: FlowbiteFontFamily.inter(
                  fontWeight: .normal,
                  fontSize: .textSm,
                  color: FlowbiteTheme.extension(context).textBody,
                ),
              ),
            ),
            _buildCloseButton(context),
          ],
        ),
      ),
    );
  }

  /// Factory constructor for with header variant.
  factory FlowbiteToast.header({
    required BuildContext context,
    required FlowbiteAvatar avatar,
    required String header,
    required String title,
    required String message,
    required String caption,
    required List<Widget> buttons,
    double width = 320.0,
  }) {
    return FlowbiteToast(
      margin: .only(
        bottom: 0.0,
        left: 0.0,
        right: MediaQuery.of(context).size.width - width,
      ),
      content: _buildContainer(
        context,
        showCloseButton: false,
        padding: 12.0,
        child: Column(
          crossAxisAlignment: .stretch,
          spacing: 16.0,
          children: [
            Container(
              padding: const .symmetric(horizontal: 10.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: FlowbiteTheme.extension(context)
                    .bgNeutralSecondaryStrong,
                borderRadius: .circular(6.0),
              ),
              child: Text(
                header,
                style: FlowbiteFontFamily.inter(
                  fontWeight: .medium,
                  fontSize: .textSm,
                  color: FlowbiteTheme.extension(context).textHeading,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: .start,
              spacing: 12.0,
              children: [
                FlowbiteAvatar(
                  image: avatar.image,
                  placeholder: avatar.placeholder,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    spacing: 12.0,
                    children: [
                      Column(
                        crossAxisAlignment: .start,
                        spacing: 4.0,
                        children: [
                          Column(
                            crossAxisAlignment: .start,
                            spacing: 1.0,
                            children: [
                              Text(
                                title,
                                style: FlowbiteFontFamily.inter(
                                  fontWeight: .semibold,
                                  fontSize: .textBase,
                                  color: FlowbiteTheme.extension(context)
                                      .textHeading,
                                ),
                              ),
                              Text(
                                message,
                                style: FlowbiteFontFamily.inter(
                                  fontWeight: .normal,
                                  fontSize: .textSm,
                                  color: FlowbiteTheme.extension(context)
                                      .textBody,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            caption,
                            style: FlowbiteFontFamily.inter(
                              fontWeight: .normal,
                              fontSize: .textXs,
                              color: FlowbiteTheme.extension(context)
                                  .textFgBrand,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              spacing: 12.0,
              children: buttons
                  .map((button) => Expanded(child: button))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  /// Factory constructor for icon + text variant.
  factory FlowbiteToast.iconText({
    required BuildContext context,
    required IconData icon,
    required String message,
    double width = 320.0,
  }) {
    return FlowbiteToast(
      margin: .only(
        bottom: 0.0,
        left: 0.0,
        right: MediaQuery.of(context).size.width - width,
      ),
      content: _buildContainer(
        context,
        showCloseButton: false,
        child: Row(
          spacing: 10.0,
          children: [
            Icon(
              icon,
              size: 20.0,
              color: FlowbiteTheme.extension(context).bgBrand,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: FlowbiteTheme.extension(context).borderBase,
                    ),
                  ),
                ),
                padding: const .only(left: 16.0),
                child: Text(
                  message,
                  style: FlowbiteFontFamily.inter(
                    fontWeight: .normal,
                    fontSize: .textSm,
                    color: FlowbiteTheme.extension(context).textBody,
                  ),
                ),
              ),
            ),
            _buildCloseButton(context),
          ],
        ),
      ),
    );
  }

  /// Factory constructor for icon shape + buttons variant.
  factory FlowbiteToast.iconShapeButtons({
    required BuildContext context,
    required FlowbiteIconShape iconShape,
    required String title,
    required String message,
    required List<Widget> buttons,
    double width = 320.0,
  }) {
    return FlowbiteToast(
      margin: .only(
        bottom: 0.0,
        left: 0.0,
        right: MediaQuery.of(context).size.width - width,
      ),
      content: _buildContainer(
        context,
        child: Row(
          crossAxisAlignment: .start,
          spacing: 12.0,
          children: [
            FlowbiteIconShape(
              icon: iconShape.icon,
              size: .base,
              color: iconShape.color,
              type: iconShape.type,
            ),
            Expanded(
              child: Column(
                spacing: 14.0,
                crossAxisAlignment: .stretch,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    spacing: 8.0,
                    children: [
                      Text(
                        title,
                        style: FlowbiteFontFamily.inter(
                          fontWeight: .semibold,
                          fontSize: .textBase,
                          color: FlowbiteTheme.extension(context).textHeading,
                        ),
                      ),
                      Text(
                        message,
                        style: FlowbiteFontFamily.inter(
                          fontWeight: .normal,
                          fontSize: .textSm,
                          color: FlowbiteTheme.extension(context).textBody,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 12.0,
                    children: buttons
                        .map((button) => Expanded(child: button))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Factory constructor for with illustration variant.
  factory FlowbiteToast.illustration({
    required BuildContext context,
    required Widget illustration,
    required String title,
    required String message,
    required List<Widget> buttons,
    double width = 384.0,
  }) {
    return FlowbiteToast(
      margin: .only(
        bottom: 0.0,
        left: 0.0,
        right: MediaQuery.of(context).size.width - width,
      ),
      content: _buildContainer(
        context,
        showCloseButton: false,
        child: Row(
          spacing: 16.0,
          children: [
            SizedBox(width: 96.0, child: illustration),
            Expanded(
              child: Column(
                spacing: 14.0,
                crossAxisAlignment: .stretch,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    spacing: 8.0,
                    children: [
                      Text(
                        title,
                        style: FlowbiteFontFamily.inter(
                          fontWeight: .semibold,
                          fontSize: .textBase,
                          color: FlowbiteTheme.extension(context).textHeading,
                        ),
                      ),
                      Text(
                        message,
                        style: FlowbiteFontFamily.inter(
                          fontWeight: .normal,
                          fontSize: .textSm,
                          color: FlowbiteTheme.extension(context).textBody,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 12.0,
                    children: buttons
                        .map((button) => Expanded(child: button))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Factory constructor for with progress bar variant.
  factory FlowbiteToast.progressBar({
    required BuildContext context,
    required FlowbiteIconShape iconShape,
    required FlowbiteProgressBar progressBar,
    required String title,
    required String message,
    required List<Widget> buttons,
    double width = 320.0,
  }) {
    return FlowbiteToast(
      margin: .only(
        bottom: 0.0,
        left: 0.0,
        right: MediaQuery.of(context).size.width - width,
      ),
      content: _buildContainer(
        context,
        child: Column(
          crossAxisAlignment: .start,
          spacing: 14.0,
          children: [
            FlowbiteIconShape(
              icon: iconShape.icon,
              size: .base,
              color: iconShape.color,
              type: iconShape.type,
            ),
            Column(
              crossAxisAlignment: .start,
              spacing: 8.0,
              children: [
                Text(
                  title,
                  style: FlowbiteFontFamily.inter(
                    fontWeight: .semibold,
                    fontSize: .textBase,
                    color: FlowbiteTheme.extension(context).textHeading,
                  ),
                ),
                Text(
                  message,
                  style: FlowbiteFontFamily.inter(
                    fontWeight: .normal,
                    fontSize: .textSm,
                    color: FlowbiteTheme.extension(context).textBody,
                  ),
                ),
              ],
            ),
            progressBar,
            Row(
              spacing: 12.0,
              children: buttons
                  .map((button) => Expanded(child: button))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  /// Factory constructor for warning variant.
  factory FlowbiteToast.warning({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String message,
    required List<Widget> buttons,
    double width = 640.0,
  }) {
    return FlowbiteToast(
      margin: .only(
        bottom: 0.0,
        left: 0.0,
        right: MediaQuery.of(context).size.width - width,
      ),
      content: _buildContainer(
        context,
        showCloseButton: false,
        backgroundColor: FlowbiteTheme.extension(context).bgWarningSoft,
        borderColor: FlowbiteTheme.extension(context).borderWarningSubtle,
        child: Row(
          crossAxisAlignment: .start,
          spacing: 12.0,
          children: [
            Icon(
              icon,
              size: 20.0,
              color: FlowbiteTheme.extension(context).textFgWarning,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .stretch,
                spacing: 12.0,
                children: [
                  Column(
                    crossAxisAlignment: .stretch,
                    spacing: 8.0,
                    children: [
                      Text(
                        title,
                        style: FlowbiteFontFamily.inter(
                          fontWeight: .semibold,
                          fontSize: .textBase,
                          color: FlowbiteTheme.extension(context).textFgWarning,
                        ),
                      ),
                      Text(
                        message,
                        style: FlowbiteFontFamily.inter(
                          fontWeight: .normal,
                          fontSize: .textSm,
                          color: FlowbiteTheme.extension(context).textFgWarning,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 12.0,
                    children: buttons.map((button) => button).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Factory constructor for error variant.
  factory FlowbiteToast.error({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String message,
    required List<Widget> buttons,
    double width = 384.0,
  }) {
    return FlowbiteToast(
      margin: .only(
        bottom: 0.0,
        left: 0.0,
        right: MediaQuery.of(context).size.width - width,
      ),
      content: _buildContainer(
        context,
        showCloseButton: false,
        backgroundColor: FlowbiteTheme.extension(context).bgDangerSoft,
        borderColor: FlowbiteTheme.extension(context).borderDangerSubtle,
        child: Row(
          crossAxisAlignment: .start,
          spacing: 12.0,
          children: [
            Icon(
              icon,
              size: 20.0,
              color: FlowbiteTheme.extension(context).bgDangerStrong,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .stretch,
                spacing: 12.0,
                children: [
                  Column(
                    crossAxisAlignment: .stretch,
                    spacing: 8.0,
                    children: [
                      Text(
                        title,
                        style: FlowbiteFontFamily.inter(
                          fontWeight: .semibold,
                          fontSize: .textBase,
                          color: FlowbiteTheme.extension(context)
                              .bgDangerStrong,
                        ),
                      ),
                      Text(
                        message,
                        style: FlowbiteFontFamily.inter(
                          fontWeight: .normal,
                          fontSize: .textSm,
                          color: FlowbiteTheme.extension(context)
                              .bgDangerStrong,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 12.0,
                    children: buttons.map((button) => button).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildContainer(
    BuildContext context, {
    required Widget child,
    bool showCloseButton = true,
    double padding = 16.0,
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color:
                backgroundColor ??
                FlowbiteTheme.extension(context).bgNeutralPrimaryMedium,
            borderRadius: .circular(12.0),
            border: .all(
              color:
                  borderColor ??
                  FlowbiteTheme.extension(context).borderBaseMedium,
            ),
          ),
          padding: EdgeInsets.all(padding),
          child: child,
        ),
        if (showCloseButton)
          Positioned(top: 5.0, right: 5.0, child: _buildCloseButton(context)),
      ],
    );
  }

  static Widget _buildCloseButton(BuildContext context) {
    return FlowbiteButton.iconOnly(
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
      icon: const Icon(FlowbiteOutlineIcons.x),
      color: .ghost,
      size: .xs,
    );
  }
}

/// Preview class for [FlowbiteToast].
///
/// Only used for documentation purpose.
class PreviewFlowbiteToast extends StatelessWidget {
  /// Constructor.
  const PreviewFlowbiteToast({super.key});

  @override
  Widget build(BuildContext context) {
    final snackbars = [
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
      ),
      FlowbiteToast.iconShapeText(
        context: context,
        iconShape: const FlowbiteIconShape(
          icon: FlowbiteOutlineIcons.check,
          color: .green,
          type: .square,
        ),
        message: 'Notification message here!',
      ),
      FlowbiteToast.iconText(
        context: context,
        icon: FlowbiteOutlineIcons.papper_plane,
        message: 'Message sent successfully.',
      ),
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
      ),
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
      ),
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
      ),
      FlowbiteToast.progressBar(
        context: context,
        iconShape: const FlowbiteIconShape(
          icon: FlowbiteOutlineIcons.cloud_arrow_up,
          type: .square,
        ),
        title: 'Uploading in progress',
        message: '''Please wait while your file is being uploaded. This may take a moment.''',
        progressBar: const FlowbiteProgressBar(
          endLabel: '75%',
          value: 0.5,
          labelPosition: .side,
        ),
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
      ),
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
      ),
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
    ];

    return Column(
      crossAxisAlignment: .start,
      spacing: 16.0,
      children: [
        ...snackbars.map(
          (snackbar) => SizedBox(width: 380.0, child: snackbar.content),
        ),
      ],
    );
  }
}

@FlowbitePreview(name: 'Toast - Light', group: 'Toast', brightness: .light)
@FlowbitePreview(name: 'Toast - Dark', group: 'Toast', brightness: .dark)
/// Widget preview for [FlowbiteToast].
Widget previewFlowbiteToast() {
  return const PreviewFlowbiteToast();
}
