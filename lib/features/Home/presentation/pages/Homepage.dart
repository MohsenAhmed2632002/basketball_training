import 'package:basketball_training/features/Home/presentation/cubit/home_cubit.dart';
import 'package:basketball_training/features/Home/presentation/cubit/home_state.dart';
import 'package:basketball_training/features/Home/presentation/widgets/HomePageWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../core/Theming/Font.dart';

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

  Future<void> getPrediction(List<int> features) async {
    final url = Uri.parse('http://192.168.1.9:5001/predict');

    // Create the POST request body
    Map<String, dynamic> body = {'features': features};

    // Send the POST request
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    // Handle the response
    if (response.statusCode == 200) {
      final prediction = json.decode(response.body)['prediction'];
      if (kDebugMode) {
        print('Prediction: $prediction');
      }
    } else {
      if (kDebugMode) {
        print('Failed to get prediction');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height - 180.h,
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
                            IconButton(
                              onPressed: () {
                                //- outlook is rainy (the value is 0 for no and 1 for yes)
                                // - outlook is sunny (the value is 0 for no and 1 for yes)
                                // - temperature is hot (the value is 0 for no and 1 for yes)
                                // - temperature is mild (the value is 0 for no and 1 for yes)
                                // - humidity is normal (the value is 0 for no and 1 for yes)
                                List<int> features_0 = [
                                  0,
                                  1,
                                  1,
                                  0,
                                  0
                                ]; // Prediction: [0]
                                List<int> features_1 = [
                                  0,
                                  1,
                                  0,
                                  1,
                                  1
                                ]; // Prediction: [1]
                                getPrediction(
                                    features_1); // Call getPrediction with the feature list
                              },
                              icon: const Icon(
                                Icons.get_app_sharp,
                                size: 50,
                              ),
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
