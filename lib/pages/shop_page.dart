import 'package:ecommerce/components/book_tile.dart';
import 'package:ecommerce/models/book.dart';
import 'package:ecommerce/models/cart.dart';
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
          //search bar
          Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Search", style: TextStyle(color: Colors.grey[600])),
                  Icon(Icons.search, color: Colors.black),
                ],
              ),
            ),
          ),

          //hot picks
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hot Picks 🌶️",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("See all", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),

          //book tiles
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                //get a  book from the list
                Book book = value.getBooksList()[index];

                //return the book
                return BookTile(book: book);
              },
            ),
          ),
        ],
      ),
    );
  }
}
