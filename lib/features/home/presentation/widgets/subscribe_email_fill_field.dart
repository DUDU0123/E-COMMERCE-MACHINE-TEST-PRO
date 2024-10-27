import 'package:flutter/material.dart';
import 'package:moboom_ecommerce_app/core/common_widgets/text_field_widget_common.dart';
import 'package:moboom_ecommerce_app/core/constants/colors.dart';

class SubScribeEmailFillField extends StatelessWidget {
  const SubScribeEmailFillField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: kWhite,
        boxShadow: [
          BoxShadow(
            color: kBlack,
            blurRadius: 1,
            spreadRadius: 0,
            offset: Offset(0, 0),
          ),
          BoxShadow(
            color: kWhite,
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(3, -3),
          ),
        ],
      ),
      child: const TextFieldCommon(
        keyboardType: TextInputType.emailAddress,
        cursorColor: kGrey,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.normal,
        ),
        textAlign: TextAlign.start,
        border: InputBorder.none,
        hintText: "Your email",
        hintStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
