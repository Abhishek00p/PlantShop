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

  PlantModel({
    required this.id,
    this.name,
    this.price,
    this.quantityInStock,
    this.category,
  });

  factory PlantModel.fromJson(Map<String, dynamic> json) => PlantModel(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        quantityInStock: json["quantityInStock"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "quantityInStock": quantityInStock,
        "category": category,
      };
}
