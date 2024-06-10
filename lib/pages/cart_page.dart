import 'package:ecommerence_nike/component/cart_item.dart';
import 'package:ecommerence_nike/models/cart.dart';
import 'package:ecommerence_nike/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //heading
            Text(
              'My Cart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 20,
            ),

            //item
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  //get individual shoe
                  Shoe individualShoe = value.getUserCart()[index];

                  //return cart item
                  return CartItem(
                    shoe: individualShoe,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
