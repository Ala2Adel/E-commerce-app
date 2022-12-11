import 'package:e_commerce_app/screens/tabs/categories_screen.dart';
import 'package:e_commerce_app/screens/tabs/favourites_screen.dart';
import 'package:e_commerce_app/screens/tabs/main_screen.dart';
import 'package:e_commerce_app/screens/tabs/profile_screen.dart';
import 'package:e_commerce_app/screens/tabs/shopping_cart_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tabs_provider.dart';
import '../utilities/app_colours.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> with SingleTickerProviderStateMixin {
  final List<Widget> _children = [
    const MainScreen(),
    const CategoriesScreen(),
    const ShoppingCartScreen(),
    const FavouritesScreen(),
    const ProfileScreen()
  ];
  TabController? controller;

  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int currIndex = Provider.of<TabsProvider>(context, listen: false).currentIndex;
    return Scaffold(
      extendBody: true,
      //drawer: AppDrawer(tabController: controller),
      drawer: const Drawer(width: 230, backgroundColor: AppColors.lightGrey),
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(currIndex == 1 || currIndex == 2 || currIndex == 3 ? 56 : 34),
        child: Selector<TabsProvider, int>(
          selector: (context, provider) => provider.currentIndex,
          builder: (context, index, child) {
            return Theme(
              data: ThemeData(appBarTheme: Theme.of(context).appBarTheme),
              child: Padding(
                padding: const EdgeInsets.only(top: 11),
                child: AppBar(
                  automaticallyImplyLeading: false,
                  titleSpacing: 0,
                  elevation: index == 1 || index == 2 || index == 3 ? null : 0,
                  backgroundColor: index == 1 || index == 2 || index == 3
                      ? AppColors.white
                      : AppColors.lightGrey,
                  toolbarOpacity: 0.7,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu, color: AppColors.darkGrey, size: 22),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                      index == 0
                          ? Text(
                              "main",
                              style: Theme.of(context).textTheme.bodyText1,
                            ).tr()
                          : index == 1
                              ? Text(
                                  "categories",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ).tr()
                              : index == 2
                                  ? Text(
                                      "shop_cart",
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ).tr()
                                  : index == 3
                                      ? Text(
                                          "fav",
                                          style: Theme.of(context).textTheme.bodyText1,
                                        ).tr()
                                      : Text(
                                          "profile",
                                          style: Theme.of(context).textTheme.bodyText1,
                                        ).tr(),
                      index == 1 || index == 2 || index == 3
                          ? IconButton(
                              icon: const Icon(Icons.search, color: AppColors.darkGrey, size: 22),
                              onPressed: () {},
                            )
                          : const SizedBox(
                              width: 25,
                            ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        notchMargin: 5,
        elevation: 12,
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(),
          StadiumBorder(),
        ),
        child: Container(
          height: 56,
          decoration: const BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(color: AppColors.darkGrey, spreadRadius: 2, blurRadius: 7),
            ],
          ),
          child: TabBar(
            onTap: (val) {
              Provider.of<TabsProvider>(context, listen: false).updateCurrentIndex(val);
            },
            controller: controller,
            indicatorColor: AppColors.white,
            labelStyle: Theme.of(context).tabBarTheme.labelStyle,
            unselectedLabelStyle: Theme.of(context).tabBarTheme.unselectedLabelStyle,
            labelColor: Theme.of(context).tabBarTheme.labelColor,
            unselectedLabelColor: Theme.of(context).tabBarTheme.unselectedLabelColor,
            tabs: [
              Tab(
                  text: "main".tr(),
                  icon: const Icon(
                    Icons.home,
                  )),
              Tab(
                  text: "sections".tr(),
                  icon: const Icon(
                    Icons.category,
                  )),
              const Tab(
                  text: "",
                  icon: Icon(
                    Icons.shopping_cart,
                  )),
              Tab(
                  text: "fav".tr(),
                  icon: const Icon(
                    Icons.favorite,
                  )),
              Tab(
                  text: "profile".tr(),
                  icon: const Icon(
                    Icons.person_sharp,
                  )),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 56,
        width: 56,
        decoration: const BoxDecoration(color: AppColors.lightOrange, shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
            Text('352', style: Theme.of(context).textTheme.subtitle2),
            const Icon(
              Icons.shopping_cart,
              color: AppColors.white,
              size: 22,
            )
          ]),
        ),
      ),
      body: Selector<TabsProvider, int>(
        selector: (context, provider) => provider.currentIndex,
        builder: (context, index, child) {
          return _children[index];
        },
      ),
    );
  }
}
