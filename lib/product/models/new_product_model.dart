import 'package:e_commerce_app/product/utility/base/base_firebase_model.dart';
import 'package:equatable/equatable.dart';

class ProductModel with EquatableMixin, IdModel, BaseFirebaseModel<ProductModel> {
  @override
  final String? id;
  final String? name;
  final String? content;
  final int? price;
  final String? imagePath;
  final bool isFavourite;

  ProductModel({
    this.id,
    this.name,
    this.content,
    this.price,
    this.imagePath,
    this.isFavourite = false,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    String? content,
    int? price,
    String? imagePath,
    bool? isFavourite,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      content: content ?? this.content,
      price: price ?? this.price,
      imagePath: imagePath ?? this.imagePath,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'content': content,
      'price': price,
      'imagePath': imagePath,
      'isFavourite': isFavourite,
    };
  }

  @override
  ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      content: json['content'] as String?,
      price: json['price'] as int?,
      imagePath: json['imagePath'] as String?,
      isFavourite: json['isFavourite'] as bool,
    );
  }

  @override
  List<Object?> get props => [id, name, content, price, imagePath, isFavourite];
}
