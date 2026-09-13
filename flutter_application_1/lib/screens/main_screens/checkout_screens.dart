import 'package:flutter/material.dart';

const _green = Color(0xff53B175);
const _ink = Color(0xff181725);
const _muted = Color(0xff7C7C7C);
const _line = Color(0xffE2E2E2);

Future<void> showCheckoutSheet(BuildContext context, {required double total}) async {
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (sheetContext) => CheckoutSheet(
      total: total,
      onPlaceOrder: () {
        Navigator.of(sheetContext).pop();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const OrderAcceptedScreen()),
        );
      },
    ),
  );
}

class CheckoutSheet extends StatelessWidget {
  const CheckoutSheet({super.key, required this.total, required this.onPlaceOrder});

  final double total;
  final VoidCallback onPlaceOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * .67),
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 30),
      decoration: const BoxDecoration(
        color: Color(0xffF2F3F2),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text('Checkout', style: TextStyle(color: _ink, fontSize: 24, fontWeight: FontWeight.w700)),
              ),
              IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close, color: _ink)),
            ],
          ),
          const SizedBox(height: 18),
          _CheckoutRow(label: 'Delivery', value: 'Select Method'),
          _CheckoutRow(label: 'Payment', value: '', trailing: const _PaymentMark()),
          _CheckoutRow(label: 'Promo Code', value: 'Pick discount'),
          _CheckoutRow(label: 'Total Cost', value: '\$${total.toStringAsFixed(2)}'),
          const SizedBox(height: 16),
          const Text('By placing an order you agree to our', style: TextStyle(color: _muted, fontSize: 12)),
          const SizedBox(height: 4),
          const Text('Terms And Conditions', style: TextStyle(color: _ink, fontSize: 12, fontWeight: FontWeight.w600)),
          const SizedBox(height: 22),
          SizedBox(
            height: 58,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPlaceOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: _green,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              ),
              child: const Text('Place Order', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckoutRow extends StatelessWidget {
  const _CheckoutRow({required this.label, required this.value, this.trailing});

  final String label;
  final String value;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: _line))),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(color: _muted, fontSize: 16))),
          if (trailing != null) trailing! else Text(value, style: const TextStyle(color: _ink, fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(width: 7),
          const Icon(Icons.chevron_right, color: _ink, size: 22),
        ],
      ),
    );
  }
}

class _PaymentMark extends StatelessWidget {
  const _PaymentMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 15,
      decoration: BoxDecoration(color: const Color(0xff3478F6), borderRadius: BorderRadius.circular(2)),
      child: const Align(
        alignment: Alignment.centerRight,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Color(0xffF94144), shape: BoxShape.circle),
          child: SizedBox(width: 9, height: 9),
        ),
      ),
    );
  }
}

class OrderAcceptedScreen extends StatelessWidget {
  const OrderAcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Color(0xffF8F5FF), Color(0xffEDFFFA)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const Spacer(flex: 3),
                const _AcceptedArtwork(),
                const SizedBox(height: 54),
                const Text(
                  'Your Order has been\naccepted',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: _ink, fontSize: 26, fontWeight: FontWeight.w700, height: 1.05),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Your items has been placed and is on\nit’s way to being processed',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: _muted, fontSize: 14, height: 1.35),
                ),
                const Spacer(flex: 4),
                SizedBox(
                  height: 58,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _green,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    ),
                    child: const Text('Track Order', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                  child: const Text('Back to home', style: TextStyle(color: _ink, fontSize: 16, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AcceptedArtwork extends StatelessWidget {
  const _AcceptedArtwork();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      height: 170,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(top: 8, left: 62, child: _Dot(color: _green, size: 15)),
          const Positioned(top: 20, right: 24, child: _Dot(color: Color(0xffF35B43), size: 8)),
          const Positioned(bottom: 18, left: 11, child: _Dot(color: Color(0xffF7A82D), size: 14)),
          const Positioned(bottom: 1, right: 35, child: _Dot(color: Color(0xff6D71E8), size: 15)),
          Container(
            width: 124,
            height: 124,
            decoration: BoxDecoration(
              color: _green,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 5),
              boxShadow: const [BoxShadow(color: Color(0x2253B175), blurRadius: 4, spreadRadius: 5)],
            ),
            child: const Icon(Icons.check_rounded, color: Colors.white, size: 77),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) => Container(
        height: size,
        width: size,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      );
}

Future<void> showOrderFailedDialog(BuildContext context) async {
  await showDialog<void>(
    context: context,
    builder: (_) => const OrderFailedDialog(),
  );
}

class OrderFailedDialog extends StatelessWidget {
  const OrderFailedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close, color: _ink)),
            ),
            const _FailedArtwork(),
            const SizedBox(height: 25),
            const Text('Oops! Order Failed', style: TextStyle(color: _ink, fontSize: 24, fontWeight: FontWeight.w700)),
            const SizedBox(height: 14),
            const Text('Something went tembly wrong.', style: TextStyle(color: _muted, fontSize: 14)),
            const SizedBox(height: 42),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _green,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                ),
                child: const Text('Please Try Again', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
              child: const Text('Back to home', style: TextStyle(color: _ink, fontSize: 15, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}

class _FailedArtwork extends StatelessWidget {
  const _FailedArtwork();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 150,
      decoration: const BoxDecoration(color: Color(0xffE4F8ED), shape: BoxShape.circle),
      child: const Center(
        child: Icon(Icons.shopping_bag_outlined, color: Color(0xffD3A75F), size: 104),
      ),
    );
  }
}
