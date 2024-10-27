import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moboom_ecommerce_app/core/service_locator/service_locator.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/bloc/product/product_bloc.dart';
import 'package:moboom_ecommerce_app/features/root_widget_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(
    BlocProvider(
      create: (context) => serviceLocator<ProductBloc>()..add(GetAllProducts()),
      child: const RootWidgetPage(),
    ),
  );
}
