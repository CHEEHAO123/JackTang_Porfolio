import 'package:url_launcher/url_launcher.dart';

import '../data/portfolio_data.dart';

/// Opens the bundled resume PDF in a new browser tab.
///
/// Flutter web serves pubspec `assets:` entries under an extra `assets/`
/// prefix (e.g. `assets/resume/foo.pdf` -> `assets/assets/resume/foo.pdf`).
/// Resolving against [Uri.base] keeps this working regardless of the
/// deployment sub-path (root domain, GitHub Pages project path, etc).
Future<void> openResume() async {
  final uri = Uri.base.resolve('assets/${PortfolioData.resumeAssetPath}');
  await launchUrl(uri, webOnlyWindowName: '_blank');
}
