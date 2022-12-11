import 'package:e_commerce_app/common/app_colours.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: 8,
              scrollDirection: Axis.vertical,
              itemExtent: 122,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 122,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(4)),
                            color: AppColors.black.withOpacity(0.1),
                          ),
                          child: Image.network(
                            "https://cyclingmagazine.ca/wp-content/uploads/2021/01/zwift_devices-1200x675.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      PositionedDirectional(
                        top: 30,
                        bottom: 30,
                        start: 70,
                        end: 70,
                        child: Text(
                          "category_name",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
