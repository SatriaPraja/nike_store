import 'package:ecommerence_nike/component/shoe_tile.dart';
import 'package:ecommerence_nike/models/cart.dart';
import 'package:ecommerence_nike/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemtoCart(shoe);

    //when succes
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Succesfully add to cart!'),
        content: Text('Check your cart'),
      ),
    );
  }

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          //searchbar
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          //Message
          Padding(
            padding: const EdgeInsets.all(25),
            child: Text(
              'everyone flies.. some fly longer than others',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),

          //hot pics
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hots Picks 🔥',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'see all',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          //list of produxt to sale
          Expanded(
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                // Scroll horizontally when the user drags horizontally (mouse clicks)
                final newScrollOffset =
                    scrollController.offset - (details.delta.dx * 2);
                scrollController.jumpTo(newScrollOffset);
              },
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  Shoe shoe = value.getShoeList()[index];
                  return shoeTile(
                    onTap: () => addShoeToCart(shoe),
                    shoe: shoe,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 25,
              top: 25,
              right: 25,
            ),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
