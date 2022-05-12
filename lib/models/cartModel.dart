class Cast {
  final String name;

  final String price;
  final String image;

  Cast(this.name, this.price, this.image);
  factory Cast.fromMap(Map<String, dynamic> json) {
    return Cast(
      json['name'],
      json['price'],
      json['image'],
    );
  }
}
