import 'package:flutter/material.dart';
import 'package:moboom_ecommerce_app/features/home/domain/entities/product_entity.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/widgets/product_shimmer.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/widgets/product_small_card.dart';

class CommonGridView extends StatelessWidget {
  const CommonGridView({
    super.key,
    this.productList,
    this.isShimmer = false,
  });

  final List<ProductEntity>? productList;
  final bool isShimmer;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: !isShimmer ? productList?.length : 20,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: isShimmer?0.7:0.5,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return !isShimmer
            ? ProductSmallCard(
                product: productList![index],
              )
            : buildShimmer();
      },
    );
  }
}