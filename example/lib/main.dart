import 'package:example/alert_section.dart';
import 'package:example/avatar_group_label_section.dart';
import 'package:example/avatar_group_section.dart';
import 'package:example/avatar_section.dart';
import 'package:example/badge_section.dart';
import 'package:example/button_group_section.dart';
import 'package:example/button_section.dart';
import 'package:example/color_section.dart';
import 'package:example/icon_shape_section.dart';
import 'package:example/input_field_section.dart';
import 'package:example/section_container.dart';
import 'package:example/spinner_section.dart';
import 'package:example/typography_section.dart';
import 'package:flowbite_ui/flowbite_ui.dart';
import 'package:material_ui/material_ui.dart';

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
          padding: const .all(16.0),
          child: Column(
            spacing: 24.0,
            children: [
              SectionContainer(
                fileName: 'accordion',
                child: PreviewFlowbiteAccordion(),
              ),
              SectionContainer(
                fileName: 'bottom-navigation',
                child: PreviewFlowbiteBottomNavigation(),
              ),
              SectionContainer(
                fileName: 'toggle-input',
                child: PreviewFlowbiteToggleInput(),
              ),
              AlertSection(),
              AvatarSection(),
              AvatarGroupLabelSection(),
              AvatarGroupSection(),
              BadgeSection(),
              ButtonSection(),
              ButtonGroupSection(),
              SectionContainer(
                fileName: 'breadcrumb',
                child: PreviewFlowbiteBreadcrumb(),
              ),
              IconShapeSection(),
              SectionContainer(
                fileName: 'jumbotron',
                child: PreviewFlowbiteJumbotron(),
              ),
              InputFieldSection(),
              SpinnerSection(),
              TypographySection(),
              ColorSection(),
            ],
          ),
        ),
      ),
    );
  }
}
