import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/resume_launcher.dart';
import '../utils/responsive.dart';
import '../widgets/social_links.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContact;

  const HeroSection({super.key, required this.onContact});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final theme = Theme.of(context);
    final surfaces = context.surfaces;

    final textColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          PortfolioData.roleTitle.toUpperCase(),
          style: theme.textTheme.labelLarge?.copyWith(
            color: AppColors.accent,
            letterSpacing: 1.8,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          PortfolioData.name,
          style: (isMobile ? theme.textTheme.displaySmall : theme.textTheme.displayLarge)
              ?.copyWith(height: 1.1),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(
            PortfolioData.tagline,
            style: theme.textTheme.bodyLarge?.copyWith(color: surfaces.textMuted, fontSize: 17),
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton.icon(
              onPressed: openResume,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              icon: const Icon(Icons.download_rounded, size: 18),
              label: const Text('Download resume'),
            ),
            OutlinedButton.icon(
              onPressed: onContact,
              style: OutlinedButton.styleFrom(
                foregroundColor: surfaces.textPrimary,
                side: BorderSide(color: surfaces.border),
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              icon: const Icon(Icons.mail_outline_rounded, size: 18),
              label: const Text('Contact'),
            ),
          ],
        ),
      ],
    );

    final glanceCard = _GlanceCard();

    return SizedBox(
      width: double.infinity,
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textColumn,
                const SizedBox(height: 32),
                glanceCard,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 6, child: textColumn),
                const SizedBox(width: 48),
                Expanded(flex: 4, child: glanceCard),
              ],
            ),
    );
  }
}

class _GlanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaces = context.surfaces;
    final items = PortfolioData.glance;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: surfaces.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: surfaces.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 128,
              height: 128,
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.accent),
              child: ClipOval(
                child: Image.asset(PortfolioData.profileImagePath, fit: BoxFit.cover, alignment: Alignment.topCenter),
              ),
            ),
          ),
          Text('AT A GLANCE', style: theme.textTheme.labelLarge?.copyWith(letterSpacing: 1.4, color: surfaces.textMuted)),
          const SizedBox(height: 12),
          for (var i = 0; i < items.length; i++) ...[
            if (i > 0) Divider(height: 1, color: surfaces.border),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(items[i].label, style: theme.textTheme.bodySmall),
                  ),
                  Expanded(
                    child: Text(
                      items[i].value,
                      style: theme.textTheme.titleSmall?.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
          Divider(height: 1, color: surfaces.border),
          const SizedBox(height: 12),
          const _ContactLine(icon: Icons.mail_outline_rounded, text: PortfolioData.email, mail: true),
          const SizedBox(height: 8),
          const _ContactLine(icon: Icons.call_outlined, text: PortfolioData.phone, mail: false),
        ],
      ),
    );
  }
}

class _ContactLine extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool mail;

  const _ContactLine({required this.icon, required this.text, required this.mail});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => launchExternalUrl(mail ? 'mailto:$text' : phoneDialUri),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Icon(icon, size: 18, color: AppColors.accent),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                text,
                style: theme.textTheme.bodyMedium?.copyWith(color: context.surfaces.textPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
