import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:basketball_training/core/Theming/Font.dart';
import 'package:basketball_training/core/Widgets/Shared_Widgets.dart';
import 'package:basketball_training/features/Home/data/models/MyLocationModel.dart';
import 'package:basketball_training/features/Home/presentation/cubit/home_cubit.dart';
import 'package:basketball_training/features/Home/presentation/cubit/home_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _determinePosition();
    super.initState();
  }

  Future _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 20.h,
            ),
            child: Column(
              children: [
                BlocListener<HomeCubit, HomeState>(
                  listenWhen: (previous, current) =>
                      current is Loading ||
                      current is Success ||
                      current is Failure,
                  listener: (context, state) {
                    state.whenOrNull(
                      loading: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: "loading",
                              message: "loading",
                              contentType: ContentType.warning,
                            ),
                          ),
                        );
                      },
                      success: (loginResponse) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: "Login Success",
                              message: "Welcome",
                              contentType: ContentType.success,
                            ),
                          ),
                        );
                      },
                      failure: (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: error,
                              message: error,
                              contentType: ContentType.failure,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const SizedBox.shrink(),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 150.h,
                  child: LineChart(
                    curve: Curves.bounceInOut,
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(
                              2,
                              0,
                            ),
                            FlSpot(
                              4,
                              5,
                            ),
                            FlSpot(
                              6,
                              8,
                            ),
                            FlSpot(
                              11,
                              15,
                            ),
                            // FlSpot(3, 4,),
                          ],
                          barWidth: 4,
                          color: Colors.orange,
                          isCurved: true,
                          belowBarData: BarAreaData(
                            show: true,
                            color: Colors.orange,
                          ),
                          dotData: FlDotData(
                            show: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return MyTextButton(
                      onPressed: () async {
                        Position position =
                            await Geolocator.getCurrentPosition();
                        print("lat: ${position.latitude}");
                        print("long: ${position.longitude}");
                        BlocProvider.of<HomeCubit>(context).getweather(
                          MyLocationModel(
                            long: position.longitude,
                            lat: position.latitude,
                          ),
                        );
                      },
                      text: "Get Current Position ",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
        20,
      ),
      decoration: BoxDecoration(
        // color: Colors.orange,
        boxShadow: [
          BoxShadow(
            color: Colors.orange,
            blurRadius: 20,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          25,
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          selectedLabelStyle: getBoldItalicTextStyle(
            context: context,
            color: Colors.white,
          ),

          showUnselectedLabels: false,
          backgroundColor: Colors.orange,
          onTap: (index) {
            // controller.getNavValue(index);
          },
          currentIndex: 1,
          // currentIndex: controller.navValue,
          items: [
            BottomNavigationBarItem(
              label: "Favorite",
              icon: Icon(
                color: Colors.white,
                Icons.favorite,
              ),
            ),
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(
                color: Colors.white,
                Icons.person,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
