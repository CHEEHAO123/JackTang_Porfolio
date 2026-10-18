import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';

Future<void> launchExternalUrl(String url) async {
  final uri = Uri.parse(url);
  await launchUrl(uri, webOnlyWindowName: '_blank');
}

String get phoneDialUri => 'tel:${PortfolioData.phone.replaceAll(RegExp(r'[^0-9+]'), '')}';

/// Row of icon buttons linking to email and phone.
class SocialLinks extends StatelessWidget {
  final Color? iconColor;
  final double spacing;
  final double size;

  const SocialLinks({super.key, this.iconColor, this.spacing = 12, this.size = 20});

  @override
  Widget build(BuildContext context) {
    final color = iconColor ?? context.surfaces.textMuted;

    final entries = <(IconData, String, Future<void> Function())>[
      (Icons.mail_outline_rounded, 'Email', () => launchExternalUrl('mailto:${PortfolioData.email}')),
      (Icons.call_outlined, 'Call', () => launchExternalUrl(phoneDialUri)),
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < entries.length; i++) ...[
          if (i > 0) SizedBox(width: spacing),
          _SocialIcon(icon: entries[i].$1, tooltip: entries[i].$2, color: color, size: size, onTap: entries[i].$3),
        ],
      ],
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final Color color;
  final double size;
  final Future<void> Function() onTap;

  const _SocialIcon({
    required this.icon,
    required this.tooltip,
    required this.color,
    required this.size,
    required this.onTap,
  });

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.primary;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Tooltip(
        message: widget.tooltip,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => widget.onTap(),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              widget.icon,
              size: widget.size,
              color: _hover ? accent : widget.color,
            ),
          ),
        ),
      ),
    );
  }
}
