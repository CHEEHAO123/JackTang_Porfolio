import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../utils/responsive.dart';

/// Centers content with a max width and consistent vertical rhythm, and
/// optionally paints an alternate surface band behind the section so the
/// page reads as distinct chapters while scrolling.
class SectionContainer extends StatelessWidget {
  final Key? sectionKey;
  final Widget child;
  final bool tinted;

  const SectionContainer({
    this.sectionKey,
    required this.child,
    this.tinted = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final surfaces = context.surfaces;
    final isMobile = Responsive.isMobile(context);

    return Container(
      key: sectionKey,
      width: double.infinity,
      decoration: BoxDecoration(
        color: tinted ? surfaces.surfaceAlt : Colors.transparent,
        border: tinted
            ? Border.symmetric(horizontal: BorderSide(color: surfaces.border))
            : null,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
        vertical: isMobile ? 44 : 72,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: Responsive.maxContentWidth),
          child: child,
        ),
      ),
    );
  }
}
