import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moboom_ecommerce_app/core/utils/message_show_helper.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/bloc/product/product_bloc.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/widgets/common_gridview.dart';

class ProductsListingWidget extends StatelessWidget {
  const ProductsListingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductErrorState) {
          MessageShowhelper.showSnackbar(snackBarContent: state.message);
        }
      },
      builder: (context, state) {
        if (state is ProductLoadingState || state.productsList == null) {
          return const CommonGridView(
            isShimmer: true,
          );
        }
        if (state.productsList!.isEmpty) {
         return const CommonGridView(
            isShimmer: true,
          );
        }
        return CommonGridView(
          productList: state.productsList,
          isShimmer: false,
        );
      },
    );
  }
}
