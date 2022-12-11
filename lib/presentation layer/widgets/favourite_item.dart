import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utilities/app_colours.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 253,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                "https://kddi-h.assetsadobe3.com/is/image/content/dam/au-com/mobile/mb_img_58.jpg?scl=1",
                fit: BoxFit.fill,
                height: 115,
                width: 121,
              ),
              const PositionedDirectional(
                start: 5,
                top: 3,
                child: Icon(
                  Icons.favorite_sharp,
                  color: AppColors.lightOrange,
                  size: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          Text(
            "this is description of product",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "199.00",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 18, color: AppColors.primaryColor),
              ),
              Text(
                "egp".tr(),
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 14, color: AppColors.primaryColor),
              ),
            ],
          ),
          const SizedBox(height: 9),
          Theme(
            data: ThemeData(elevatedButtonTheme: Theme.of(context).elevatedButtonTheme),
            child: ElevatedButton(
              onPressed: () {},
              child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomRight: Radius.circular(4),
                          bottomLeft: Radius.circular(4))),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "move_to_cart",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.button,
                  ).tr()),
            ),
          ),
        ],
      ),
    );
  }
}
