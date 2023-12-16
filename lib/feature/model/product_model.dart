import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  const ProductModel(
      {required this.id, required this.name, required this.content, required this.price, required this.imagePath});

  final int id;
  final String name;
  final String content;
  final int price;
  final String imagePath;

  ProductModel copyWith({
    int? id,
    String? name,
    String? content,
    int? price,
    String? imagePath,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      content: content ?? this.content,
      price: price ?? this.price,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
