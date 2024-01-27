class Food {
  String imagePath="";
  String rating = "5.0";
  String id = "";
  String name = "";
  String price = "";

  Food({required this.id, required this.name, required this.price, required this.imagePath});

  // Named constructor for creating Food object from JSON
 factory Food.fromJson(Map<String, dynamic> json, String imagePath) {
    return Food(
      id: json["id"].toString(),
      name: json['name'],
      price: json['price'].toString(),
      imagePath: imagePath.toString(),
    );
  }

  // Named constructor for creating Food object from another Food object
  factory Food.clone(Food other) {
    return Food(
      id: other.id,
      name: other.name,
      price: other.price,
      imagePath: other.imagePath,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imagePath': imagePath,
    };
  }
}
