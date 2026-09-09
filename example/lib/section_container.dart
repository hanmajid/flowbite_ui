import 'dart:convert';
import 'dart:typed_data';

import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;
import 'package:widgets_to_image/widgets_to_image.dart';

class SectionContainer extends StatefulWidget {
  final Widget child;
  final String fileName;

  const new({super.key, required this.child, required this.fileName});

  @override
  State<SectionContainer> createState() => _SectionContainerState();
}

class _SectionContainerState extends State<SectionContainer> {
  WidgetsToImageController controller = WidgetsToImageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.0,
      children: [
        WidgetsToImage(
          controller: controller,
          child: Container(
            decoration: BoxDecoration(
              color:
                  (Theme.of(context).extension<FlowbiteColorsExtension>() ??
                          FlowbiteTheme.lightThemeColors)
                      .bgNeutralPrimary,
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.all(12.0),
            child: widget.child,
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            // Capture the widget
            Uint8List? bytes = await controller.capturePng();
            if (bytes != null && context.mounted) {
              final theme = Theme.of(context).brightness == Brightness.dark
                  ? 'dark'
                  : 'light';
              downloadBytesOnWeb(bytes, '${widget.fileName}-$theme.png');
            }
          },
          child: const Text("Convert to PNG"),
        ),
      ],
    );
  }

  void downloadBytesOnWeb(Uint8List bytes, String fileName) {
    // Convert bytes to a base64 data URI format
    final String base64Data = base64Encode(bytes);
    final String dataUrl = "data:image/png;base64,$base64Data";

    // Create an invisible anchor <a> element
    final web.HTMLAnchorElement anchor =
        web.document.createElement('a') as web.HTMLAnchorElement
          ..href = dataUrl
          ..style.display = 'none'
          ..download = fileName;

    // Append, click to trigger download, and clean up
    web.document.body!.appendChild(anchor);
    anchor.click();
    web.document.body!.removeChild(anchor);
  }
}
