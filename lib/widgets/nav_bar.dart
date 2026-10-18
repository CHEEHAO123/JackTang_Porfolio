import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

class NavItem {
  final String label;
  final VoidCallback onTap;

  const NavItem(this.label, this.onTap);
}

/// Fixed top navigation bar. Shows inline links on desktop/tablet and
/// collapses into a menu button + bottom sheet on mobile.
class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final List<NavItem> items;
  final bool isDark;
  final VoidCallback onToggleTheme;
  final VoidCallback onDownloadResume;
  final double scrollOffset;
  final int activeIndex;

  const NavBar({
    super.key,
    required this.items,
    required this.isDark,
    required this.onToggleTheme,
    required this.onDownloadResume,
    required this.scrollOffset,
    required this.activeIndex,
  });

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final surfaces = context.surfaces;
    // Below desktop width the full link row doesn't fit alongside the
    // brand, theme toggle and resume button, so fall back to the menu.
    final showFullNav = Responsive.isDesktop(context);
    final elevated = scrollOffset > 8;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: surfaces.background,
        border: Border(
          bottom: BorderSide(color: surfaces.border),
        ),
        boxShadow: elevated
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.28 : 0.06),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: preferredSize.height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Responsive.horizontalPadding(context)),
            child: Row(
              children: [
                _Brand(surfaces: surfaces),
                const Spacer(),
                if (showFullNav) ...[
                  for (var i = 0; i < items.length; i++) _NavLink(item: items[i], active: i == activeIndex),
                  const SizedBox(width: 8),
                  _ThemeToggle(isDark: isDark, onToggle: onToggleTheme),
                  const SizedBox(width: 12),
                  FilledButton(
                    onPressed: onDownloadResume,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Resume'),
                  ),
                ] else ...[
                  _ThemeToggle(isDark: isDark, onToggle: onToggleTheme),
                  IconButton(
                    icon: const Icon(Icons.menu_rounded),
                    onPressed: () => _openMobileMenu(context),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openMobileMenu(BuildContext context) {
    final surfaces = context.surfaces;
    showModalBottomSheet(
      context: context,
      backgroundColor: surfaces.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: surfaces.border,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                for (var i = 0; i < items.length; i++)
                  ListTile(
                    title: Text(
                      items[i].label,
                      style: Theme.of(sheetContext).textTheme.titleMedium?.copyWith(
                            color: i == activeIndex ? AppColors.accent : null,
                          ),
                    ),
                    onTap: () {
                      Navigator.pop(sheetContext);
                      items[i].onTap();
                    },
                  ),
                const Divider(height: 24),
                ListTile(
                  leading: const Icon(Icons.download_rounded, color: AppColors.accent),
                  title: const Text('Download Resume'),
                  onTap: () {
                    Navigator.pop(sheetContext);
                    onDownloadResume();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Brand extends StatelessWidget {
  final PortfolioSurfaces surfaces;

  const _Brand({required this.surfaces});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.asset(
            PortfolioData.profileImagePath,
            width: 36,
            height: 36,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          PortfolioData.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}

class _NavLink extends StatefulWidget {
  final NavItem item;
  final bool active;

  const _NavLink({required this.item, required this.active});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final surfaces = context.surfaces;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: InkWell(
          onTap: widget.item.onTap,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 150),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: _hover || widget.active ? AppColors.accent : surfaces.textPrimary,
                  fontWeight: widget.active ? FontWeight.w700 : FontWeight.w500,
                ),
            child: Text(widget.item.label),
          ),
        ),
      ),
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggle;

  const _ThemeToggle({required this.isDark, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: isDark ? 'Switch to light mode' : 'Switch to dark mode',
      onPressed: onToggle,
      icon: Icon(isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
    );
  }
}
