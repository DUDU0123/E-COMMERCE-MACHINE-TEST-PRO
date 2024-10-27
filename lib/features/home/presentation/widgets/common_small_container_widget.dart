import 'package:flutter/material.dart';
import 'package:moboom_ecommerce_app/core/constants/colors.dart';

class CommonSmallContainerWidget extends StatelessWidget {
  const CommonSmallContainerWidget({
    super.key,
    required this.childWidget,
  });
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        border: Border.all(color: kGrey),
      ),
      child: Center(
        child: childWidget,
      ),
    );
  }
}
