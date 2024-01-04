import 'dart:convert';
import 'package:http/http.dart';

import 'package:riverpod_structure/pages/uploads/upload_model.dart';

abstract class IUploadRepository {
  Future<UploadModel?> uploadPost(UploadModel body);
}

class UploadRepository implements IUploadRepository {
  @override
  Future<UploadModel?> uploadPost(UploadModel body) async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    try {
      final response = await post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body.toJson()),
      );
      if (response.statusCode == 201) {
        print("Upload statusCode :  ${response.statusCode}");
        print(response.body);
        return UploadModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
