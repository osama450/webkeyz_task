class ProductModel {
  int? id;
  String? name;
  String? price;
  String? discount;
  String? image;
  String? description;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.discount,
    this.image,
    this.description,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discount = json['discount'];
    image = json['image'];
    description = json['description'];
  }
}
