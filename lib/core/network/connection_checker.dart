import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:moboom_ecommerce_app/core/constants/navigator_key.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moboom_ecommerce_app/core/utils/message_show_helper.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/bloc/product/product_bloc.dart';

class ConnectionChecker{
  static StreamSubscription<List<ConnectivityResult>>? _subscription;
  static checkConnection()async{
    List<ConnectivityResult> connectionStatus =await Connectivity().checkConnectivity();
    if (connectionStatus.contains(ConnectivityResult.none)) {
      networkErrorShowSnackbar();
    }
  }

  static void listenForConnectionChanges() {
    _subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> connectionStatus) {
      if (connectionStatus.contains(ConnectivityResult.none)) {
        networkErrorShowSnackbar();
      } else {
        // call the event that you want for fetch data
        navigatorKey.currentContext?.read<ProductBloc>().add(GetAllProducts());
      }
    });
  }

  static void cancelConnectionSubscription() {
    _subscription?.cancel();
  }



  static void networkErrorShowSnackbar({String? message,}){
    MessageShowhelper.showSnackbar(snackBarContent: message??"Please check your network connection");
  }
}