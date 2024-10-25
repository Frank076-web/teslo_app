import 'package:teslo_app/features/shared/shared.dart';
import 'package:teslo_app/features/products/products.dart';
import 'package:teslo_app/features/auth/infrastructure/infrastructure.dart';

class ProductsMapper {
  static Product productApiV1ResponseToEntity(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: double.parse(json['price'].toString()),
      description: json['description'],
      slug: json['slug'],
      stock: json['stock'],
      sizes: List<String>.from(json['sizes'].map((size) => size)),
      gender: json['gender'],
      tags: List<String>.from(json['tags'].map((tag) => tag)),
      images: List<String>.from(
        json['images'].map(ImagesUtils.parseImageUrl),
      ),
      user: UserMapper.userApiV1ResponseToEntity(json['user']),
    );
  }
}
