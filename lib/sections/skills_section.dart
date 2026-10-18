import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/pill_chip.dart';
import '../widgets/section_heading.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const _icons = {
    'Application Support': Icons.support_agent_rounded,
    'Infrastructure': Icons.dns_rounded,
    'Database': Icons.storage_rounded,
    'Delivery & Business': Icons.groups_rounded,
  };

  @override
  Widget build(BuildContext context) {
    final device = Responsive.deviceTypeOf(context);
    final columns = switch (device) {
      DeviceType.mobile => 1,
      DeviceType.tablet => 2,
      DeviceType.desktop => 2,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          kicker: 'Skills',
          title: 'Core skills',
          subtitle: 'Hands-on technical support combined with delivery coordination and stakeholder management.',
        ),
        const SizedBox(height: 28),
        LayoutBuilder(
          builder: (context, constraints) {
            const spacing = 20.0;
            final width = (constraints.maxWidth - spacing * (columns - 1)) / columns;
            return Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: [
                for (final category in PortfolioData.skillCategories)
                  SizedBox(
                    width: width,
                    child: _SkillCard(
                      title: category.title,
                      skills: category.skills,
                      icon: _icons[category.title] ?? Icons.bolt_rounded,
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _SkillCard extends StatefulWidget {
  final String title;
  final List<String> skills;
  final IconData icon;

  const _SkillCard({required this.title, required this.skills, required this.icon});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaces = context.surfaces;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: surfaces.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _hover ? AppColors.accent.withValues(alpha: 0.5) : surfaces.border),
          boxShadow: _hover
              ? [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.14),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [],
        ),
        transform: Matrix4.translationValues(0, _hover ? -3 : 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Icon(widget.icon, color: AppColors.accent, size: 17),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(widget.title, style: theme.textTheme.titleMedium),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: surfaces.surfaceAlt,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    '${widget.skills.length}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: surfaces.textMuted,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Divider(height: 1, color: surfaces.border),
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [for (final s in widget.skills) PillChip(label: s)],
            ),
          ],
        ),
      ),
    );
  }
}
