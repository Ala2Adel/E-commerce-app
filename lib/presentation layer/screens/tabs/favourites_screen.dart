import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/favourite_item.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 18),
        child: Column(
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
                itemExtent: 424,
                itemBuilder: (BuildContext context, int index) {
                  return const FavouriteItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
