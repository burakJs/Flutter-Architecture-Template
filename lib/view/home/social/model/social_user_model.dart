import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'social_user_model.g.dart';

@JsonSerializable()
class SocialUser extends INetworkModel<SocialUser> {
  @JsonKey(name: '_id')
  String sId;
  String name;
  String company;
  String image;
  String iV;

  SocialUser({this.sId, this.name, this.company, this.image});

  SocialUser.fromJson(Map<String, dynamic> json) {
    _$SocialUserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SocialUserToJson(this);
  }

  @override
  SocialUser fromJson(Map<String, dynamic> json) {
    return _$SocialUserFromJson(json);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SocialUser && other.sId == sId && other.name == name && other.company == company && other.image == image && other.iV == iV;
  }

  @override
  int get hashCode {
    return sId.hashCode ^ name.hashCode ^ company.hashCode ^ image.hashCode ^ iV.hashCode;
  }
}
