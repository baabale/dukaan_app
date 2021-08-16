class ProductModel {
  late String id, name, description, image, category;
  late double price;
  late DateTime createdDate;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price']);
    description = json['description'];
    image = json['image'];
    category = json['category'];
    createdDate = DateTime.parse(json['created_date']);
  }
}
