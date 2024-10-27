import 'package:flutter/material.dart';
import 'package:moboom_ecommerce_app/core/constants/colors.dart';

TextSpan commonText() {
  return const TextSpan(
    text: "M",
    style: TextStyle(
      color: Color.fromARGB(255, 253, 20, 98),
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget appBarTitle() {
  return RichText(
    text: TextSpan(
      style: const TextStyle(
        color: kBlack,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      children: [
        commonText(),
        const TextSpan(
          text: "oBoo",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        commonText(),
      ],
    ),
  );
}