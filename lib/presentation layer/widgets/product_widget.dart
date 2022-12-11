import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common/app_colours.dart';
import '../../data layer/providers/tabs_provider.dart';
import '../../domain layer/product_model.dart';


class ProductWidget extends StatelessWidget {
  final ProductModel product;

  const ProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //       builder: (_) => CategoriesScreen(),
        //     ));
        Provider.of<TabsProvider>(context, listen: false).updateCurrentIndex(2);
        debugPrint("in product widget");
      },
      child: Container(
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
                    product.imageLink!,
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
              Expanded(
                child: Text(
                  product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              const SizedBox(height: 11),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${product.price} ${"egp".tr()}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.w600, color: AppColors.primaryColor),
                    ),
                    const SizedBox(height: 12),
                    const Icon(
                      Icons.add_shopping_cart,
                      color: AppColors.black,
                      size: 20.8,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
