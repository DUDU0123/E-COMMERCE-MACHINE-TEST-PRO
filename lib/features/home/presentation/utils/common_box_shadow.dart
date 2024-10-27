import 'package:flutter/material.dart';
import 'package:moboom_ecommerce_app/core/constants/colors.dart';

BoxShadow commonBoxShadow() {
  return BoxShadow(
    blurRadius: 3,
    spreadRadius: 3,
    offset: const Offset(2, 2),
    color: kGrey.withOpacity(0.5),
  );
}
