// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'genere_model.g.dart';

@JsonSerializable()
class GenereModel extends Equatable {
  int? id;
  String? name;
  GenereModel({
    this.id,
    this.name,
  });
  

  @override
  List<Object?> get props => [id, name];

  
  factory GenereModel.fromJson(Map<String, dynamic> json) =>
      _$GenereModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenereModelToJson(this);
}
