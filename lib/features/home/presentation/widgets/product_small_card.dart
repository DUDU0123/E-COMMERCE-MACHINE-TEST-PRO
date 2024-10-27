import 'package:flutter/material.dart';
import 'package:moboom_ecommerce_app/core/common_widgets/text_widget_common.dart';
import 'package:moboom_ecommerce_app/core/constants/colors.dart';
import 'package:moboom_ecommerce_app/features/home/domain/entities/product_entity.dart';
import 'package:moboom_ecommerce_app/features/home/presentation/utils/common_box_shadow.dart';

class ProductSmallCard extends StatelessWidget {
  const ProductSmallCard({
    super.key,
    required this.product,
  });
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          commonBoxShadow(),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 190,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 65, 69, 65),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product.images!.first,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: kGrey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(4)),
                      child: const Center(
                        child: Icon(
                          Icons.favorite_border,
                          color: kWhite,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidgetCommon(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: product.title ?? 'No name',
                    fontSize: 16,
                    textColor: kBlack,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidgetCommon(
                    maxLines: 2,
                    text: product.description ?? 'No description',
                    fontSize: 13,
                    overflow: TextOverflow.ellipsis,
                    textColor: kGrey,
                  ),
                  TextWidgetCommon(
                    text: "\$${product.price}",
                    fontSize: 17,
                    textColor: kBlack,
                    fontWeight: FontWeight.bold,
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < product.rating!
                            ? Icons.star
                            : Icons.star_outline,
                        color: index < product.rating! ? kAmber : kGrey,
                        size: 13,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
