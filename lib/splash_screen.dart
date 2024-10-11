import 'package:basketball_training/core/Theming/Font.dart';
import 'package:basketball_training/core/image.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'core/Routing/Routes.dart';

class SplashView extends StatefulWidget {
  SplashView._intarnal();
  static final SplashView _instance = SplashView._intarnal();
  factory SplashView() => _instance;
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void initState() {
    super.initState();
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      return Navigator.pushReplacementNamed(
        context,
        Routes.onBordingRoute,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeInUp(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  ImageAssets.myLogo,
                ),
              ),
              Text(
                "BasketBall Training",
                style: getBoldItalicTextStyle(
                  context: context,
                  fontSize: 35,
                  color: Colors.orange,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
