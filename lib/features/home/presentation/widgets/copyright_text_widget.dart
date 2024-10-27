import 'package:flutter/material.dart';
import 'package:moboom_ecommerce_app/core/common_widgets/text_widget_common.dart';
import 'package:moboom_ecommerce_app/core/constants/colors.dart';

class CopyRightText extends StatelessWidget {
  const CopyRightText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextWidgetCommon(
      text: "\u00A92010-2022 All Rights Reserved",
      textColor: kGrey,
      fontWeight: FontWeight.w500,
      textAlign: TextAlign.center,
      fontSize: 14,
    );
  }
}
