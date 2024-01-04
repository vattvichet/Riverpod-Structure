import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_structure/pages/page_data/page_data_repository.dart';

import 'page_data_model.dart';

final getPostRepositoryProvider =
    Provider<GetPostRepository>((ref) => GetPostRepository());
//Use auto dispose with provider to dispose
final getPostProvider =
    FutureProvider.autoDispose<List<PostModel>?>((ref) async {
  return ref.watch(getPostRepositoryProvider).fetchPost();
});
