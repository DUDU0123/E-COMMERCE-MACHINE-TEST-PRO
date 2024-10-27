class Constants {
  static List<String> categories = [
    "Fragrances",
    "Furniture",
    "Groceries",
    "Home Decoration",
    "Kitchen Accessories",
    "Laptops",
    "Mobile Accessories",
    "Motorcycle",
    "Smartphones",
    "Sports Accessories",
    "Sunglasses",
    "Tablets",
    "Tops",
    "Vehicle",
    "Womens Bags",
    "Womens Dresses",
    "Womens Jewellery",
    "Womens Shoes",
    "Mens Shoes",
    "Mens Watches",
  ];
  static List<String> siteLinks = [
    "Privacy Center",
    "privacy & Cookie Policy",
    "Manage Cookies",
    "Terms & Conditions",
    "Copyright Notice",
    "Imprint",
  ];
  static List<String> validSlugs = [
    "beauty",
    "fragrances",
    "furniture",
    "groceries",
    "home-decoration",
    "kitchen-accessories",
    "laptops",
    "mens-shirts",
    "mens-shoes",
    "mens-watches",
    "mobile-accessories",
    "motorcycle",
    "skin-care",
    "smartphones",
    "sports-accessories",
    "sunglasses",
    "tablets",
    "tops",
    "vehicle",
    "womens-bags",
    "womens-dresses",
    "womens-jewellery",
    "womens-shoes",
    "womens-watches",
  ];

  static List<String> socialIcons = [
    "assets/facebook.svg",
    "assets/twitter.svg",
    "assets/instagram.svg",
    "assets/tiktok.svg",
    "assets/snapchat.svg",
  ];

  static List<String> dowloadPlaformIcons = [
    "assets/android.svg",
    "assets/apple.svg",
  ];

// Define a map to associate slugs with display names
  static Map<String, String> slugToName = {
    "beauty": "Beauty",
    "fragrances": "Fragrances",
    "furniture": "Furniture",
    "groceries": "Groceries",
    "home-decoration": "Home Decoration",
    "kitchen-accessories": "Kitchen Accessories",
    "laptops": "Laptops",
    "mens-shirts": "Men's Shirts",
    "mens-shoes": "Men's Shoes",
    "mens-watches": "Men's Watches",
    "mobile-accessories": "Mobile Accessories",
    "motorcycle": "Motorcycle",
    "skin-care": "Skin Care",
    "smartphones": "Smartphones",
    "sports-accessories": "Sports Accessories",
    "sunglasses": "Sunglasses",
    "tablets": "Tablets",
    "tops": "Tops",
    "vehicle": "Vehicle",
    "womens-bags": "Women's Bags",
    "womens-dresses": "Women's Dresses",
    "womens-jewellery": "Women's Jewellery",
    "womens-shoes": "Women's Shoes",
    "womens-watches": "Women's Watches",
  };

  static List<Category> categoryList =
      List.generate(Constants.validSlugs.length, (index) {
    String slug = Constants.validSlugs[index];
    String displayName = Constants.slugToName[slug] ?? slug;
    return Category(
      categoryName: displayName,
      categoryValue: slug,
    );
  });
}

class Category {
  final String categoryName;
  final String categoryValue;

  Category({required this.categoryName, required this.categoryValue});
}
