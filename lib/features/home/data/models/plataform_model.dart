// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'plataform_model.g.dart';

@JsonSerializable()
class PlataformModel extends Equatable {
  int? id;
  String? alternative_name;
  String? name;
  String? slug;
  PlataformModel({
     this.id,
     this.alternative_name,
     this.name,
     this.slug,
  });
 

  @override
  List<Object?> get props => [id, alternative_name, name, slug];

  factory PlataformModel.fromJson(Map<String, dynamic> json) =>
      _$PlataformModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlataformModelToJson(this);
}
