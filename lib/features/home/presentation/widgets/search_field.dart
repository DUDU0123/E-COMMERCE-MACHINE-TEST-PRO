import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moboom_ecommerce_app/core/common_widgets/text_field_widget_common.dart';
import 'package:moboom_ecommerce_app/core/constants/colors.dart';
import 'package:moboom_ecommerce_app/core/constants/height_width.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/bloc/product/product_bloc.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/utils/common_box_shadow.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          commonBoxShadow(),
        ],
      ),
      width: screenWidth(context: context),
      child: Row(
        children: [
          Expanded(
            child: TextFieldCommon(
              onChanged: (val) {
                context.read<ProductBloc>().add(
                      SearchEvent(val: val.trim()),
                    );
              },
              hintStyle: TextStyle(
                color: kGrey.withOpacity(0.8),
                fontSize: 13,
                fontWeight: FontWeight.normal,
              ),
              hintText: "What do you want to buy today?",
              cursorColor: kGrey.withOpacity(0.8),
              border: InputBorder.none,
              textAlign: TextAlign.start,
              controller: searchController,
            ),
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  if (!state.isSearchFieldEmpty) {
                    searchController.clear();
                    context.read<ProductBloc>().add(const SearchEvent(val: ""));
                  }
                },
                icon: Icon(
                  state.isSearchFieldEmpty ? Icons.search : Icons.close,
                  size: 28,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
