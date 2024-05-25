import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/model/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Consumer<CartModel>(builder: (context, value, child) {
        return Column(
        children:[
          Expanded(child:  ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: value.cartItems.length,
            itemBuilder:(context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200]
                ),
                child: ListTile(
                  leading: Image.asset(value.cartItems[index]["imagePath"],height: 15,),
                  title: Text(value.cartItems[index]["name"]),
                  subtitle: Text("\$"+value.cartItems[index]["price"]),
                  trailing: IconButton(onPressed: () => Provider.of<CartModel>(context,listen: false).removeItemToCart(value.cartItems[index]), icon: Icon(Icons.cancel))
                ),
              ),
            );
          }, )),
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8)
              ),
              padding:const  EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Price",
                      style: TextStyle(color: Colors.green[100]),),
                       Text("\$"+value.calculateTotal(),
                      style:const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ) ,)
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green.shade100),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    padding: const EdgeInsets.all(12),
                    child:const Row(
                      children: [
                        Text("Pay Now",
                        style: TextStyle(color: Colors.white),),
                        Icon(Icons.arrow_forward_ios_rounded,size: 14,color: Colors.white,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ] ,
      );
      },)
    );
  }
}