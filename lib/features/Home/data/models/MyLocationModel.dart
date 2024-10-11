import 'package:json_annotation/json_annotation.dart';
part 'MyLocationModel.g.dart';

@JsonSerializable()
class MyLocationModel {
  double long;
  double lat;
  MyLocationModel({
    required this.long,
    required this.lat,
  });
  factory MyLocationModel.fromJson(Map<String, dynamic> json) =>
      _$MyLocationModelFromJson(json);
}
