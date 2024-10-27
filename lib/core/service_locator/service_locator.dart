import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:moboom_ecommerce_app/features/home/data/data_source/product_data.dart';
import 'package:moboom_ecommerce_app/features/home/data/repository/product_repo/product_repository_impl.dart';
import 'package:moboom_ecommerce_app/features/home/domain/repository/product_repository/product_repository.dart';
import 'package:moboom_ecommerce_app/features/home/domain/usecase/get_all_products_usecase.dart';
import 'package:moboom_ecommerce_app/features/home/domain/usecase/get_products_by_category_usecase.dart';
import 'package:moboom_ecommerce_app/features/home/domain/usecase/get_products_by_query_usecase.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/bloc/product/product_bloc.dart';

GetIt serviceLocator = GetIt.instance;

initDependencies() {
  serviceLocator.registerFactory<http.Client>(
    () => http.Client(),
  );
  initProductDependencies();
}

initProductDependencies() {
  serviceLocator
    ..registerFactory<ProductData>(
      () => ProductDataImpl(
        client: serviceLocator<http.Client>(),
      ),
    )
    ..registerFactory<ProductRepository>(
      () => ProductRepositoryImpl(
        productData: serviceLocator<ProductData>(),
      ),
    )
    ..registerFactory<GetAllProductsUsecase>(
      () => GetAllProductsUsecase(
        productRepository: serviceLocator<ProductRepository>(),
      ),
    )
    ..registerFactory<GetProductsByCategoryUsecase>(
      () => GetProductsByCategoryUsecase(
        productRepository: serviceLocator<ProductRepository>(),
      ),
    )
    ..registerFactory<GetProductsByQueryUsecase>(
      () => GetProductsByQueryUsecase(
        productRepository: serviceLocator<ProductRepository>(),
      ),
    )
    ..registerLazySingleton<ProductBloc>(
      () => ProductBloc(
        getAllProductsUsecase: serviceLocator<GetAllProductsUsecase>(),
        getProductsByCategoryUsecase:
            serviceLocator<GetProductsByCategoryUsecase>(),
        getProductsByQueryUsecase: serviceLocator<GetProductsByQueryUsecase>(),
      ),
    );
}
