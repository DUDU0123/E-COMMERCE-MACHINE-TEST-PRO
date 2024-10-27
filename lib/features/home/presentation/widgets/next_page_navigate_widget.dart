import 'package:flutter/material.dart';
import 'package:moboom_ecommerce_app/core/common_widgets/text_widget_common.dart';
import 'package:moboom_ecommerce_app/core/constants/colors.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/widgets/common_small_container_widget.dart';

class NextPageNavigateWidget extends StatelessWidget {
  const NextPageNavigateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CommonSmallContainerWidget(
          childWidget: Icon(
            Icons.arrow_back_ios_rounded,
            color: kBlack,
          ),
        ),
        CommonSmallContainerWidget(
          childWidget: nextNumberTextWidget(text: "1"),
        ),
        CommonSmallContainerWidget(
          childWidget: nextNumberTextWidget(text: "2"),
        ),
        CommonSmallContainerWidget(
          childWidget: nextNumberTextWidget(text: "..."),
        ),
        CommonSmallContainerWidget(
          childWidget: nextNumberTextWidget(text: "13"),
        ),
        const CommonSmallContainerWidget(
          childWidget: Icon(
            Icons.arrow_forward_ios_rounded,
            color: kBlack,
          ),
        ),
      ],
    );
  }
}

Widget nextNumberTextWidget({
  required String text,
}) =>
    TextWidgetCommon(
      text: text,
      textColor: kGrey,
      fontSize: 20,
    );
