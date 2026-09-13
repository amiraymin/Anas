import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  static const _items = [
    _FavouriteItem(
      image: 'assets/imges/can1.png',
      name: 'Sprite Can',
      details: '325ml, Price',
      price: 1.50,
    ),
    _FavouriteItem(
      image: 'assets/imges/can2.png',
      name: 'Diet Coke',
      details: '355ml, Price',
      price: 1.99,
    ),
    _FavouriteItem(
      image: 'assets/imges/applejuse.png',
      name: 'Apple & Grape Juice',
      details: '2L, Price',
      price: 15.50,
    ),
    _FavouriteItem(
      image: 'assets/imges/cocacola.png',
      name: 'Coca Cola Can',
      details: '325ml, Price',
      price: 4.99,
    ),
    _FavouriteItem(
      image: 'assets/imges/pepsi.png',
      name: 'Pepsi Can',
      details: '330ml, Price',
      price: 4.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(
            height: 82,
            child: Center(
              child: Text(
                'Favourite',
                style: TextStyle(
                  color: Color(0xff181725),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xffE2E2E2)),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              itemCount: _items.length,
              separatorBuilder: (_, __) => const Divider(
                height: 1,
                thickness: 1,
                color: Color(0xffE2E2E2),
              ),
              itemBuilder: (context, index) => _FavouriteRow(item: _items[index]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(21, 12, 21, 20),
            child: SizedBox(
              height: 58,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('All favourite items added to your cart.')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xff53B175),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                ),
                child: const Text(
                  'Add All To Cart',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FavouriteRow extends StatelessWidget {
  const _FavouriteRow({required this.item});

  final _FavouriteItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 88,
        child: Row(
          children: [
            SizedBox(
              width: 54,
              child: Image.asset(item.image, height: 48, fit: BoxFit.contain),
            ),
            const SizedBox(width: 2),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xff181725),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.details,
                    style: const TextStyle(color: Color(0xff7C7C7C), fontSize: 12),
                  ),
                ],
              ),
            ),
            Text(
              '\$${item.price.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Color(0xff181725),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.chevron_right, size: 22, color: Color(0xff181725)),
          ],
        ),
      ),
    );
  }
}

class _FavouriteItem {
  const _FavouriteItem({
    required this.image,
    required this.name,
    required this.details,
    required this.price,
  });

  final String image;
  final String name;
  final String details;
  final double price;
}
