import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'game_model.g.dart';

@JsonSerializable()
class GameModel extends Equatable {
  int? id;
  String? slug;
  String? name;
  String? summary;
  List<int>? screenshots;  
  List<int>? genres;  
  List<int>? platforms;  
  GameModel({
    this.id,
    this.slug,
    this.name,
    this.summary,
    this.screenshots,
    this.genres,
    this.platforms,
    
  });

  @override
  List<Object?> get props => [id, slug, name, summary, screenshots];

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameModelToJson(this);
}
