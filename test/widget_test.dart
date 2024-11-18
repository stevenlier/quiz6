import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:quiz_6/main.dart';
import 'package:quiz_6/theme_provider.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Membungkus MyApp dengan MultiProvider untuk menyertakan ThemeProvider.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: MyApp(),
      ),
    );
    await tester.pumpAndSettle(); // Pastikan semua widget selesai dibangun

    // Verifikasi bahwa counter dimulai dari 0.
    expect(find.text('Counter: 0'), findsOneWidget);
    expect(find.text('Counter: 1'), findsNothing);

    // Ketuk ikon '+' dan trigger frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    await tester.pumpAndSettle(); // Tunggu sampai semua animasi selesai

    // Verifikasi bahwa counter sudah bertambah.
    expect(find.text('Counter: 0'), findsNothing);
    expect(find.text('Counter: 1'), findsOneWidget);
  });
}
