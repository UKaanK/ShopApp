import 'package:flutter_test/flutter_test.dart';
import 'package:shopapp/model/cart_model.dart';
// CartModel dosyanızın yolu

void main() {
  
  group('CartModel Tests', () {
    late CartModel cartModel;

    setUp(() {
      // Testlerden önce yeni bir CartModel oluşturulur
      cartModel = CartModel();
    });

    test('Initial cart is empty', () {
      // Başlangıçta sepet boş olmalı
      expect(cartModel.cartItems.length, 0);
    });

    test('Add item to cart', () {
      // Bir öğeyi sepete ekleyelim
      cartModel.addItemToCart(0); // Banana eklendi
      expect(cartModel.cartItems.length, 1);
      expect(cartModel.cartItems[0]['name'], 'Banana');
    });

    test('Remove item from cart', () {
      // Bir öğeyi sepete ekleyip sonra kaldırıyoruz
      cartModel.addItemToCart(1); // Apple eklendi
      expect(cartModel.cartItems.length, 1);

      cartModel.removeItemToCart(cartModel.cartItems[0]); // Apple kaldırıldı
      expect(cartModel.cartItems.length, 0);
    });

    test('Calculate total price', () {
      // Fiyatların toplamını hesaplıyoruz
      cartModel.addItemToCart(0); // Banana eklendi
      cartModel.addItemToCart(1); // Apple eklendi

      String totalPrice = cartModel.calculateTotal();
      expect(totalPrice, '6.50'); // 4.00 + 2.50 = 6.50
    });

    test('Calculate total price after removing item', () {
      // Bir öğeyi ekleyip sonra kaldırdıktan sonra toplam fiyatı hesaplıyoruz
      cartModel.addItemToCart(0); // Banana eklendi
      cartModel.addItemToCart(2); // Chicken eklendi

      String totalPrice = cartModel.calculateTotal();
      expect(totalPrice, '18.00'); // 4.00 + 14.00 = 18.00

      cartModel.removeItemToCart(cartModel.cartItems[0]); // Banana kaldırıldı
      totalPrice = cartModel.calculateTotal();
      expect(totalPrice, '14.00'); // Sadece Chicken kaldı
    });
  });
}
