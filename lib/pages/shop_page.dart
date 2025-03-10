import 'package:shoes_ecommerce_app/components/shoe_tile.dart';
import 'package:shoes_ecommerce_app/models/cart.dart';
import 'package:shoes_ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search bar
          Container(
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Search",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),

          // message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'everyone flies.. some fly longer than others',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),

          // hot picks
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  "Hot Picks 🔥",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          // products
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // create a shoe
                  // Shoe shoe = Shoe(
                  //     name: "Air Jordan",
                  //     price: "240",
                  //     description: "cool shoes",
                  //     imagePath: "lib/images/yellowwhite_sniker.png");
                  
                  // get pre-created shoes in cart.dart
                  Shoe shoe = value.getShoeList()[index];

                  // return a shoe    
                  return ShoeTile(
                    shoe: shoe,
                  );
                }),
          ),

          // bottom shop page
          const Padding(
            padding: EdgeInsets.only(top: 25.0, right: 25.0, left: 25.0),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
