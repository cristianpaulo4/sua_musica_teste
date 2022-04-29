// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screnshot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreenshotModel _$ScreenshotModelFromJson(Map<String, dynamic> json) =>
    ScreenshotModel(
      id: json['id'] as int?,
      image_id: json['image_id'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ScreenshotModelToJson(ScreenshotModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_id': instance.image_id,
      'url': instance.url,
    };
