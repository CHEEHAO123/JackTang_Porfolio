import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import 'social_links.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final surfaces = context.surfaces;
    final isMobile = Responsive.isMobile(context);
    final year = 2026;

    final copyright = Text(
      '© $year ${PortfolioData.name}. Built with Flutter.',
      style: Theme.of(context).textTheme.bodySmall,
    );
    final socials = const SocialLinks(iconColor: null, spacing: 16);

    return Container(
      width: double.infinity,
      color: surfaces.surfaceAlt,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
        vertical: 28,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: Responsive.maxContentWidth),
          child: isMobile
              ? Column(
                  children: [
                    socials,
                    const SizedBox(height: 14),
                    copyright,
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [copyright, socials],
                ),
        ),
      ),
    );
  }
}
