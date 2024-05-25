import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  List<Map<String, dynamic>> _shopItems = [
    {"name": "Banana", "price": "4.00", "imagePath": "assets/images/banana.png", "color": Colors.yellow},
    {"name": "Apple", "price": "2.50", "imagePath": "assets/images/apple.png", "color": Colors.green},
    {"name": "Chicken", "price": "14.00", "imagePath": "assets/images/chicken.png", "color": Colors.brown},
    {"name": "Water", "price": "1.00", "imagePath": "assets/images/water.png", "color": Colors.blue}
  ];

  List _cartItems = [];

  List<Map<String, dynamic>> get shopItems => _shopItems;

  get cartItems=> _cartItems;
  
  //Add item to cart
  void addItemToCart(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }
  //Remove item to Cart
  void removeItemToCart(Map<String, dynamic> index){
    _cartItems.remove(index);
    notifyListeners();
  }
  //Calculate Total Price
  String calculateTotal(){
    double totalPrice=0;
    for (var i = 0; i < cartItems.length; i++) {
      totalPrice+=double.parse(cartItems[i]["price"]);
      
    }
    return totalPrice.toStringAsFixed(2);
  }
}