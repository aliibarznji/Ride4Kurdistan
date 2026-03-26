import 'package:flutter_test/flutter_test.dart';
import 'package:ride4kurdistan/main.dart';

void main() {
  testWidgets('Splash navigates to auth page', (WidgetTester tester) async {
    await tester.pumpWidget(const Ride4KurdistanApp());
    expect(find.text('Ride4Kurdistan'), findsOneWidget);
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();
    expect(find.text('Welcome'), findsOneWidget);
  });
}
