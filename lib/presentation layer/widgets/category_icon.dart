import 'package:flutter/material.dart';

import '../../common/app_colours.dart';
import '../../domain layer/category_model.dart';

class CategoryIcon extends StatelessWidget {
  final CategoryModel category;

  const CategoryIcon({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(56),
          child: Container(
            width: 56,
            height: 56,
            color: AppColors.darkGrey,
            child: Image.network(
              category.imageLink!,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(height: 7),
        Text(
          category.name,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
