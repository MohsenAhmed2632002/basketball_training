import 'dart:convert';

import 'package:basketball_training/core/NetWorking/API.dart';
import 'package:basketball_training/core/NetWorking/API_result.dart';
import 'package:basketball_training/core/NetWorking/api_service.dart';
import 'package:basketball_training/features/Home/data/models/HomeModel.dart';
import 'package:basketball_training/features/Home/data/models/MyLocationModel.dart';

class HomeRepo {
  final ApiService _apiService;
  HomeRepo(this._apiService);
  Future<ApiResult<MyWeatherModel>> getWeather(
      MyLocationModel myLocationModel) async {
    try {
      final response = await _apiService.getMyWeather(
        // APIConstants.apiBaseUrl,
        "${myLocationModel.lat},${myLocationModel.long}",
        // 5,
      );
      return ApiResult.success(response
        // WeatherResponse.fromJson(
        //   response as Map<String, dynamic>,
        // ),
      );
    } catch (error) {
      return ApiResult.failure(
        error.toString(),
      );
    }
  }
}
