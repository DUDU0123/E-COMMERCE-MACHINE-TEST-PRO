import 'package:flutter/material.dart';
import 'package:moboom_ecommerce_app/core/common_widgets/text_widget_common.dart';
import 'package:moboom_ecommerce_app/core/constants/colors.dart';
import 'package:moboom_ecommerce_app/core/constants/constants.dart';

class SiteLinksListWidget extends StatelessWidget {
  const SiteLinksListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 15,
      children: Constants.siteLinks.map((link) {
        return TextWidgetCommon(
          text: link,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          textColor: kGrey,
        );
      }).toList(),
    );
  }
}
