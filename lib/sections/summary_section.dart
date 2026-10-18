import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/section_heading.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final theme = Theme.of(context);
    final surfaces = context.surfaces;

    final summary = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(kicker: 'Summary', title: 'Professional summary'),
        const SizedBox(height: 20),
        Text(
          PortfolioData.summary,
          style: theme.textTheme.bodyLarge?.copyWith(color: surfaces.textMuted, fontSize: 16),
        ),
      ],
    );

    final strengths = Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: surfaces.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: surfaces.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.bolt_rounded, color: AppColors.accent, size: 20),
              const SizedBox(width: 10),
              Text('Additional strengths', style: theme.textTheme.titleMedium),
            ],
          ),
          const SizedBox(height: 12),
          Text(PortfolioData.additionalStrengths, style: theme.textTheme.bodyMedium),
        ],
      ),
    );

    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [summary, const SizedBox(height: 28), strengths],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 6, child: summary),
              const SizedBox(width: 48),
              Expanded(flex: 5, child: strengths),
            ],
          );
  }
}
