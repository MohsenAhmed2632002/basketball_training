import 'package:basketball_training/core/Routing/Routes.dart';
import 'package:basketball_training/core/Theming/Font.dart';
import 'package:basketball_training/core/Widgets/Shared_Widgets.dart';
import 'package:basketball_training/core/Theming/theme.dart';
import 'package:basketball_training/features/Login/presentation/cubit/login_cubit.dart';
import 'package:basketball_training/features/Login/presentation/widgets/login_widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 20.h,
            left: 20.w,
            right: 20.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome Back",
                    style: getBoldItalicTextStyle(
                      context: context,
                      color: Colors.orangeAccent,
                      fontSize: 40,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                    style: getItalicTextStyle(
                      context: context,
                      color: MaterialTheme(context: context)
                          .darkMediumContrast()
                          .hintColor,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                MyEmailAndPassword(),
                const LoginBlocListener(),
                SizedBox(
                  height: 30.h,
                ),
                MyTextButton(
                    text: "Login",
                    onPressed: () {
                      loginValidation(context);
                    }),
                SizedBox(
                  height: 15.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    child: Text(
                      "Forgot Password",
                      style: getItalicTextStyle(
                        context: context,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Divider(
                  color: Colors.white,
                  height: 2.h,
                  thickness: 1.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "By logging, you agree to our\n",
                        ),
                        TextSpan(
                          text: "Terms & Conditions and PrivacyPolicy.",
                          style: getRegulerTextStyle(
                              context: context,
                              // fontSize: 15,

                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account yet?  ",
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.SignUpScreen);
                      },
                      child: Text(
                        "Sign Up",
                        style: getBoldItalicTextStyle(
                          context: context,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  loginValidation(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState();
    }
  }
}
