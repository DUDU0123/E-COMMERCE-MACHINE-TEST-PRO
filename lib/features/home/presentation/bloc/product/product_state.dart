part of 'product_bloc.dart';

class ProductState extends Equatable {
  final List<ProductEntity>? productsList;
  final bool isSearchFieldEmpty;
  final String? currentCategory;
  const ProductState({
    this.productsList,
    this.isSearchFieldEmpty = false,
    this.currentCategory,
  });

  ProductState copyWith({
    List<ProductEntity>? productsList,
    bool? isSearchFieldEmpty,
    String? currentCategory,
  }) {
    return ProductState(
      productsList: productsList ?? productsList,
      isSearchFieldEmpty: isSearchFieldEmpty ?? this.isSearchFieldEmpty,
      currentCategory: currentCategory ?? this.currentCategory,
    );
  }

  @override
  List<Object> get props => [
        productsList ?? [],
        isSearchFieldEmpty,
        currentCategory ?? '',
      ];
}

final class ProductInitial extends ProductState {
}

class ProductLoadingState extends ProductState {}

class ProductErrorState extends ProductState {
  final String message;
  const ProductErrorState({
    required this.message,
  });
  @override
  List<Object> get props => [
        message,
      ];
}
