import 'package:flutter/material.dart';
import 'package:moboom_ecommerce_app/core/constants/colors.dart';
import 'package:moboom_ecommerce_app/core/constants/height_width.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/widgets/appbar_title.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/widgets/banner_container_widget.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/widgets/category_select_widget.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/widgets/copyright_text_widget.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/widgets/next_page_navigate_widget.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/widgets/product_listing_widget.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/widgets/search_field.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/widgets/signup_text.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/widgets/site_links_list_widget.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/widgets/social_redirect_widget.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/widgets/subscribe_button.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/widgets/subscribe_email_fill_field.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/widgets/subscribe_message_show_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.sort_outlined,
          color: kBlack,
          size: 30,
        ),
        centerTitle: true,
        title: appBarTitle(),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kHeight15,
            SearchField(),
            kHeight15,
            CategorySelectWidget(),
            kHeight15,
            BannerContainerWidget(),
            ProductsListingWidget(),
            kHeight30,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NextPageNavigateWidget(),
                  kHeight30,
                  SocialRedirectWidget(),
                  kHeight20,
                  SignUpText(),
                  kHeight10,
                  SubScribeEmailFillField(),
                  kHeight10,
                  SubScribeButton(),
                  kHeight15,
                  SubscribeMessageShowWidget(),
                  kHeight40,
                  CopyRightText(),
                  kHeight40,
                  SiteLinksListWidget(),
                  kHeight20,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

