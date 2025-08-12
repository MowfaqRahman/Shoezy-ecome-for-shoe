class WishlistItem {
  final int id;
  final String imagePath;
  final String name;
  final double price;
  final bool isFavorite;

  WishlistItem({
    required this.id,
    required this.imagePath,
    this.name = 'Product Name',
    this.price = 0.0,
    this.isFavorite = true,
  });
}

