
import 'package:shamo/models/category_model.dart';
import 'package:shamo/models/gallery_model.dart';

class ProductModel{
  //Proferti
  int? id;
  String? name;
  double? price;
  String? description;
  String? tags;
  CatagoryModel? category;
  DateTime? createdAt;
  DateTime? updateAt;
  List<GalleryModel>? galleries;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.category,
    this.createdAt,
    this.updateAt,
    this.galleries,
    });

    ProductModel.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      name = json['name'];
      price = double.parse(json['price'].toString());
      description = json['description'];
      tags = json['tags'];
      category = CatagoryModel.fromJson(json['category']);
      galleries = json['galleries']
            .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
            .toList();
      createdAt = DateTime.parse(json['created_at']);
      updateAt = DateTime.parse(json['update_at']);
    }

   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category?.toJson(),
      'galleries': galleries?.map((gallery) => gallery.toJson()).toList(),
      'createdAt': createdAt.toString(),
      'updatedAt': updateAt.toString(),
    };
  }
}