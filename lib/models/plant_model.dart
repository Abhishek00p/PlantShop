import 'dart:convert';

PlantModel plantModelFromJson(String str) =>
    PlantModel.fromJson(json.decode(str));

String plantModelToJson(PlantModel data) => json.encode(data.toJson());

class PlantModel {
  String id;
  String? name;
  int? price;
  int? quantityInStock;
  String? category;
  int? rating;

  PlantModel({
    required this.id,
    this.name,
    this.price,
    this.quantityInStock,
    this.category,
    this.rating,
  });

  factory PlantModel.fromJson(Map<String, dynamic> json) => PlantModel(
        id: json["_id"] as String,
        name: json["name"] as String?,
        price: json["price"] as int?,
        rating: json["rating"] as int?,
        quantityInStock: json["quantityInStock"] as int?,
        category: json["category"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "rating": rating,
        "quantityInStock": quantityInStock,
        "category": category,
      };
}
