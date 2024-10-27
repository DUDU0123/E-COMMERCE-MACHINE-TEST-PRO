import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moboom_ecommerce_app/core/api/api_endpoints.dart';
import 'package:moboom_ecommerce_app/core/exceptions/exceptions.dart';
import 'package:moboom_ecommerce_app/core/utils/common_functions.dart';

import 'package:moboom_ecommerce_app/features/home/data/model/product_model.dart';

abstract interface class ProductData {
  Future<List<ProductModel>> getAllProducts();
  Future<List<ProductModel>> getProductsByQuery({required String query});
  Future<List<ProductModel>> getProductsByCategory({required String category});
}

class ProductDataImpl implements ProductData {
  final http.Client client;
  ProductDataImpl({
    required this.client,
  });
  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final http.Response response =
          await client.get(Uri.parse(ApiEndpoints.allProducts));
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body)['products'] as List;
        return decodedData.map((data) {
          return ProductModel.fromJson(data);
        }).toList();
      } else {
        throw ServerException(message: "Unable to fetch products");
      }
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getProductsByQuery({required String query}) async {
    try {
      final http.Response response = await client.get(
        Uri.parse(
          ApiEndpoints.getProductBySearch(query: query),
        ),
      );
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body)['products'] as List;
        return decodedData.map((data) {
          return ProductModel.fromJson(data);
        }).toList();
      } else {
        return getProductsByCategory(category: query);
      }
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(
      {required String category}) async {
    String? normalized = CommonFunctions.normalizeToSlug(input: category);
    try {
      final http.Response response = await client.get(
        Uri.parse(
          normalized != null
              ? ApiEndpoints.getProductByCategoryName(category: normalized)
              : ApiEndpoints.allProducts,
        ),
      );
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body)['products'] as List;
        return decodedData.map((data) {
          return ProductModel.fromJson(data);
        }).toList();
      } else {
        throw ServerException(message: "Unable to fetch products");
      }
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
