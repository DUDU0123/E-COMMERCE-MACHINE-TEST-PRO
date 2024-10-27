part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetAllProducts extends ProductEvent {}

class GetAllProductByCategoryEvent extends ProductEvent {
  final String category;
  final String categoryName;
  const GetAllProductByCategoryEvent({
    required this.category,
    required this.categoryName,
  });
  @override
  List<Object> get props => [
        category,categoryName
      ];
}

class GetCurrentCategory extends ProductEvent {
  final String categoryName;
  const GetCurrentCategory({
    required this.categoryName,
  });
  @override
  List<Object> get props => [categoryName,];
}

class GetAllProductByQueryEvent extends ProductEvent {
  final String query;
  const GetAllProductByQueryEvent({
    required this.query,
  });
  @override
  List<Object> get props => [
        query,
      ];
}

class SearchEvent extends ProductEvent {
  final String val;
  const SearchEvent({
    required this.val,
  });
  @override
  List<Object> get props => [val];
}
