import 'package:animate_do/animate_do.dart';
import 'package:basketball_training/core/Routing/Routes.dart';
import 'package:basketball_training/core/Theming/Font.dart';
import 'package:basketball_training/core/Widgets/Shared_Widgets.dart';
import 'package:basketball_training/core/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.challenge),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: 20.h, bottom: 20.h, left: 20.w, right: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeInDown(
                  child: Text(
                    "Success in basketball\n isn’t about the points you score\n it’s about the heart and hustle you put into every play.",
                    style: getBoldTextStyle(
                        context: context, fontSize: 20, color: Colors.orange),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FadeInUpBig(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.loginRoute,
                          );
                        },
                        child: Text(
                          "Skip",
                          style: getItalicTextStyle(
                            context: context,
                            color: Colors.orange,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 50),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
