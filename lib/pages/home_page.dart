import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/components/market_item_tile.dart';
import 'package:shopapp/model/cart_model.dart';
import 'package:shopapp/pages/cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => const CartPage(),)),
        child: const Icon(Icons.shopping_basket_outlined,
        color: Colors.white,
        ),),
      body:  SafeArea( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40,),
          //Good Morning
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text("Good Morning"),
          ),
          //Good Morning
          const SizedBox(height: 4,),
          const Padding(
             padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Let's order fresh item for you",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold
              ),
              ),
          ),
          const SizedBox(height: 24,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),
          const SizedBox(height: 24,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Fresh Items",
              style: TextStyle(
                fontSize: 16
              ),
              ),
          ),
        Expanded(
  child: Consumer<CartModel>(
    builder: (context, value, child) {
      if (value.shopItems.isNotEmpty) {
        return GridView.builder(
          
          padding: const EdgeInsets.all(8),
          itemCount: value.shopItems.length,
          gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1/1.3),
          
          itemBuilder: (context, index) {
            // Her öğe için gerekli bilgileri bir Map objesine yerleştirin
            Map<String, dynamic> itemInfo = {
              "name": value.shopItems[index]["name"].toString(),
              "price": value.shopItems[index]["price"].toString(),
              "imagePath": value.shopItems[index]["imagePath"].toString(),
              "color": value.shopItems[index]["color"],
            };
            // MarketItemTile oluştururken bu Map objesini geçirin
            return MarketItemTile(
  itemName: itemInfo["name"] ?? "",
  itemPrice: itemInfo["price"] ?? "",
  // imagePath null değilse ve boş değilse kullan, aksi takdirde bir varsayılan resim göster
  imagePath: itemInfo["imagePath"] != null && itemInfo["imagePath"].isNotEmpty
      ? itemInfo["imagePath"]
      : "market.png",
  color: itemInfo["color"] ?? Colors.transparent,
  onPressed: () {
    Provider.of<CartModel>(context,listen: false).addItemToCart(index);
  },
);
          },
        );
      } else {
        // Eğer value.shopItems null veya boşsa, bir yedek widget döndür
        return const Center(
          child: Text("No items available"),
        );
      }
    },
  ),
)
        ],
      )),
    );
  }
}