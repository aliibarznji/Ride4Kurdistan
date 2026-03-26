import 'package:flutter_test/flutter_test.dart';
import 'package:ride4kurdistan/app/ride4kurdistan_app.dart';

void main() {
  testWidgets('Splash navigates to auth page', (WidgetTester tester) async {
    await tester.pumpWidget(const Ride4KurdistanApp());
    expect(find.text('Ride4Kurdistan'), findsOneWidget);
    await tester.pump(const Duration(milliseconds: 2800));
    await tester.pumpAndSettle();
    expect(find.text('Welcome back'), findsOneWidget);
  });
}
