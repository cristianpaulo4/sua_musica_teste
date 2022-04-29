// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'plataform_model.g.dart';

@JsonSerializable()
class PlataformModel extends Equatable {
  int? id;
  String? name;
  PlataformModel({
    this.id,
    this.name,
  });
  

  @override
  List<Object?> get props => [id, name];

  
  factory PlataformModel.fromJson(Map<String, dynamic> json) =>
      _$PlataformModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlataformModelToJson(this);
}
