import 'package:ecommerce/models/book.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  //list of books, all books
  List<Book> bookShop = [
    Book(name: "Dune", price: "999", imagePath: "lib/images/dune.jpg"),
    Book(
      name: "Dune Messiah",
      price: "1200",
      imagePath: "lib/images/messiah.jpg",
    ),
    Book(
      name: "Children of Dune",
      price: "1340",
      imagePath: "lib/images/children.jpg",
    ),
    Book(
      name: "God Emperor of Dune",
      price: "1500",
      imagePath: "lib/images/god.jpg",
    ),
    Book(
      name: "Heretics of Dune",
      price: "1500",
      imagePath: "lib/images/heretics.jpg",
    ),
    Book(
      name: "Chapterhouse: Dune",
      price: "1700",
      imagePath: "lib/images/chapterhouse.jpeg",
    ),
  ];

  //list of items in users cart with quantitites
  Map<Book, int> userCart = {};

  //get list of books for sale
  List<Book> getBooksList() {
    return bookShop;
  }

  //get cart
  Map<Book, int> getUserCart() {
    return userCart;
  }

  //add items to cart
  void addItemToCart(Book book) {
    if (userCart.containsKey(book)) {
      userCart[book] = userCart[book]! + 1;
    } else {
      userCart[book] = 1;
    }
    notifyListeners();
  }

  //remove item from cart or remove one quantity
  void removeItemFromCart(Book book) {
    if (!userCart.containsKey(book)) return;
    if (userCart[book]! > 1) {
      userCart[book] = userCart[book]! - 1;
    } else {
      userCart.remove(book);
    }
    notifyListeners();
  }

  //total price
  double getTotalPrice() {
    double total = 0;
    userCart.forEach((book, qty) {
      total += double.parse(book.price) * qty;
    });
    return total;
  }

  //clear cart
  void clearCart() {
    userCart.clear();
    notifyListeners();
  }
}
