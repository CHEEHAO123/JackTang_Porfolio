import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../utils/resume_launcher.dart';
import '../utils/responsive.dart';
import '../widgets/social_links.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 28 : 48),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            'Get in touch',
            textAlign: TextAlign.center,
            style: (isMobile ? theme.textTheme.headlineSmall : theme.textTheme.headlineMedium)
                ?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Text(
              'Happy to share more about my experience. Reach out by email or phone, '
              'or download my resume.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white.withValues(alpha: 0.92)),
            ),
          ),
          const SizedBox(height: 28),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 14,
            runSpacing: 14,
            children: [
              FilledButton.icon(
                onPressed: () => launchExternalUrl('mailto:${PortfolioData.email}'),
                style: _filled,
                icon: const Icon(Icons.mail_outline_rounded, size: 18),
                label: Text(PortfolioData.email),
              ),
              FilledButton.icon(
                onPressed: () => launchExternalUrl(phoneDialUri),
                style: _filled,
                icon: const Icon(Icons.call_outlined, size: 18),
                label: Text(PortfolioData.phone),
              ),
              OutlinedButton.icon(
                onPressed: openResume,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white70),
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                icon: const Icon(Icons.download_rounded, size: 18),
                label: const Text('Download resume'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static final ButtonStyle _filled = FilledButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: AppColors.accent,
    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}
