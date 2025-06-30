import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final postProvider = FutureProvider((ref) async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
  );
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load posts');
  }
});

// this is the model class for the Post
// it will be used to convert the json data into a model object
class PostModel {
  final int id;
  final int userId;
  final String title;
  final String body;

  PostModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }
}
