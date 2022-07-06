import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

// part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    required this.data,
  });

  Data data;

  factory User.fromJson(Map<String, dynamic> json) => User.fromJson(json);
  Map<String, dynamic> toJson(User user) => toJson(this);
}
