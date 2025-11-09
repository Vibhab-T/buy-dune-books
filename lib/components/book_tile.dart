import 'package:ecommerce/models/book.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookTile extends StatelessWidget {
  final Book book;
  const BookTile({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, bottom: 25),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          //fized size book picture
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: SizedBox(
              height: 300, //fixed height
              width: double.infinity, //fill
              child: Image.asset(book.imagePath, fit: BoxFit.contain),
            ),
          ),

          Container(
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: Colors.black,
            ),
          ),

          //name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              book.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),

          //price + add to cart
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rs. ${book.price}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Container(
                  child: IconButton(
                    onPressed: () {
                      Provider.of<Cart>(
                        context,
                        listen: false,
                      ).addItemToCart(book);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${book.name} added to cart!")),
                      );
                    },
                    icon: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
