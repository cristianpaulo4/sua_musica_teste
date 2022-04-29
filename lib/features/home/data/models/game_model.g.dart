// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
      id: json['id'] as int?,
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      summary: json['summary'] as String?,
      screenshots: (json['screenshots'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      genres: (json['genres'] as List<dynamic>?)?.map((e) => e as int).toList(),
      platforms:
          (json['platforms'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'summary': instance.summary,
      'screenshots': instance.screenshots,
      'genres': instance.genres,
      'platforms': instance.platforms,
    };
