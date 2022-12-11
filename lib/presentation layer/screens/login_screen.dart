import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/app_colours.dart';
import '../../common/constants.dart';
import '../../data layer/providers/auth_provider.dart';
import '../../data layer/respository/auth_repo.dart';
import '../widgets/custom_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _username = TextEditingController(text: "");
  late final TextEditingController _password = TextEditingController(text: "");

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
              Image.asset("assets/images/login.png", width: 128, height: 96),
              const SizedBox(height: 38),
              Text(
                "register_title",
                style: Theme.of(context).textTheme.headline4,
              ).tr(),
              const SizedBox(height: 13),
              Text(
                "please_sign_in",
                style: Theme.of(context).textTheme.bodyText1,
              ).tr(),
              const SizedBox(height: 48),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      controller: _username,
                      label: 'user_name',
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
                    const SizedBox(height: 22),
                    Theme(
                      data: ThemeData(elevatedButtonTheme: Theme.of(context).elevatedButtonTheme),
                      child: ElevatedButton(
                        onPressed: () => _login(context),
                        child: Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            )),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "login",
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
                          "no_account",
                          style: Theme.of(context).textTheme.bodyText1,
                        ).tr(),
                        const SizedBox(width: 11),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Constants.signUpScreen);
                          },
                          child: Text(
                            "register",
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
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      AuthRepo()
          .login(
        password: _password.text.trim(),
        username: _username.text.trim(),
      )
          .then((value) async {
        if (value != null && value.statusCode == 200) {
          _formKey.currentState!.save();
          Navigator.of(context).pushNamed(Constants.tabsScreen);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text((value.data)["detail"].toString().replaceAll("", " "),
                textAlign: TextAlign.end),
            backgroundColor: AppColors.primaryColor.withOpacity(0.5),
            duration: const Duration(seconds: 3),
          ));
        }
      });
    }
  }
}
