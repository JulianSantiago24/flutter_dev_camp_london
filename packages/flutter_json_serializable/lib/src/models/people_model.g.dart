// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

People _$PeopleFromJson(Map<String, dynamic> json) => People(
      id: json['id'] as String,
      names: json['names'] as String,
      age: json['age'] as String,
      profilePicture: json['profilePicture'] as String,
    );

Map<String, dynamic> _$PeopleToJson(People instance) => <String, dynamic>{
      'id': instance.id,
      'names': instance.names,
      'age': instance.age,
      'profilePicture': instance.profilePicture,
    };
