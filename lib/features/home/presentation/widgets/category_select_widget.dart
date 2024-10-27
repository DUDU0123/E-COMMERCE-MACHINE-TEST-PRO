import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moboom_ecommerce_app/core/common_widgets/text_widget_common.dart';
import 'package:moboom_ecommerce_app/core/constants/colors.dart';
import 'package:moboom_ecommerce_app/core/constants/constants.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/bloc/product/product_bloc.dart';

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
              return DropdownButton<String>(
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: kBlack,
                ),
                hint: Text(state.currentCategory ?? "Select"),
                borderRadius: BorderRadius.circular(15),
                items: Constants.categoryList.map((category) {
                  return DropdownMenuItem<String>(
                    value: category.categoryValue,
                    child: TextWidgetCommon(
                      text: category.categoryName,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                   final selectedCategory = Constants.categoryList
            .firstWhere((cat) => cat.categoryValue == value);
                  context.read<ProductBloc>().add(
                        GetAllProductByCategoryEvent(
                          category: value ?? "laptop",
                          categoryName: selectedCategory.categoryName,
                        ),
                      );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
