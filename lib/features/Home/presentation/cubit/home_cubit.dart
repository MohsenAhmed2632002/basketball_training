import 'package:basketball_training/features/Home/data/models/MyLocationModel.dart';
import 'package:basketball_training/features/Home/data/repositories/HomeRepo.dart';
import 'package:basketball_training/features/Home/presentation/cubit/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeState.initial());
  Future getweather(MyLocationModel myLocationModel) async {
    emit(HomeState.loading());

    final response = await homeRepo.getWeather(myLocationModel);
    response.when(
      success: (weatherResponse) {
        emit(HomeState.success(weatherResponse));
      },
      failure: (message) {
        emit(HomeState.failure(message));
      },
    );
  }
}
//   final formKey = GlobalKey<FormState>();
//   void emitLoginState() async {
//     emit(const LoginState.loading());
//     final response = await loginRepo.login(
//       LoginRequestBody(
//         email: emailController.text,
//         password: passwordController.text,
//       ),
//     );

//     response.when(
//       success: (loginResponse) async {
//         emit(LoginState.success(loginResponse));
//         await SharedPrefHelperKeys.saveUserToken(
//           loginResponse.userData!.token ?? "",
//         );
//       },
//       failure: (message) => emit(
//         LoginState.failure(
//           message ?? "",
//         ),
//       ),
//     );
//   }
// }
