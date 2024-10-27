import 'package:flutter/material.dart';
import 'package:moboom_ecommerce_app/core/common_widgets/shimmer_widget.dart';

Widget buildShimmer(){
  return ShimmerWidget.rectangular(height: 100, shapeBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  ),);
}