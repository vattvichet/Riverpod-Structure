import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_structure/pages/family_modifier/family_modifier_model.dart';

final userProvider = Provider.family<String, User>((ref, user) {
  return "This is ${user.username}, Address: ${user.address}";
});
