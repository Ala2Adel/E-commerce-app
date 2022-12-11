import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/app_colours.dart';
import '../../../data layer/providers/main_provider.dart';
import '../../widgets/product_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List imageSliders = [
    'assets/images/slider_img1.png',
    'assets/images/slider_img2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  color: AppColors.darkGrey.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(27)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.search, color: AppColors.darkGrey, size: 18),
                      const SizedBox(width: 7),
                      Text(
                        "search_for",
                        style: Theme.of(context).textTheme.subtitle1,
                      ).tr(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.33),
            Selector<MainProvider, int>(
                selector: (context, provider) => provider.currentIndex,
                builder: (context, index, child) {
                  return Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 140.74,
                          autoPlay: true,
                          viewportFraction: 1,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, _) =>
                              Provider.of<MainProvider>(context, listen: false)
                                  .updateCurrentIndex(index),
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration: const Duration(milliseconds: 300),
                          autoPlayCurve: Curves.easeOut,
                        ),
                        items: [for (var item in imageSliders) Image.asset(item)],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imageSliders.map(
                          (image) {
                            return Container(
                              width: 13,
                              height: 3,
                              margin: const EdgeInsets.symmetric(vertical: 18.9, horizontal: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: const BorderRadius.all(Radius.circular(3)),
                                color: index == imageSliders.indexOf(image)
                                    ? AppColors.primaryColor
                                    : AppColors.darkGrey.withOpacity(0.4),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  );
                }),
            // const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16),
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(56),
                            child: Container(
                              width: 56,
                              height: 56,
                              color: AppColors.darkGrey,
                              child: Image.network(
                                "https://www.91-cdn.com/hub/wp-content/uploads/2021/12/moto-edge-x30-specs-feat-2-696x365.jpg",
                                fit: BoxFit.fill,
                              ),
                              // decoration: const BoxDecoration(    borderRadius: BorderRadius.all(const Radius.circular(56)),),
                            ),
                          ),
                        ),
                        // const SizedBox(height: 7),
                        // Text(
                        //   "clothes",
                        //   style: Theme.of(context).textTheme.subtitle1,
                        // )
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "new_arrival",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w600),
                  ).tr(),
                  Text(
                    "view_all",
                    style: Theme.of(context).textTheme.subtitle1,
                  ).tr()
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 205,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: ProductWidget(),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "most_pop",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w600),
                  ).tr(),
                  Text(
                    "view_all",
                    style: Theme.of(context).textTheme.subtitle1,
                  ).tr()
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 205,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: ProductWidget(),
                  );
                },
              ),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
