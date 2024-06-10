import 'package:ecommerence_nike/models/shoe.dart';
import 'package:flutter/material.dart';

class shoeTile extends StatelessWidget {
  void Function()? onTap;
  Shoe shoe;
  shoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //image

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              shoe.image,
            ),
          ),

          //description + details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              shoe.description,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          //price
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //shoe name
                    Text(
                      shoe.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //shoe price
                    Text(
                      '\$' + shoe.price,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
          //button add
        ],
      ),
    );
  }
}
