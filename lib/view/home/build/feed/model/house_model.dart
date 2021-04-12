import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'house_model.g.dart';

@JsonSerializable()
class HouseModel extends INetworkModel<HouseModel> {
  @JsonKey(name: '_id')
  String id;
  String title;
  String description;
  String image;
  UserHouse user;
  int iV;
  HouseModel({this.id, this.title, this.description, this.image, this.user, this.iV});

  @override
  HouseModel fromJson(Map<String, dynamic> json) {
    return _$HouseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$HouseModelToJson(this);
  }
}

@JsonSerializable()
class UserHouse extends INetworkModel<UserHouse> {
  String sId;
  String name;
  String image;
  String date;
  UserHouse({this.sId, this.name, this.image, this.date});

  @override
  UserHouse fromJson(Map<String, dynamic> json) {
    return _$UserHouseFromJson(json);
  }

  factory UserHouse.fromJson(Map<String, dynamic> json) {
    return _$UserHouseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$UserHouseToJson(this);
  }
}
