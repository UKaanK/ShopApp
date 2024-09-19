import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopapp/components/market_item_tile.dart'; // MarketItemTile widget'ını içe aktarın

void main() {
  testWidgets(
      'MarketItemTile displays correct information and triggers onPressed',
      (WidgetTester tester) async {
    bool onPressedCalled = false;

    // Test widget'ı oluştur
    await tester.pumpWidget(
      Scaffold(
        body: MarketItemTile(
          itemName: 'Apple',
          itemPrice: '2.99',
          imagePath:
              'assets/images/placeholder.png', // Geçici bir görsel kullanın
          color: Colors.green,
          onPressed: () {
            onPressedCalled=true; // onPressed çağrıldığında işaretle
          },
        ),
      ),
    );

    // itemName'in doğru olarak gösterildiğini kontrol et
    expect(find.text('Apple'), findsOneWidget);

    // itemPrice'in doğru olarak gösterildiğini kontrol et
    expect(find.text('\$2.99'), findsOneWidget);

    // Butona tıklamayı simüle et
    await tester.tap(find.byType(
        MaterialButton)); // Buton türünü ElevatedButton olarak değiştirin
    await tester.pump(); // UI'yi günceller

    // onPressed fonksiyonunun çağrıldığını doğrula
    expect(onPressedCalled, isTrue);
  });
}
