// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyLocationModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyLocationModel _$MyLocationModelFromJson(Map<String, dynamic> json) =>
    MyLocationModel(
      long: (json['long'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
    );

Map<String, dynamic> _$MyLocationModelToJson(MyLocationModel instance) =>
    <String, dynamic>{
      'long': instance.long,
      'lat': instance.lat,
    };
