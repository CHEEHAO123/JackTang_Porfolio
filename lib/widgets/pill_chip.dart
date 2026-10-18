import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// A small rounded tag used for tech stacks and tool lists.
class PillChip extends StatelessWidget {
  final String label;
  final bool accented;

  const PillChip({super.key, required this.label, this.accented = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaces = context.surfaces;
    final accentColor = theme.colorScheme.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: accented ? accentColor.withValues(alpha: 0.12) : surfaces.surfaceAlt,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: accented ? accentColor.withValues(alpha: 0.35) : surfaces.border,
        ),
      ),
      child: Text(
        label,
        style: theme.textTheme.bodySmall?.copyWith(
          color: accented ? accentColor : surfaces.textPrimary,
          fontWeight: FontWeight.w500,
          height: 1.2,
        ),
      ),
    );
  }
}
