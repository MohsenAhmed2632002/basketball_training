
import 'package:basketball_training/core/NetWorking/API.dart';
import 'package:basketball_training/features/Home/data/models/HomeModel.dart';
import 'package:basketball_training/features/Home/data/models/MyLocationModel.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(
    Dio dio, {
    String baseUrl,
  }) = _ApiService;

  @GET(APIConstants.forecast)
  Future<WeatherResponse> getMyWeather(
    @Query('key') String apiKey, // تمرير مفتاح API
    @Query('q') String location,  // تمرير lat, lon كاستعلام
    @Query('days') int days,      // عدد الأيام المطلوبة
  );

}
