import 'package:e_commerce_app/feature/model/product_model.dart';
import 'package:e_commerce_app/product/constant/image_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel() : super(HomeStates(isLoading: false));

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}

class HomeStates extends Equatable {
  HomeStates({required this.isLoading});
  final bool isLoading;
  final List<ProductModel> productList = [
    ProductModel(
        id: 0,
        name: 'Iphone 15',
        content: 'Son model gelişmiş kamera',
        price: 50000,
        imagePath: ImageEnum.iphone_15.toPath),
    ProductModel(
        id: 1,
        name: 'Iphone 14',
        content: 'Batarya geliştirmeleri yapıldı',
        price: 40000,
        imagePath: ImageEnum.iphone_14.toPath),
    ProductModel(
        id: 2,
        name: 'Iphone 13',
        content: 'Ekran tasarımı yenilendi',
        price: 35000,
        imagePath: ImageEnum.iphone_13.toPath),
    ProductModel(
        id: 3,
        name: 'Iphone 11',
        content: 'Ana işlem birimi güncellendi ve güçlendirildi',
        price: 25000,
        imagePath: ImageEnum.iphone_11.toPath),
    ProductModel(
        id: 4,
        name: 'Iphone x',
        content: 'Parmak izi okuyucu kaldırıldı yerine face id koyuldu',
        price: 17500,
        imagePath: ImageEnum.iphone_x.toPath),
    ProductModel(
        id: 5,
        name: 'Iphone 8',
        content: 'Kompakt tasarım işlevsel kullanım',
        price: 10000,
        imagePath: ImageEnum.iphone_8.toPath),
  ];

  HomeStates copyWith({bool? isLoading}) {
    return HomeStates(isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [isLoading];
}
