import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/widgets/shop_screen/product_container.dart';
import 'package:flutter_application_1/widgets/shop_screen/search_box.dart';
import 'package:flutter_application_1/widgets/shop_screen/shop_slider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.71),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Center(child: Image.asset("assets/imges/carrot.png", width: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                Text(
                  "Dhaka, Banassre",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff4C4F4D),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SearchBox(),
            const SizedBox(height: 20),
            ShopSlider(),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Exclusive Offer",
                  style: TextStyle(
                    color: Color(0xff181725),
                    fontSize: 24,
                    fontWeight: FontWeight(600),
                  ),
                ),
                const SizedBox(width: 135),
                Text(
                  "See all",
                  style: TextStyle(
                    color: Color(0xff53B175),
                    fontSize: 16,
                    fontWeight: FontWeight(600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            SizedBox(
              height: 270,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProductContainer(
                    pro: products[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 10);
                },
                itemCount: products.length,
              ),
            ),

            SizedBox(height: 35),
            Row(
              children: [
                Text(
                  "Best selling",
                  style: TextStyle(
                    color: Color(0xff181725),
                    fontSize: 24,
                    fontWeight: FontWeight(600),
                  ),
                ),
                const SizedBox(width: 175),
                Text(
                  "See all",
                  style: TextStyle(
                    color: Color(0xff53B175),
                    fontSize: 16,
                    fontWeight: FontWeight(600),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
                        SizedBox(
              height: 270,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProductContainer(
                    pro: bestproducts[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 10);
                },
                itemCount: bestproducts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


List<ProductModel> products = [
  ProductModel(
    image: "assets/imges/apple.png",
    titel: "Red Apple",
    des: "1kg, Priceg",
    price: 7.99,
  ),
  ProductModel(
    image: "assets/imges/zan.png",
    titel: "Ginger root",
    des: "1kg, Priceg",
    price: 9.99,
  ),
  ProductModel(
    image: "assets/imges/red.png",
    titel: "Red capsicums",
    des: "1kg, Priceg",
    price: 2.99,
  ),
  ProductModel(
    image: "assets/imges/banana.png",
    titel: "Organic Bananas",
    des: "7pcs, Priceg",
    price: 6.99,
  ),
];
List<ProductModel> bestproducts = [
  ProductModel(
    image: "assets/imges/BroilerCheicken.png",
    titel: "Broiler Cheicken",
    des: "1kg, Priceg",
    price: 19.99,
  ),
  ProductModel(
    image: "assets/imges/BeefBone.png",
    titel: "Beef Bone",
    des: "1kg, Priceg",
    price: 14.99,
  ),

];
