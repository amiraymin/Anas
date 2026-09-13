class CartItemModel {
  final String image;
  final String title;
  final String des;
  final double price;
  int quantity;

  CartItemModel({
    required this.image,
    required this.title,
    required this.des,
    required this.price,
    this.quantity = 1, // starts at 1 by default
  });
}