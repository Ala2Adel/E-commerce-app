import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/app_colours.dart';
import '../../../data layer/providers/shopping_cart_provider.dart';
import '../../../domain layer/product_model.dart';

class ShoppingCartScreen extends StatefulWidget {
  final ProductModel? product;

  const ShoppingCartScreen({Key? key, this.product}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  void initState() {
    _getProdDetails(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Selector<ShoppingProvider, ProductModel>(
          shouldRebuild: (previous, next) => true,
          selector: (context, provider) => provider.product,
          builder: (context, product, child) {
            return Provider.of<ShoppingProvider>(context, listen: false).loading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                    strokeWidth: 2.5,
                  ))
                : Column(
                    children: [
                      Image.network(
                        product.imageLink!,
                        fit: BoxFit.cover,
                        height: 316,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Container(
                        height: 48,
                        color: AppColors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  color: AppColors.lightOrange,
                                  size: 22,
                                ),
                               const  SizedBox(width: 11),
                                Text(
                                  "added_fav".tr(),
                                  style:
                                      Theme.of(context).textTheme.headline4!.copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.share,
                                  color: AppColors.darkGrey,
                                  size: 22,
                                ),
                               const SizedBox(width: 11),
                                Text(
                                  "share_item".tr(),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  );
          }),
    );
  }

  void _getProdDetails(int prodId) {
    Future.delayed(Duration.zero, () async {
      ShoppingProvider provider = Provider.of<ShoppingProvider>(context, listen: false);
      provider.getProdById(prodId);
    });
  }
}
