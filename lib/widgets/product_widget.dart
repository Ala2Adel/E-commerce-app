import 'package:flutter/material.dart';

import '../utilities/app_colours.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 133,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  "https://www.aheadofthyme.com/wp-content/uploads/2021/07/chicken-shawarma-2-683x1024.jpg",
                  fit: BoxFit.fill,
                  height: 115,
                  width: 121,
                ),
                const PositionedDirectional(
                  start: 5,
                  top: 3,
                  child: Icon(
                    Icons.favorite_border,
                    color: AppColors.darkGrey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 9),
            Text(
              "this is description of product",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 11),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "199.00" + "ج.م",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.w600, color: AppColors.primaryColor),
                ), const SizedBox(height: 12),
                const Icon(
                  Icons.add_shopping_cart,
                  color: AppColors.black,
                  size: 20.8,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
