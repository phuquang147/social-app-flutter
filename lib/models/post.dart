import 'package:flutter/foundation.dart';
import 'package:special_app/models/Comment.dart';
import 'package:special_app/models/user.dart';

class PostModel {
  final String id;
  final User user;
  final String description;
  final List<Comment> comments;

  PostModel({
    required this.id,
    required this.user,
    required this.description,
    required this.comments,
  });
}
