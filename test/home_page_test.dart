import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/components/market_item_tile.dart';
import 'package:shopapp/model/cart_model.dart';
import 'package:shopapp/pages/cart_page.dart';
import 'package:shopapp/pages/home_page.dart';

class MockCartModel extends Mock implements CartModel {}

void main() {
  testWidgets('HomePage displays correct information and navigates to CartPage', (WidgetTester tester) async {
    // Mock model oluştur
    final mockCartModel = MockCartModel();

    // Mock veri döndür
    when(mockCartModel.shopItems).thenReturn([
      {"name": "Apple", "price": "2.99", "imagePath": "assets/images/placeholder.png", "color": Colors.green},
      {"name": "Banana", "price": "1.99", "imagePath": "assets/images/placeholder.png", "color": Colors.yellow},
    ]);

    // Test widget'ı oluştur
    await tester.pumpWidget(
      ChangeNotifierProvider<CartModel>.value(
        value: mockCartModel,
        child: MaterialApp(
          home: HomePage(),
        ),
      ),
    );

    // Verilerin doğru şekilde görüntülendiğini kontrol et
    expect(find.text('Apple'), findsOneWidget);
    expect(find.text('\$2.99'), findsOneWidget);
    expect(find.text('Banana'), findsOneWidget);
    expect(find.text('\$1.99'), findsOneWidget);

    // FloatingActionButton'a tıklamayı simüle et
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle(); // Tüm geçişlerin tamamlanmasını bekle

    // CartPage'e yönlendirilip yönlendirilmediğini kontrol et
    expect(find.byType(CartPage), findsOneWidget);
  });
}
