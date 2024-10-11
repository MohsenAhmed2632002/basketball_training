import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:basketball_training/core/di/Dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/Routing/Routes.dart';
import 'core/Theming/theme.dart';

void main() async {
// // ...
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGitDI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialTheme theme = MaterialTheme(context: context);
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        theme: theme.darkMediumContrast(),
        onGenerateRoute: RoutesGenerator.getRoutes,
        initialRoute: Routes.splashRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// class ControllerViewModel extends GetxController {
//   int _navValue = 0;
//   get navValue => _navValue;
//   Widget _currentScreen = HomeView();
//   get currentScreen => _currentScreen;
//   void getNavValue(int selectIndex) {
//     _navValue = selectIndex;
//     switch (selectIndex) {
//       case 0:
//         _currentScreen = HomeView();
//         break;
//       case 1:
//         _currentScreen = OrderView();
//         break;
//       case 2:
//         _currentScreen = PersonView();
//         break;
//       default:
//     }
//     update();
//   }
// }

// class ControllerView extends GetWidget<AuthViewModel> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<ConnectivityResult>(
//       stream: Connectivity().onConnectivityChanged,
//       builder: (context, snapshot) {
//         return snapshot.data == ConnectivityResult.none
//             ? Scaffold(
//                 body: Center(
//                   child: Text(
//                     "No Internet Connection \n Please Check Your Internet \n Connection",
//                     style: getBoldTextStyle(
//                       context: context,
//                       color: Colors.red,
//                     ),
//                   ),
//                 ),
//               )
//             : Obx(
//                 () {
//                   return (Get.put(AuthViewModel()).user == null)
//                       ? LoginView()
//                       : GetBuilder<ControllerViewModel>(
//                           init: Get.put(
//                             ControllerViewModel(),
//                           ),
//                           builder: (controller) {
//                             return HasSignedIn();
//                           },
//                         );
//                 },
//               );
//       },
//     );
//   }
// }

// class HasSignedIn extends StatelessWidget {
//   const HasSignedIn({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ControllerViewModel>(
//       init: Get.put(ControllerViewModel()),
//       builder: (controller) {
//         return Scaffold(
//           body: controller.currentScreen,
//           bottomNavigationBar: MyNavigationBar(),
//         );
//       },
//     );
//   }
// }

