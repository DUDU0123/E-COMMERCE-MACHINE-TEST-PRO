import 'package:flutter/material.dart';
import 'package:moboom_ecommerce_app/core/common_widgets/text_widget_common.dart';
import 'package:moboom_ecommerce_app/core/constants/colors.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        TextWidgetCommon(
          text: "SIGN UP",
          textColor: kBlack,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ],
    );
  }
}