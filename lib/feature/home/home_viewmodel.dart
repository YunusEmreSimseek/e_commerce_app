import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel() : super(const HomeStates(isLoading: false));

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}

class HomeStates extends Equatable {
  const HomeStates({required this.isLoading});
  final bool isLoading;

  HomeStates copyWith({bool? isLoading}) {
    return HomeStates(isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [isLoading];
}
