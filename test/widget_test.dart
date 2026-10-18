// Smoke test verifying the portfolio app boots and renders the hero content.

import 'package:flutter_test/flutter_test.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:self/data/portfolio_data.dart';
import 'package:self/main.dart';

void main() {
  // Disable the visibility_detector debounce timer so it doesn't outlive
  // the widget tree between tests.
  VisibilityDetectorController.instance.updateInterval = Duration.zero;

  testWidgets('Portfolio app renders the hero section', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pump();

    expect(find.textContaining(PortfolioData.name), findsWidgets);
    expect(find.text('Download resume'), findsWidgets);
  });
}
