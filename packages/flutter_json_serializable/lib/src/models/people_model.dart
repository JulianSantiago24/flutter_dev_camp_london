// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'people_model.g.dart';

@JsonSerializable()
class People {
  People({
    required this.id,
    required this.names,
    required this.age,
    required this.profilePicture,
  });

  final String id;
  final String names;
  final String age;
  final String profilePicture;

  factory People.fromJson(Map<String, dynamic> json) => _$PeopleFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleToJson(this);
}
