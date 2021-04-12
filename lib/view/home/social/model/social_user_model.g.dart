// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialUser _$SocialUserFromJson(Map<String, dynamic> json) {
  return SocialUser(
    sId: json['_id'] as String,
    name: json['name'] as String,
    company: json['company'] as String,
    image: json['image'] as String,
  )..iV = json['iV'] as String;
}

Map<String, dynamic> _$SocialUserToJson(SocialUser instance) =>
    <String, dynamic>{
      '_id': instance.sId,
      'name': instance.name,
      'company': instance.company,
      'image': instance.image,
      'iV': instance.iV,
    };
