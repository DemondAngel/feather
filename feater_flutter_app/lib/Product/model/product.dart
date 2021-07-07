import 'package:feater_flutter_app/Users/model/user.dart';

class Product{

  String? id;
  String? name;
  String? description;
  int? price;
  dynamic image;
  String? slug;
  List<dynamic>? subcategory;
  List<dynamic>? category;
  dynamic status;
  int? priceSell;
  int? quantity;
  String? priceMajor;
  List<User>? productors;

  Product({this.id, this.name, this.description, this.price, this.image, this.slug, this.subcategory, this.status, this.priceSell,
    this.quantity, this.priceMajor, this.productors, this.category});

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'] ?? '',
      name: json['nombre'] ?? '',
      description:json['descripcion'] ?? '',
      price: json['precio'] ?? 0.0,
      image: json['imagen'] ?? null,
      slug: json['slug'] ?? '',
      subcategory:  json['subcategorias'],
      category: json['categorias'] ?? null,
      productors: json['productores'] != null ?
      List<User>.generate(json['productores'].length, (index) => User.fromJson(json['productores'][index]))
          : [],
      status: json['status'] ?? null,
      priceSell: json['precioVenta'] ?? 0,
      priceMajor: json['precioMayoreo'] ?? '',
      quantity: json['cantidad'] ?? 0,

    );
  }

}