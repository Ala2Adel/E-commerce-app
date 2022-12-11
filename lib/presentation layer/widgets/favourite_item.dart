import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../common/app_colours.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 17),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          height: 253,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/assortment-of-colorful-ripe-tropical-fruits-top-royalty-free-image-995518546-1564092355.jpg",
                    fit: BoxFit.fill,
                    height: 253,
                    // width: 121,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 11),
                child: Text(
                  "قلادة نسائية مطلية بالذهب على شكل شكل إنفينيتي مرصعة بالتوباز الأبيض من ديفاز دايموند",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "199.00",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 18, color: AppColors.primaryColor),
                    ),
                    SizedBox(width: 7),
                    Text(
                      "egp".tr(),
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontSize: 14, color: AppColors.primaryColor),
                    ),
                  ],
                ),
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
        ),
      ),
    );
  }
}
