import 'dart:convert';

import 'package:basketball_training/core/NetWorking/API_result.dart';
import 'package:basketball_training/core/NetWorking/api_service.dart';
import 'package:basketball_training/features/Home/data/models/HomeModel.dart';
import 'package:basketball_training/features/Home/data/models/MyLocationModel.dart';


class HomeRepo {
  final ApiService _apiService;
  HomeRepo(this._apiService);
  Future<ApiResult<WeatherResponse>> getWeather(
      MyLocationModel myLocationModel) async {
    try {
      final response = await _apiService.getMyWeather(
        "f5e657f7a0484ab5b25173533231907",
        "${myLocationModel.lat},${myLocationModel.long}",
        5,
      );
      return ApiResult.success(
        WeatherResponse.fromJson(
          json.decode(
            response as String,
          ),
        ),
      );
    } catch (error) {
      return ApiResult.failure(error.toString(),);
    }
  }
}
