import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../models/models.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/section_heading.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = PortfolioData.experience;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          kicker: 'Experience',
          title: 'Professional experience',
          subtitle: 'Key achievements first; open "Responsibilities" for the full scope of each role.',
        ),
        const SizedBox(height: 28),
        for (var i = 0; i < entries.length; i++)
          Padding(
            padding: EdgeInsets.only(bottom: i == entries.length - 1 ? 0 : 24),
            child: _ExperienceCard(entry: entries[i], initiallyExpanded: false),
          ),
      ],
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final ExperienceEntry entry;
  final bool initiallyExpanded;

  const _ExperienceCard({required this.entry, required this.initiallyExpanded});

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  late bool _expanded = widget.initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaces = context.surfaces;
    final entry = widget.entry;
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 20 : 28),
      decoration: BoxDecoration(
        color: surfaces.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: surfaces.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 6,
            children: [
              Text(entry.role, style: theme.textTheme.titleLarge),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  entry.period,
                  style: theme.textTheme.bodySmall?.copyWith(color: AppColors.accent, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            entry.company,
            style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          if (entry.note != null) ...[
            const SizedBox(height: 2),
            Text(entry.note!, style: theme.textTheme.bodySmall),
          ],
          const SizedBox(height: 14),
          Text(entry.scope, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 22),
          Text('Key achievements', style: theme.textTheme.titleSmall),
          const SizedBox(height: 12),
          _AchievementGrid(achievements: entry.achievements),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: () => setState(() => _expanded = !_expanded),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.accent,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            ),
            icon: Icon(_expanded ? Icons.expand_less_rounded : Icons.expand_more_rounded, size: 20),
            label: Text(_expanded ? 'Hide responsibilities' : 'Responsibilities'),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: _expanded
                ? Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [for (final g in entry.responsibilities) _ResponsibilityBlock(group: g)],
                    ),
                  )
                : const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}

class _AchievementGrid extends StatelessWidget {
  final List<Achievement> achievements;

  const _AchievementGrid({required this.achievements});

  @override
  Widget build(BuildContext context) {
    final columns = Responsive.isMobile(context) ? 1 : 2;
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 14.0;
        final width = (constraints.maxWidth - spacing * (columns - 1)) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (final a in achievements) SizedBox(width: width, child: _AchievementTile(achievement: a)),
          ],
        );
      },
    );
  }
}

class _AchievementTile extends StatelessWidget {
  final Achievement achievement;

  const _AchievementTile({required this.achievement});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaces = context.surfaces;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surfaces.surfaceAlt,
        borderRadius: BorderRadius.circular(12),
        border: Border(left: const BorderSide(color: AppColors.accent, width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(achievement.title, style: theme.textTheme.titleMedium),
          if (achievement.period != null) ...[
            const SizedBox(height: 2),
            Text(
              achievement.period!,
              style: theme.textTheme.bodySmall?.copyWith(color: AppColors.accent, fontWeight: FontWeight.w600),
            ),
          ],
          const SizedBox(height: 8),
          Text(achievement.description, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _ResponsibilityBlock extends StatelessWidget {
  final ResponsibilityGroup group;

  const _ResponsibilityBlock({required this.group});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(group.title, style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          for (final item in group.items) _BulletLine(text: item),
        ],
      ),
    );
  }
}

class _BulletLine extends StatelessWidget {
  final String text;

  const _BulletLine({required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(Icons.circle, size: 5, color: AppColors.accent),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: theme.textTheme.bodyMedium)),
        ],
      ),
    );
  }
}
