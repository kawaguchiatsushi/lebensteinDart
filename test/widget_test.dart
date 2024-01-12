// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:lebenstein/lebenstein.dart';

import '';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("sortlebenstein", () {
    String query = "日本";
    List<String> damiydata = ["日本人", "日本語版", "日本", "アメリカン"];
    var indexs = CalcLevenshtein.calc(query, damiydata);
    expect(CalcLevenshtein.changeIndex(indexs, damiydata),
        ["日本", "日本人", "日本語版", "アメリカン"]);
  });
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
