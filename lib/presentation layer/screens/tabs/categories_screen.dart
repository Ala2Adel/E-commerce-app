import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data layer/providers/main_provider.dart';
import '../../../domain layer/category_model.dart';

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
            child: Selector<MainProvider, List<CategoryModel>>(
                shouldRebuild: (previous, next) => true,
                selector: (context, provider) => provider.categories,
                builder: (context, catg, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: catg.length,
                    scrollDirection: Axis.vertical,
                    // itemExtent: 122,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: SizedBox(
                                  height: 122,
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    catg[index].imageLink!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            PositionedDirectional(
                              top: 40,
                              start: 150,
                              child: Center(
                                child: Text(
                                  catg[index].name,
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
