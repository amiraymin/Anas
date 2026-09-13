import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart_item.dart';
import 'package:flutter_application_1/screens/main_screens/checkout_screens.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  static const _green = Color(0xff53B175);
  static const _ink = Color(0xff181725);
  static const _muted = Color(0xff7C7C7C);
  static const _line = Color(0xffE2E2E2);

  final List<CartItemModel> cartItems = [
    CartItemModel(image: 'assets/imges/red.png', title: 'Bell Pepper Red', des: '1kg, Price', price: 4.99),
    CartItemModel(image: 'assets/imges/egg.png', title: 'Egg Chicken Red', des: '4pcs, Price', price: 1.99),
    CartItemModel(image: 'assets/imges/banana.png', title: 'Organic Bananas', des: '12kg, Price', price: 3.00),
    CartItemModel(image: 'assets/imges/zan.png', title: 'Ginger', des: '250gm, Price', price: 2.99),
  ];

  double get totalPrice => cartItems.fold<double>(
        0,
        (total, item) => total + (item.price * item.quantity),
      );

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
                'My Cart',
                style: TextStyle(color: _ink, fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const Divider(height: 1, thickness: 1, color: _line),
          Expanded(
            child: cartItems.isEmpty
                ? const Center(
                    child: Text('Your cart is empty', style: TextStyle(color: _muted, fontSize: 16)),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    itemCount: cartItems.length,
                    separatorBuilder: (_, __) => const Divider(height: 1, thickness: 1, color: _line),
                    itemBuilder: (context, index) => _CartRow(
                      item: cartItems[index],
                      onAdd: () => setState(() => cartItems[index].quantity++),
                      onRemoveOne: () => setState(() {
                        if (cartItems[index].quantity > 1) cartItems[index].quantity--;
                      }),
                      onDelete: () => setState(() => cartItems.removeAt(index)),
                    ),
                  ),
          ),
          if (cartItems.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(21, 12, 21, 20),
              child: SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: () => showCheckoutSheet(context, total: totalPrice),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: _green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Text('Go to Checkout', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xff489E67),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '\$${totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _CartRow extends StatelessWidget {
  const _CartRow({
    required this.item,
    required this.onAdd,
    required this.onRemoveOne,
    required this.onDelete,
  });

  final CartItemModel item;
  final VoidCallback onAdd;
  final VoidCallback onRemoveOne;
  final VoidCallback onDelete;

  static const _ink = Color(0xff181725);
  static const _muted = Color(0xff7C7C7C);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133,
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: Image.asset(item.image, height: 76, fit: BoxFit.contain),
          ),
          const SizedBox(width: 1),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: _ink, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 3),
                  Text(item.des, style: const TextStyle(color: _muted, fontSize: 14)),
                  const Spacer(),
                  Row(
                    children: [
                      _QuantityButton(icon: Icons.remove, onTap: onRemoveOne),
                      const SizedBox(width: 15),
                      Text('${item.quantity}', style: const TextStyle(color: _ink, fontSize: 16, fontWeight: FontWeight.w500)),
                      const SizedBox(width: 15),
                      _QuantityButton(icon: Icons.add, onTap: onAdd),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 50,
            child: Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: onDelete,
                    borderRadius: BorderRadius.circular(20),
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.close, color: Color(0xffB3B3B3), size: 24),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                    style: const TextStyle(color: _ink, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isAdd = icon == Icons.add;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 40,
        width: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffE2E2E2)),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(
          icon,
          size: isAdd ? 23 : 22,
          color: isAdd ? const Color(0xff53B175) : const Color(0xffB3B3B3),
        ),
      ),
    );
  }
}
