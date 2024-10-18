
import 'package:basketball_training/core/NetWorking/API.dart';
import 'package:basketball_training/features/Home/data/models/HomeModel.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(APIConstants.apiBaseUrl)  // استخدم المسار النسبي فقط
  Future<MyWeatherModel> getMyWeather(
    @Query('q') String location, // تمرير lat, lon كاستعلام
  );
}
