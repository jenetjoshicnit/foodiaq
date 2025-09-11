import 'package:flutter/material.dart';
import 'package:foodiq/core/features/Checkoutpage1/Checkoutpage1_view.dart';

void main() {
  runApp(const CartPageApp());
}

class CartPageApp extends StatelessWidget {
  const CartPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cart Page',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Inter'),
      home: const CartPage(),
    );
  }
}

class CartItem {
  final String name;
  final String image;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> items = [
    CartItem(
      name: "Spaghetti Rigatoni",
      image: "assets/noodles.jpg",
      price: 20,
    ),
    CartItem(
      name: "Peppered Stew",
      image: "assets/stew.jpg",
      price: 60,
      quantity: 5,
    ),
  ];

  double deliveryCharges = 7;
  double discount = 3;
  double sgst = 4;
  double cgst = 0.01;

  @override
  Widget build(BuildContext context) {
    double subtotal = items.fold(
      0,
      (previousValue, element) =>
          previousValue + element.price * element.quantity,
    );
    double grandTotal = subtotal + deliveryCharges - discount + sgst + cgst;

    return Scaffold(
      backgroundColor: Colors.green.shade300,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 600;
            return Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 24),
                      const Text(
                        "Cart",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.close),
                        color: Colors.white,
                        iconSize: 28,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Items",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final item = items[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      item.image,
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(Icons.remove),
                                                onPressed: () {
                                                  setState(() {
                                                    if (item.quantity > 1)
                                                      item.quantity--;
                                                  });
                                                },
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                    ),
                                                child: Text(
                                                  item.quantity.toString(),
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.add),
                                                onPressed: () {
                                                  setState(() {
                                                    item.quantity++;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Rs ${item.price * item.quantity}",
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              items.removeAt(index);
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 16),

                          // Coupon
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Available Coupons",
                                style: TextStyle(color: Colors.green.shade700),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Purchase Summary (Right-aligned)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Purchase Total Rs $subtotal",
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text("Delivery Charges Rs $deliveryCharges"),
                              Text("Discounted Rs $discount"),
                              Text("SGST Rs $sgst"),
                              Text("CGST Rs $cgst"),
                              const Divider(height: 24, thickness: 1),
                              Text(
                                "Grand Total Rs ${grandTotal.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Checkout Button
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 60,
                                  vertical: 14,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CheckoutPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Checkout",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.person_outline),
              Icon(Icons.home_outlined),
              Icon(Icons.shopping_cart_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
