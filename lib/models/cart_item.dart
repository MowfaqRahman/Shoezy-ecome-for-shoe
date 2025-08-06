class CartItem {
  final String id;
  final String name;
  final double price;
  final String image;
  final String size;
  final String color;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.size,
    required this.color,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity;
}