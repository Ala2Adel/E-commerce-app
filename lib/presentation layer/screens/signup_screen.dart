import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../utilities/app_colours.dart';
import '../../utilities/constants.dart';
import '../widgets/custom_form_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _userName = TextEditingController(text: "");
  late final TextEditingController _email = TextEditingController(text: "");
  late final TextEditingController _firstName = TextEditingController(text: "");
  late final TextEditingController _lastName = TextEditingController(text: "");
  late final TextEditingController _password = TextEditingController(text: "");
  late final TextEditingController _confirmPassword = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const SizedBox(height: 54),
              Image.asset("assets/images/signup.png", width: 128, height: 96),
              const SizedBox(height: 38),
              Text(
                "new_account",
                style: Theme.of(context).textTheme.headline4,
              ).tr(),
              const SizedBox(height: 13),
              Text(
                "info_sign_up",
                style: Theme.of(context).textTheme.bodyText1,
              ).tr(),
              const SizedBox(height: 48),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      controller: _userName,
                      label: 'user_name',
                      suffixIcon: const SizedBox(),
                    ),
                    const SizedBox(height: 16),
                    CustomFormField(
                      controller: _email,
                      label: 'email',
                      suffixIcon: const SizedBox(),
                    ),
                    const SizedBox(height: 16),
                    CustomFormField(
                      controller: _firstName,
                      label: 'first_name',
                      suffixIcon: const SizedBox(),
                    ),
                    const SizedBox(height: 16),
                    CustomFormField(
                      controller: _lastName,
                      label: 'last_name',
                      suffixIcon: const SizedBox(),
                    ),
                    const SizedBox(height: 16),
                    Selector<AuthProvider, bool>(
                        selector: (context, provider) => provider.passVisible,
                        builder: (context, passVisible, child) {
                          return CustomFormField(
                            controller: _password,
                            label: 'password',
                            isObscure: !passVisible,
                            suffixIcon: InkWell(
                              onTap: () {
                                Provider.of<AuthProvider>(context, listen: false)
                                    .updatePassVisible(!passVisible);
                              },
                              child: Icon(
                                passVisible
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                                color: AppColors.black,
                                size: 22,
                              ),
                            ),
                          );
                        }),
                    const SizedBox(height: 16),
                    Selector<AuthProvider, bool>(
                        selector: (context, provider) => provider.confirmPassVisible,
                        builder: (context, passVisible, child) {
                          return CustomFormField(
                            controller: _confirmPassword,
                            label: 'password',
                            isObscure: !passVisible,
                            suffixIcon: InkWell(
                              onTap: () {
                                Provider.of<AuthProvider>(context, listen: false)
                                    .updateConfirmPassVisible(!passVisible);
                              },
                              child: Icon(
                                passVisible
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                                color: AppColors.black,
                                size: 22,
                              ),
                            ),
                          );
                        }),
                    const SizedBox(height: 22),
                    Theme(
                      data: ThemeData(elevatedButtonTheme: Theme.of(context).elevatedButtonTheme),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Constants.tabsScreen);
                        },
                        child: Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            )),
                            child: Text(
                              "register",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.button,
                            ).tr()),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "has_account",
                          style: Theme.of(context).textTheme.bodyText1,
                        ).tr(),
                        const SizedBox(width: 11),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Constants.loginScreen);
                          },
                          child: Text(
                            "login",
                            style: Theme.of(context).textTheme.headline4!.copyWith(
                                decoration: TextDecoration.underline,
                                color: Colors.transparent,
                                shadows: [
                                  const Shadow(offset: Offset(0, -2), color: AppColors.lightOrange)
                                ],
                                decorationStyle: TextDecorationStyle.solid,
                                decorationColor: AppColors.lightOrange,
                                decorationThickness: 6),
                          ).tr(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void signup() {
    _formKey.currentState!.validate() ? null : _formKey.currentState!.save();
  }
}
