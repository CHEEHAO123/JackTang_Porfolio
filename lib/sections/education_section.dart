import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/section_heading.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final theme = Theme.of(context);
    final surfaces = context.surfaces;

    final educationColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ColumnTitle(icon: Icons.school_rounded, title: 'Education'),
        const SizedBox(height: 16),
        for (final edu in PortfolioData.education)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: surfaces.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: surfaces.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(edu.credential, style: theme.textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(edu.institution, style: theme.textTheme.bodyMedium?.copyWith(color: surfaces.textPrimary)),
                const SizedBox(height: 4),
                Text(edu.period, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
      ],
    );

    final developmentColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ColumnTitle(icon: Icons.workspace_premium_rounded, title: 'Professional development'),
        const SizedBox(height: 4),
        Text('Certificates of Attendance', style: theme.textTheme.bodySmall),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: surfaces.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: surfaces.border),
          ),
          child: Column(
            children: [
              for (var i = 0; i < PortfolioData.development.length; i++) ...[
                if (i > 0) Divider(height: 1, color: surfaces.border),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 48,
                        child: Text(
                          PortfolioData.development[i].year,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.accent,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          PortfolioData.development[i].title,
                          style: theme.textTheme.bodyMedium?.copyWith(color: surfaces.textPrimary),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          kicker: 'Education',
          title: 'Education & professional development',
        ),
        const SizedBox(height: 28),
        isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [educationColumn, const SizedBox(height: 28), developmentColumn],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: educationColumn),
                  const SizedBox(width: 48),
                  Expanded(child: developmentColumn),
                ],
              ),
      ],
    );
  }
}

class _ColumnTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  const _ColumnTitle({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.accent, size: 22),
        const SizedBox(width: 10),
        Text(title, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
