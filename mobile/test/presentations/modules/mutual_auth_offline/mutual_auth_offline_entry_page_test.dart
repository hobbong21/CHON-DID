import 'package:base_flutter/presentations/modules/mutual_auth_offline/mutual_auth_offline_entry_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _harness(Widget child) => MaterialApp(home: child);

void main() {
  group('MutualAuthOfflineEntryPage', () {
    testWidgets('renders both action cards with their copy', (tester) async {
      await tester.pumpWidget(_harness(MutualAuthOfflineEntryPage(
        onShowMyQr: () {},
        onScanQr: () {},
      )));
      expect(find.text('내 QR 보여주기'), findsOneWidget);
      expect(find.text('상대 QR 스캔하기'), findsOneWidget);
      expect(find.text('상대방이 내 QR을 스캔합니다.'), findsOneWidget);
      expect(find.text('카메라로 상대방의 QR을 인식합니다.'), findsOneWidget);
    });

    testWidgets('Show card fires onShowMyQr', (tester) async {
      var taps = 0;
      await tester.pumpWidget(_harness(MutualAuthOfflineEntryPage(
        onShowMyQr: () => taps++,
        onScanQr: () {},
      )));
      await tester.tap(find.byKey(const Key('offline.entry.show')));
      await tester.pumpAndSettle();
      expect(taps, 1);
    });

    testWidgets('Scan card fires onScanQr', (tester) async {
      var taps = 0;
      await tester.pumpWidget(_harness(MutualAuthOfflineEntryPage(
        onShowMyQr: () {},
        onScanQr: () => taps++,
      )));
      await tester.tap(find.byKey(const Key('offline.entry.scan')));
      await tester.pumpAndSettle();
      expect(taps, 1);
    });
  });
}
