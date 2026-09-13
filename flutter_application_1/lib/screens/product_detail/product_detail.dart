import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel pro;
  const ProductDetailScreen({super.key, required this.pro});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1; // starts at 1, since you can't order 0 items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top bar: back arrow + share icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.ios_share),
                    ),
                  ],
                ),

                // product image
                Center(
                  child: Image.asset(
                    widget.pro.image,
                    height: 220,
                  ),
                ),
                const SizedBox(height: 20),

                // title + favorite heart
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.pro.titel,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff181725),
                      ),
                    ),
                    const Icon(Icons.favorite_border),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  widget.pro.des,
                  style: const TextStyle(color: Color(0xff7C7C7C), fontSize: 14),
                ),
                const SizedBox(height: 16),

                // quantity counter + price row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _quantityButton(
                          icon: Icons.remove,
                          onTap: () {
                            setState(() {
                              if (quantity > 1) {
                                quantity--; // never let it go below 1
                              }
                            });
                          },
                        ),
                        const SizedBox(width: 16),
                        Text(
                          "$quantity",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 16),
                        _quantityButton(
                          icon: Icons.add,
                          onTap: () {
                            setState(() {
                              quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                    Text(
                      "\$${(widget.pro.price * quantity).toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff181725),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Product Detail expandable-looking row (kept simple, no real expand logic yet)
                _infoRow("Product Detail"),
                const Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 16),
                  child: Text(
                    "Apples are nutritious. Apples may be good for weight loss. "
                    "Apples may be good for your heart, as part of a healthful and varied diet.",
                    style: TextStyle(color: Color(0xff7C7C7C), fontSize: 14),
                  ),
                ),
                Divider(color: Colors.grey[300]),

                _infoRow("Nutritions"),
                Divider(color: Colors.grey[300]),

                _infoRow("Review", trailing: const Text("⭐⭐⭐⭐⭐")),
                Divider(color: Colors.grey[300]),

                const SizedBox(height: 20),

                // Add to Basket button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // logic to actually add to cart comes later
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff53B175),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Add To Basket",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // small reusable helper widget for the +/- buttons
  Widget _quantityButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: const Color(0xffF2F3F2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 18, color: const Color(0xff181725)),
      ),
    );
  }

  // small reusable helper widget for each info row (Product Detail / Nutritions / Review)
  Widget _infoRow(String title, {Widget? trailing}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        trailing ?? const Icon(Icons.keyboard_arrow_down),
      ],
    );
  }
}