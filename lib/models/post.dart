import 'package:flutter/foundation.dart';
import 'package:special_app/models/Comment.dart';

class PostModel {
  final String id;
  final String avatar;
  final String name;
  final String description;
  final List<Comment> comments;

  PostModel({
    required this.id,
    required this.avatar,
    required this.name,
    required this.description,
    required this.comments,
  });
}
