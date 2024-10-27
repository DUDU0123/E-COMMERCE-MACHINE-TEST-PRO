import 'package:flutter/material.dart';
import 'package:moboom_ecommerce_app/core/common_widgets/text_widget_common.dart';
import 'package:moboom_ecommerce_app/core/constants/colors.dart';
import 'package:moboom_ecommerce_app/core/constants/height_width.dart';

class BannerContainerWidget extends StatelessWidget {
  const BannerContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: screenWidth(context: context),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromARGB(255, 88, 61, 51),
            Color.fromARGB(255, 158, 58, 51),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidgetCommon(
            text: "Title Text",
            textColor: kWhite,
            fontWeight: FontWeight.bold,
          ),
          kHeight10,
          RichText(
            text: const TextSpan(
              style: TextStyle(
                color: kWhite,
                fontSize: 14,
              ),
              children: [
                TextSpan(
                  text:
                      "Slash Sales begins in April. Get up to 80%\nDiscount on all products ",
                ),
                TextSpan(
                  text: "Read More",
                  style: TextStyle(fontWeight: FontWeight.bold, color: kWhite),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
