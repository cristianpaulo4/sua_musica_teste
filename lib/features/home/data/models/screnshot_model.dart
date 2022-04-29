// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'screnshot_model.g.dart';

@JsonSerializable()
class ScreenshotModel extends Equatable {
  int? id;
  String? image_id;
  String? url;
  ScreenshotModel({
    this.id,
    this.image_id,
    this.url,
  });

  @override
  List<Object?> get props => [id, image_id, url];

   factory ScreenshotModel.fromJson(Map<String, dynamic> json) =>
      _$ScreenshotModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScreenshotModelToJson(this);
}
