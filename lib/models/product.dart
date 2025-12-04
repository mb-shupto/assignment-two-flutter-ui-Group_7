class Product{
  final String id;
  final String name;
  final int quantity;
  final String category;
  final String? imageUrl;

  Product(
  {
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
    this.imageUrl,
}
);

  factory Product.fromMap(String id, Map<String, dynamic> map){
    return Product(
      id: id,
      name: map['name'],
      quantity: map['quantity'],
      category: map['category'],
      imageUrl: map['imageUrl'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'quantity': quantity,
      'category': category,
      'imageUrl': imageUrl,
    };
  }
}