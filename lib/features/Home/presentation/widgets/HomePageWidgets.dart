import 'package:animate_do/animate_do.dart';
import 'package:basketball_training/core/Theming/Font.dart';
import 'package:basketball_training/core/Widgets/Shared_Widgets.dart';
import 'package:basketball_training/features/Home/data/models/MyLocationModel.dart';
import 'package:basketball_training/features/Home/presentation/cubit/home_cubit.dart';
import 'package:basketball_training/features/Home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

class ContainerCurrent extends StatelessWidget {
  final myCurrent;
  const ContainerCurrent({
    required this.myCurrent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: Column(
        children: [
          Text(
            "Current",
            style: getBoldTextStyle(
              color: Colors.white,
              fontSize: 25,
              context: context,
            ),
          ),
          Container(
            // height: 250.h,
            child: ListViewCurrent(
              myCurrent: myCurrent,
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewCurrent extends StatelessWidget {
  final myCurrent;
  const ListViewCurrent({required this.myCurrent, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orangeAccent,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Text(
            //   ":${myCurrent.lastUpdated}",
            //   style: getRegulerTextStyle(
            //     context: context,
            //     color: Colors.white,
            //   ),
            // ),
            Text(
              "lastUpdated:\n${myCurrent.lastUpdated}",
              style: getRegulerTextStyle(
                context: context,
                color: Colors.white,
              ),
            ),
            Text(
              "cloud:${myCurrent.cloud}",
              style: getRegulerTextStyle(
                context: context,
                color: Colors.white,
              ),
            ),
            // String iconUrl = myForecast.forecastday[index].day.condition.icon;

            // if (iconUrl.startsWith('/')) {
            // iconUrl = "https:" + iconUrl;
            // }
            Image.network("https:${myCurrent.condition.icon}"),
            // Text(
            //   "name:${myLocation.name}",
            //   style: getRegulerTextStyle(
            //     context: context,
            //     color: Colors.white,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class ContainerLocation extends StatelessWidget {
  final myLocation;
  const ContainerLocation({
    required this.myLocation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: Column(
        children: [
          Text(
            "Location",
            style: getBoldTextStyle(
              color: Colors.white,
              fontSize: 25,
              context: context,
            ),
          ),
          Container(
            // height: 250.h,
            child: ListViewLocation(
              myLocation: myLocation,
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewLocation extends StatelessWidget {
  final myLocation;
  const ListViewLocation({required this.myLocation, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orangeAccent,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "country:${myLocation.country}",
              style: getRegulerTextStyle(
                context: context,
                color: Colors.white,
              ),
            ),
            Text(
              "region:${myLocation.region}",
              style: getRegulerTextStyle(
                context: context,
                color: Colors.white,
              ),
            ),
            Text(
              "name:${myLocation.name}",
              style: getRegulerTextStyle(
                context: context,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerForecast extends StatelessWidget {
  final myWeatherResponseModel;
  const ContainerForecast({
    required this.myWeatherResponseModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Column(
        children: [
          Text(
            "Forecast",
            style: getBoldTextStyle(
                color: Colors.white, fontSize: 30, context: context),
          ),
          Container(
            height: 220.h,
            child: ListViewForecast(
              myForecast: myWeatherResponseModel,
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewForecast extends StatelessWidget {
  final myForecast;
  const ListViewForecast({
    required this.myForecast,
    super.key,
  });
  // myForecast.forecastday.cloud

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orangeAccent,
      elevation: 10,
      child: ListView.builder(
        shrinkWrap: false,
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.horizontal,
        itemCount: myForecast.forecastday.length,
        itemBuilder: (BuildContext context, int index) {
          String iconUrl = myForecast.forecastday[index].day.condition.icon;

          if (iconUrl.startsWith('/')) {
            iconUrl = "https:" + iconUrl;
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date:${myForecast.forecastday[index].date}",
                    style: getRegulerTextStyle(
                      context: context,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "ConditionDay:\n${myForecast.forecastday[index].day.condition.text}",
                    style: getRegulerTextStyle(
                      context: context,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Cloud:${myForecast.forecastday[index].hour[index].cloud}",
                    style: getRegulerTextStyle(
                      context: context,
                      color: Colors.white,
                    ),
                  ),
                  Image.network(iconUrl),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class GetMyLocationBlocButton extends StatelessWidget {
  const GetMyLocationBlocButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return MyTextButton(
          onPressed: () async {
            Position position = await Geolocator.getCurrentPosition();
            print("lat: ${position.latitude}");
            print("long: ${position.longitude}");
            BlocProvider.of<HomeCubit>(context).getweather(
              MyLocationModel(
                long: position.longitude,
                lat: position.latitude,
              ),
            );
          },
          text: " Get ca Weather ",
        );
      },
    );
  }
}

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      margin: EdgeInsets.all(
        20,
      ),
      decoration: BoxDecoration(
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
          onTap: (index) {},
          currentIndex: 1,
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
