import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utilities/app_colours.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Widget? suffixIcon;
  final bool isObscure;

  const CustomFormField({
    Key? key,
    required this.label,
    required this.controller,
    this.suffixIcon,
    this.isObscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyText1,
        ).tr(),
        const SizedBox(height: 12),
        Theme(
            data: ThemeData(inputDecorationTheme: Theme.of(context).inputDecorationTheme),
            child: TextFormField(
              controller: controller,
              cursorHeight: 21,
              cursorWidth: 1,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: AppColors.primaryColor, fontSize: 14),
              obscureText: isObscure,
              validator: (value) {
                if (value!.isEmpty) {
                  return "req_field".tr();
                }
                return null;
              },
              decoration: InputDecoration(
                isDense: true,
                suffixIconConstraints: const BoxConstraints(minHeight: 40, minWidth: 40),
                suffixIcon: suffixIcon,
              ),
            ))
      ],
    );
  }
}
