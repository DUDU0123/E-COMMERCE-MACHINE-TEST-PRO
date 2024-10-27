import 'package:moboom_ecommerce_app/core/constants/constants.dart';

class CommonFunctions {
  static String? normalizeToSlug({required String input}) {
    String normalizedInput =
        input.trim().toLowerCase().replaceAll(RegExp(r'\s+'), '-');
    for (var slug in Constants.validSlugs) {
      if (slug == normalizedInput) {
        return slug;
      }
    }
    return null;
  }
}
