import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_structure/pages/uploads/upload_model.dart';
import 'package:riverpod_structure/pages/uploads/upload_repository.dart';

final uploadPostApiProvider =
    Provider<UploadRepository>((ref) => UploadRepository());
//Use auto dispose with provider to dispose
//Use family when we want to pass argument through the provider
final uploadPostProvider = FutureProvider.autoDispose
    .family<UploadModel?, UploadModel>((ref, body) async {
  final result = await ref.watch(uploadPostApiProvider).uploadPost(body);
  return result;
});
