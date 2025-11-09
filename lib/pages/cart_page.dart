import 'package:ecommerce/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool showSuccess = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void showCheckoutAnimation() async {
    setState(() {
      showSuccess = true;
    });
    _controller.forward();
    await Future.delayed(const Duration(seconds: 2));
    _controller.reverse();
    setState(() {
      showSuccess = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        final cartItems = value.getUserCart();

        return Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                title: const Text(
                  "Your Cart",
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.transparent,
              ),
              body: cartItems.isEmpty
                  ? const Center(
                      child: Text(
                        "Your cart is empty.",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: cartItems.entries.map((entry) {
                              final book = entry.key;
                              final qty = entry.value;
                              return Card(
                                color: Colors.orange.shade100,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                child: ListTile(
                                  leading: Image.asset(
                                    book.imagePath,
                                    width: 50,
                                  ),
                                  title: Text(
                                    book.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text("Rs. ${book.price}"),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.remove_circle_outline,
                                        ),
                                        onPressed: () =>
                                            value.removeItemFromCart(book),
                                      ),
                                      Text(
                                        "$qty",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.add_circle_outline,
                                        ),
                                        onPressed: () =>
                                            value.addItemToCart(book),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                        //total section
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Total: ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    "Rs. ${value.getTotalPrice().toStringAsFixed(2)}",
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 15,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onPressed: cartItems.isEmpty
                                    ? null
                                    : () {
                                        showCheckoutAnimation();
                                        value.clearCart();
                                      },
                                child: const Text(
                                  "Checkout",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),

            //success anim overlay
            if (showSuccess)
              Center(
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check_circle, size: 80, color: Colors.white),
                        SizedBox(height: 10),
                        Text(
                          "Checkout Successfull",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
