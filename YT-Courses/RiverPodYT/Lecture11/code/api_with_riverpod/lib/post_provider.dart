import 'dart:convert';
import 'dart:io';
import 'package:api_with_riverpod/model_class.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final postProvider = FutureProvider((ref) async {
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      List<PostModel> postList = data
          .map((e) => PostModel.fromJson(e))
          .toList();
      return postList;
    } else {
      throw Exception('Failed to load posts');
    }
  } on Socket {
    throw "Internet Error!";
  } catch (e) {
    rethrow;
  }
});
