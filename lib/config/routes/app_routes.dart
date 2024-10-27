import 'package:flutter/material.dart';
import 'package:moboom_ecommerce_app/config/routes/app_routes_name.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/pages/home_page.dart';
class AppRoutes{
 static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutesName.homePage : (context)=> const HomePage(),
  };
}