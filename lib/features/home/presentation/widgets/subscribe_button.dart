import 'package:flutter/material.dart';
import 'package:moboom_ecommerce_app/core/common_widgets/text_widget_common.dart';
import 'package:moboom_ecommerce_app/core/constants/colors.dart';
import 'package:moboom_ecommerce_app/core/constants/height_width.dart';

class SubScribeButton extends StatelessWidget {
  const SubScribeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      width: screenWidth(context: context),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 20, 22, 44),
      ),
      child: const TextWidgetCommon(
        text: "SUBSCRIBE",
        textColor: kWhite,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    );
  }
}


