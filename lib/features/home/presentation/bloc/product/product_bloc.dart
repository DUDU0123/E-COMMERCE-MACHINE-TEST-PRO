import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:moboom_ecommerce_app/features/home/domain/entities/product_entity.dart';
import 'package:moboom_ecommerce_app/features/home/domain/usecase/get_all_products_usecase.dart';
import 'package:moboom_ecommerce_app/features/home/domain/usecase/get_products_by_category_usecase.dart';
import 'package:moboom_ecommerce_app/features/home/domain/usecase/get_products_by_query_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProductsUsecase _getAllProductsUsecase;
  final GetProductsByCategoryUsecase _getProductsByCategoryUsecase;
  final GetProductsByQueryUsecase _getProductsByQueryUsecase;
  ProductBloc({
    required GetAllProductsUsecase getAllProductsUsecase,
    required GetProductsByCategoryUsecase getProductsByCategoryUsecase,
    required GetProductsByQueryUsecase getProductsByQueryUsecase,
  })  : _getAllProductsUsecase = getAllProductsUsecase,
        _getProductsByCategoryUsecase = getProductsByCategoryUsecase,
        _getProductsByQueryUsecase = getProductsByQueryUsecase,
        super(ProductInitial()) {
    on<GetAllProducts>(getAllProducts);
    on<GetAllProductByQueryEvent>(getAllProductByQueryEvery);
    on<GetAllProductByCategoryEvent>(getAllProductByCategoryEvent);
    on<SearchEvent>(searchEvent);
  }
  FutureOr<void> getAllProducts(
      GetAllProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    try {
      final res = await _getAllProductsUsecase(params: null);
      res.fold(
        (failure) {
          emit(ProductErrorState(message: failure.message));
        },
        (productList) {
          emit(state.copyWith(
              productsList: productList, isSearchFieldEmpty: true));
        },
      );
    } catch (e) {
      emit(ProductErrorState(message: e.toString()));
    }
  }

  Future<void> getAllProductByQueryEvery(
      GetAllProductByQueryEvent event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoadingState());
      final res = await _getProductsByQueryUsecase(params: event.query);

      res.fold(
        (failure) {
          emit(ProductErrorState(message: failure.message));
        },
        (productList) {
          emit(state.copyWith(
            productsList: productList.isNotEmpty? productList:state.productsList,
          ));
        },
      );
    } catch (e) {
      emit(ProductErrorState(message: e.toString()));
    }
  }

  Future<void> getAllProductByCategoryEvent(
      GetAllProductByCategoryEvent event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoadingState());
      final res = await _getProductsByCategoryUsecase(params: event.category);
      res.fold(
        (failure) {
          emit(ProductErrorState(message: failure.message));
        },
        (productList) {
          emit(state.copyWith(
            productsList: productList,
            currentCategory: event.categoryName,
            isSearchFieldEmpty: true,
          ));
        },
      );
    } catch (e) {
      emit(ProductErrorState(message: e.toString()));
    }
  }

  FutureOr<void> searchEvent(SearchEvent event, Emitter<ProductState> emit) {
    try {
      if (event.val.isNotEmpty) {
        add(GetAllProductByQueryEvent(query: event.val));
      } else {
        add(GetAllProducts());
      }
    } catch (e) {
      emit(ProductErrorState(message: e.toString()));
    }
  }
}
