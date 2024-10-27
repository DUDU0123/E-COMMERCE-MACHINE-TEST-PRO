import 'package:flutter/material.dart';
import 'package:moboom_ecommerce_app/config/routes/app_routes.dart';
import 'package:moboom_ecommerce_app/config/routes/app_routes_name.dart';
import 'package:moboom_ecommerce_app/core/constants/navigator_key.dart';
import 'package:moboom_ecommerce_app/core/network/connection_checker.dart';
class RootWidgetPage extends StatefulWidget {
  const RootWidgetPage({super.key});

  @override
  State<RootWidgetPage> createState() => _RootWidgetPageState();
}

class _RootWidgetPageState extends State<RootWidgetPage> {
  @override
  void initState() {
    ConnectionChecker.listenForConnectionChanges();
    super.initState();
  }

  @override
  void dispose() {
    ConnectionChecker.cancelConnectionSubscription();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutesName.homePage,
      routes: AppRoutes.routes,
    );
  }
}
