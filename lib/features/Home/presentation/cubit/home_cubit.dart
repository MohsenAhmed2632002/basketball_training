import 'package:basketball_training/features/Home/data/models/HomeModel.dart';
import 'package:basketball_training/features/Home/data/models/MyLocationModel.dart';
import 'package:basketball_training/features/Home/data/repositories/HomeRepo.dart';
import 'package:basketball_training/features/Home/presentation/cubit/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeState.initial());
  Future<void> getweather(MyLocationModel myLocationModel) async {
    emit(HomeState.loading());

    final response = await homeRepo.getWeather(
      myLocationModel,
    );
    response.when(
      success: (MyWeatherResponseModel) {
        emit(
          HomeState.success(
            MyWeatherResponseModel,
          ),
        );
      },
      failure: (message) {
        emit(
          HomeState.failure(
            message,
          ),
        );
      },
    );
  }
}
