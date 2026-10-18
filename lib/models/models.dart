/// Immutable data models describing the resume content rendered by the app.
/// Keeping these as plain Dart classes (rather than parsing the PDF at
/// runtime) keeps the UI fast and lets content be reviewed/edited as code.
library;

class SkillCategory {
  final String title;
  final List<String> skills;

  const SkillCategory({required this.title, required this.skills});
}

class ResponsibilityGroup {
  final String title;
  final List<String> items;

  const ResponsibilityGroup({required this.title, required this.items});
}

class Achievement {
  final String title;
  final String? period;
  final String description;

  const Achievement({required this.title, this.period, required this.description});
}

class ExperienceEntry {
  final String company;
  final String role;
  final String period;
  final String? note;
  final String scope;
  final List<Achievement> achievements;
  final List<ResponsibilityGroup> responsibilities;

  const ExperienceEntry({
    required this.company,
    required this.role,
    required this.period,
    this.note,
    required this.scope,
    required this.achievements,
    required this.responsibilities,
  });
}

class EducationEntry {
  final String institution;
  final String credential;
  final String period;

  const EducationEntry({
    required this.institution,
    required this.credential,
    required this.period,
  });
}

class DevelopmentEntry {
  final String year;
  final String title;

  const DevelopmentEntry({required this.year, required this.title});
}

class GlanceItem {
  final String label;
  final String value;

  const GlanceItem(this.label, this.value);
}
