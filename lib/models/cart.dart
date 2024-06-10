import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  //list of product
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Nike Dynamic',
      price: '359',
      image: 'images/nike_dynamic.png',
      description: "Men's Road Running Shoes (Extra Wide)",
    ),
    Shoe(
      name: 'Nike One',
      price: '259',
      image: 'images/nike_one.png',
      description: "Custom Men's Road Running Shoes",
    ),
    Shoe(
        name: 'Nike Air Force',
        price: '599',
        image: 'images/nike_airforce.png',
        description:
            "Classic, original, remastered. Ready to hit the streets with sophistication."),
    Shoe(
      name: 'Nike Air Max',
      price: '529',
      image: 'images/nike_airmax.png',
      description: "Older Kid's Shoes",
    ),
  ];

  //list of item user cart
  List<Shoe> userCart = [];

  //get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //get user cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add items to cart
  void addItemtoCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove items from cart
  void removbeItemfromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
