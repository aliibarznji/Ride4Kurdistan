import 'package:flutter_test/flutter_test.dart';
e import 'package:ride4kurdistan/app/ride4kurdistan_app.dart';

void main() {
  testWidgets('onboarding slides advance to auth page', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const Ride4KurdistanApp());

    expect(find.text('Ride4Kurdistan'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);

    await tester.ensureVisible(find.text('Next'));
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    expect(find.text('How To Use The App'), findsOneWidget);

    await tester.ensureVisible(find.text('Next'));
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    expect(find.text('Privacy And Safety'), findsOneWidget);

    await tester.ensureVisible(find.text('Get Started'));
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();
    expect(find.text('Welcome back'), findsOneWidget);
  });
}
