import 'dart:convert';

import 'package:http/http.dart';
import 'package:riverpod_structure/pages/page_data/page_data_model.dart';

abstract class IGetRepository {
  Future<List<PostModel>?> fetchPost();
}

class GetRepository implements IGetRepository {
  @override
  Future<List<PostModel>?> fetchPost() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    try {
      final response = await get(Uri.parse(url));
      final list = <PostModel>[];
      print(response.statusCode);
      if (response.statusCode == 200) {
        for (var json in jsonDecode(response.body)) {
          list.add(PostModel.fromJson(json));
          print(json);
        }
        return list;
      } else {
        return null;
      }
    } catch (e) {
      return null;
      print(e);
    }
  }
}
