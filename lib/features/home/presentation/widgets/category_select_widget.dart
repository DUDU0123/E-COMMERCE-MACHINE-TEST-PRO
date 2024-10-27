import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moboom_ecommerce_app/core/common_widgets/text_widget_common.dart';
import 'package:moboom_ecommerce_app/core/constants/colors.dart';
import 'package:moboom_ecommerce_app/core/constants/constants.dart';
import 'package:moboom_ecommerce_app/core/constants/height_width.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/bloc/product/product_bloc.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/utils/common_box_shadow.dart';

class CategorySelectWidget extends StatelessWidget {
  const CategorySelectWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextWidgetCommon(
            text: "Select Category",
            fontWeight: FontWeight.bold,
            textColor: kGrey,
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              log(state.currentCategory.toString());
              return PopupMenuButton(
                constraints: BoxConstraints(
                  maxHeight: screenHeight(context: context)/2.5,
                ),
                position: PopupMenuPosition.under,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: kWhite,
                    boxShadow: [
                      commonBoxShadow(),
                    ],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Text(state.currentCategory ?? "Select"),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: kBlack,size: 30,
                      ),
                    ],
                  ),
                ),
                onSelected: (value) {
                  final selectedCategory = Constants.categoryList
                      .firstWhere((cat) => cat.categoryValue == value);
                  context.read<ProductBloc>().add(
                        GetAllProductByCategoryEvent(
                          category: value,
                          categoryName: selectedCategory.categoryName,
                        ),
                      );
                },
                itemBuilder: (context) {
                  return Constants.categoryList.map((category) {
                    return PopupMenuItem<String>(
                      value: category.categoryValue,
                      child: TextWidgetCommon(
                        text: category.categoryName,
                      ),
                    );
                  }).toList();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
