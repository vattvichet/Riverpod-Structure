import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_structure/pages/family_modifier/family_modifier_model.dart';

final userProvider = Provider.family<String, User>((ref, user) {
  return "This is ${user.username}, Address: ${user.address}";
});

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);
  void updateUsername(String newName) {
    state = state.copyWith(username: newName);
  }

  void updateAddress(String newAddress) {
    state = state.copyWith(address: newAddress);
  }
}
