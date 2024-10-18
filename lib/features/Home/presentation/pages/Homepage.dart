import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:basketball_training/core/Theming/Font.dart';
import 'package:basketball_training/core/Widgets/Shared_Widgets.dart';
import 'package:basketball_training/features/Home/data/models/HomeModel.dart';
import 'package:basketball_training/features/Home/data/models/MyLocationModel.dart';
import 'package:basketball_training/features/Home/presentation/cubit/home_cubit.dart';
import 'package:basketball_training/features/Home/presentation/cubit/home_state.dart';
import 'package:basketball_training/features/Home/presentation/widgets/HomePageWidgets.dart';
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
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 180.h,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Hello ",
                      style: getBoldTextStyle(
                          color: Colors.white, fontSize: 30, context: context),
                    )
                  ],
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is Loading ||
                      current is Success ||
                      current is Failure,
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () {
                        return CircularProgressIndicator();
                      },
                      success: (MyWeatherResponseModel) {
                        return Column(
                          children: [
                            ContainerLocation(
                              myLocation: MyWeatherResponseModel.location,
                            ),
                            ContainerCurrent(
                              myCurrent: MyWeatherResponseModel.current,
                            ),
                            ContainerForecast(
                              myWeatherResponseModel:
                                  MyWeatherResponseModel.forecast,
                            ),
                          ],
                        );
                      },
                      failure: (error) {
                        return Text('Error: $error');
                      },
                      orElse: () {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GetMyLocationBlocButton()
                            // Container(
                            //   child: Text('Click on\n Get  Forecast Weather'),
                            // ),
                          ],
                        );
                      },
                    );
                  },
                ),
                // GetMyLocationBlocButton(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
