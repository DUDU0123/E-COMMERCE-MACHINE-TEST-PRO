import 'package:flutter/material.dart';
import 'package:moboom_ecommerce_app/core/constants/colors.dart';

class SubscribeMessageShowWidget extends StatelessWidget {
  const SubscribeMessageShowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        style: TextStyle(
          color: kGrey,
          fontSize: 12,
        ),
        children: [
          TextSpan(
            text:
                "By clicking the SUBSCRIBE  button, you are agreeing to our\n",
          ),
          TextSpan(
            text: "Privacy & Cookie Policy",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kBlue,
            ),
          ),
        ],
      ),
    );
  }
}