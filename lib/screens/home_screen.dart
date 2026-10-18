import 'package:flutter/material.dart';

import '../sections/contact_section.dart';
import '../sections/education_section.dart';
import '../sections/experience_section.dart';
import '../sections/hero_section.dart';
import '../sections/skills_section.dart';
import '../sections/summary_section.dart';
import '../utils/resume_launcher.dart';
import '../widgets/footer.dart';
import '../widgets/nav_bar.dart';
import '../widgets/reveal_on_scroll.dart';
import '../widgets/section_container.dart';

class HomeScreen extends StatefulWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;

  const HomeScreen({super.key, required this.isDark, required this.onToggleTheme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  double _scrollOffset = 0;
  int _activeIndex = -1;

  final _heroKey = GlobalKey();
  final _summaryKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _educationKey = GlobalKey();
  final _contactKey = GlobalKey();

  late final List<GlobalKey> _navKeys = [
    _summaryKey,
    _skillsKey,
    _experienceKey,
    _educationKey,
    _contactKey,
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final active = _computeActiveIndex();
    final offset = _scrollController.offset;
    // Only rebuild when something the UI shows actually changed.
    if (active != _activeIndex || (offset > 8) != (_scrollOffset > 8)) {
      setState(() {
        _activeIndex = active;
        _scrollOffset = offset;
      });
    } else {
      _scrollOffset = offset;
    }
  }

  /// The last section whose top has scrolled past the sticky nav bar.
  int _computeActiveIndex() {
    var active = -1;
    for (var i = 0; i < _navKeys.length; i++) {
      final box = _navKeys[i].currentContext?.findRenderObject() as RenderBox?;
      if (box == null || !box.attached) continue;
      if (box.localToGlobal(Offset.zero).dy <= 120) active = i;
    }
    return active;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final navItems = [
      NavItem('Summary', () => _scrollTo(_summaryKey)),
      NavItem('Skills', () => _scrollTo(_skillsKey)),
      NavItem('Experience', () => _scrollTo(_experienceKey)),
      NavItem('Education', () => _scrollTo(_educationKey)),
      NavItem('Contact', () => _scrollTo(_contactKey)),
    ];

    return Scaffold(
      appBar: NavBar(
        items: navItems,
        isDark: widget.isDark,
        onToggleTheme: widget.onToggleTheme,
        onDownloadResume: openResume,
        scrollOffset: _scrollOffset,
        activeIndex: _activeIndex,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SectionContainer(
              sectionKey: _heroKey,
              child: HeroSection(onContact: () => _scrollTo(_contactKey)),
            ),
            SectionContainer(
              sectionKey: _summaryKey,
              tinted: true,
              child: const RevealOnScroll(child: SummarySection()),
            ),
            SectionContainer(
              sectionKey: _skillsKey,
              child: const RevealOnScroll(child: SkillsSection()),
            ),
            SectionContainer(
              sectionKey: _experienceKey,
              tinted: true,
              child: const RevealOnScroll(child: ExperienceSection()),
            ),
            SectionContainer(
              sectionKey: _educationKey,
              child: const RevealOnScroll(child: EducationSection()),
            ),
            SectionContainer(
              sectionKey: _contactKey,
              tinted: true,
              child: const RevealOnScroll(child: ContactSection()),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
