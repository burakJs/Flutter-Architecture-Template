import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'game_model.g.dart';

@JsonSerializable()
class GameModel extends INetworkModel<GameModel> {
  @JsonKey(name: '_id')
  String? sId;
  String? image;
  String? name;
  int? money;
  int? category;
  int? iV;

  GameModel({this.sId, this.image, this.name, this.money, this.category, this.iV});

  @override
  GameModel fromJson(Map<String, dynamic> json) {
    return _$GameModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$GameModelToJson(this);
  }
}
