import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// A small kicker label + large title used at the top of every section,
/// e.g. "EXPERIENCE" over "Where I've worked".
class SectionHeading extends StatelessWidget {
  final String kicker;
  final String title;
  final String? subtitle;

  const SectionHeading({
    super.key,
    required this.kicker,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          kicker.toUpperCase(),
          style: theme.textTheme.labelLarge?.copyWith(
            color: AppColors.accent,
            letterSpacing: 1.8,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(title, style: theme.textTheme.headlineMedium),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(
              subtitle!,
              style: theme.textTheme.bodyLarge?.copyWith(color: context.surfaces.textMuted),
            ),
          ),
        ],
      ],
    );
  }
}
