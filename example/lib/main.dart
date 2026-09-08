import 'package:example/button_section.dart';
import 'package:example/color_section.dart';
import 'package:example/icon_shape_section.dart';
import 'package:example/typography_section.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: FlowbiteTheme.light,
      darkTheme: FlowbiteTheme.dark,
      home: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 24.0,
            children: [
              IconShapeSection(),
              ButtonSection(),
              TypographySection(),
              ColorSection(),
            ],
          ),
        ),
      ),
    );
  }
}
