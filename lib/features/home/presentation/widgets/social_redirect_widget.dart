import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moboom_ecommerce_app/core/common_widgets/text_widget_common.dart';
import 'package:moboom_ecommerce_app/core/constants/colors.dart';
import 'package:moboom_ecommerce_app/core/constants/constants.dart';
import 'package:moboom_ecommerce_app/core/constants/height_width.dart';

class SocialRedirectWidget extends StatelessWidget {
  const SocialRedirectWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // first
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonSmallText(text: "SOCIALS"),
            kHeight5,
            Row(
              children: Constants.socialIcons.map((iconPath){
                return SvgPicture.asset(iconPath, height: 20,);
              }).toList(),
            ),
          ],
        ),
        // second

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            commonSmallText(text: "PLATFORMS"),
             kHeight5,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: Constants.dowloadPlaformIcons.map((iconPath){
                return SvgPicture.asset(iconPath, height: 20,);
              }).toList(),
            )
          ],
        ),
      ],
    );
  }
}
Widget commonSmallText({required String text}) {
  return TextWidgetCommon(
    text: text,
    textColor: kBlack,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
}


