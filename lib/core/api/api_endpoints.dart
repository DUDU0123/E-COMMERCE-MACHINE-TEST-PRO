class ApiEndpoints {
  static const allProducts = "https://dummyjson.com/products";
  static String getProductBySearch({required String query})=>"https://dummyjson.com/products/search?q=$query";
  static String getProductByCategoryName({required String category})=>"https://dummyjson.com/products/category/$category";
}