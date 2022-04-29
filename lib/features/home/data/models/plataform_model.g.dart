// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plataform_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlataformModel _$PlataformModelFromJson(Map<String, dynamic> json) =>
    PlataformModel(
      id: json['id'] as int?,
      alternative_name: json['alternative_name'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$PlataformModelToJson(PlataformModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'alternative_name': instance.alternative_name,
      'name': instance.name,
      'slug': instance.slug,
    };
