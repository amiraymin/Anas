import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';

const _green = Color(0xff53B175);
const _ink = Color(0xff181725);
const _muted = Color(0xff7C7C7C);
const _line = Color(0xffE2E2E2);

final beverageProducts = <ProductModel>[
  ProductModel(image: 'assets/imges/can2.png', titel: 'Diet Coke', des: '355ml, Price', price: 1.99),
  ProductModel(image: 'assets/imges/can1.png', titel: 'Sprite Can', des: '325ml, Price', price: 1.50),
  ProductModel(image: 'assets/imges/applejuse.png', titel: 'Apple & Grape Juice', des: '2L, Price', price: 15.99),
  ProductModel(image: 'assets/imges/orangejuse.png', titel: 'Orange Juice', des: '2L, Price', price: 15.99),
  ProductModel(image: 'assets/imges/cocacola.png', titel: 'Coca Cola Can', des: '325ml, Price', price: 4.99),
  ProductModel(image: 'assets/imges/pepsi.png', titel: 'Pepsi Can', des: '330ml, Price', price: 4.99),
];

final searchProducts = <ProductModel>[
  ProductModel(image: 'assets/imges/egg.png', titel: 'Egg Chicken Red', des: '4pcs, Price', price: 1.99),
  ProductModel(image: 'assets/imges/white egg.png', titel: 'Egg Chicken White', des: '180g, Price', price: 1.50),
  ProductModel(image: 'assets/imges/eggpasta.png', titel: 'Egg Pasta', des: '30gm, Price', price: 15.99),
  ProductModel(image: 'assets/imges/eggnodels.png', titel: 'Egg Noodles', des: '2L, Price', price: 15.99),
  ProductModel(image: 'assets/imges/eggless.png', titel: 'Mayonnaise Eggless', des: '30gm, Price', price: 8.99),
  ProductModel(image: 'assets/imges/eggnodels2.png', titel: 'Egg Noodles', des: '2L, Price', price: 15.99),
];

class BeveragesScreen extends StatelessWidget {
  const BeveragesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 64,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                    ),
                  ),
                  const Text('Beverages', style: TextStyle(color: _ink, fontSize: 18, fontWeight: FontWeight.w700)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: _FilterButton(onPressed: () => _openFilters(context)),
                  ),
                ],
              ),
            ),
            Expanded(child: _ProductGrid(products: beverageProducts)),
          ],
        ),
      ),
      bottomNavigationBar: const _CatalogNavigation(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final products = searchProducts
        .where((product) => product.titel.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: TextField(
                        onChanged: (value) => setState(() => query = value),
                        decoration: InputDecoration(
                          hintText: 'Egg',
                          hintStyle: const TextStyle(color: _muted, fontSize: 14),
                          prefixIcon: const Icon(Icons.search, size: 21, color: _ink),
                          filled: true,
                          fillColor: const Color(0xffF2F3F2),
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 13),
                  _FilterButton(onPressed: () => _openFilters(context)),
                ],
              ),
            ),
            Expanded(child: _ProductGrid(products: products)),
          ],
        ),
      ),
      bottomNavigationBar: const _CatalogNavigation(),
    );
  }
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final selected = <String>{'Eggs', 'Coca Cola'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 64,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: _ink),
                    ),
                  ),
                  const Text('Filters', style: TextStyle(color: _ink, fontSize: 18, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 22, 24, 18),
                decoration: const BoxDecoration(
                  color: Color(0xffF2F3F2),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Categories', style: TextStyle(color: _ink, fontSize: 17, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 12),
                    ...['Eggs', 'Noodles & Pasta', 'Chips & Crisps', 'Fast Food'].map(_filterChoice),
                    const SizedBox(height: 15),
                    const Text('Brand', style: TextStyle(color: _ink, fontSize: 17, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 12),
                    ...['Individual Collection', 'Coca Cola', 'Ifood', 'Kazi Farms'].map(_filterChoice),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _green,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        ),
                        child: const Text('Apply Filter', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterChoice(String label) {
    final isSelected = selected.contains(label);
    return InkWell(
      onTap: () => setState(() => isSelected ? selected.remove(label) : selected.add(label)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Container(
              width: 17,
              height: 17,
              decoration: BoxDecoration(
                color: isSelected ? _green : Colors.transparent,
                border: Border.all(color: isSelected ? _green : const Color(0xffB1B1B1)),
                borderRadius: BorderRadius.circular(5),
              ),
              child: isSelected ? const Icon(Icons.check, size: 13, color: Colors.white) : null,
            ),
            const SizedBox(width: 9),
            Text(label, style: TextStyle(color: isSelected ? _green : _ink, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}

class _ProductGrid extends StatelessWidget {
  const _ProductGrid({required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(child: Text('No products found', style: TextStyle(color: _muted)));
    }
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .73,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
      ),
      itemBuilder: (context, index) => _CatalogCard(product: products[index]),
    );
  }
}

class _CatalogCard extends StatelessWidget {
  const _CatalogCard({required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: _line),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Center(child: Image.asset(product.image, fit: BoxFit.contain))),
          const SizedBox(height: 7),
          Text(product.titel, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: _ink, fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 3),
          Text(product.des, style: const TextStyle(color: _muted, fontSize: 12)),
          const SizedBox(height: 9),
          Row(
            children: [
              Expanded(child: Text('\$${product.price.toStringAsFixed(2)}', style: const TextStyle(color: _ink, fontSize: 15, fontWeight: FontWeight.w600))),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(color: _green, borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.add, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(border: Border.all(color: _ink), borderRadius: BorderRadius.circular(14)),
        child: const Icon(Icons.tune, size: 20, color: _ink),
      ),
    );
  }
}

class _CatalogNavigation extends StatelessWidget {
  const _CatalogNavigation();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      selectedItemColor: _green,
      unselectedItemColor: _ink,
      selectedLabelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
      unselectedLabelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.storefront_outlined), label: 'Shop'),
        BottomNavigationBarItem(icon: Icon(Icons.manage_search_rounded), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favourite'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined), label: 'Account'),
      ],
    );
  }
}

void _openFilters(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FiltersScreen()));
}
