import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:gomama_v2/states/Utils.dart';


class MessageField {
  static final String createdAt = 'createdAt';
}

class Message {
  final String idUser;
  final String profilePic;
  final String username;
  final String message;
  final DateTime createdAt;

  const Message({
    @required this.idUser,
    @required this.profilePic,
    @required this.username,
    @required this.message,
    @required this.createdAt,
  });

  static Message fromJson(Map<String, dynamic> json) => Message(
        idUser: json['idUser'],
        profilePic: json['urlAvatar'],
        username: json['username'],
        message: json['message'],
        createdAt: Utils.toDateTime(json['createdAt']),
      );

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'urlAvatar': profilePic,
        'username': username,
        'message': message,
        'createdAt': Utils.fromDateTimeToJson(createdAt),
      };
}