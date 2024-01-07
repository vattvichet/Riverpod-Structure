import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_structure/pages/family_modifier/family_modifier_model.dart';
import 'package:riverpod_structure/pages/family_modifier/provider.dart';

final userInputProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(
    User(
      username: "Vichet",
      address: "Siem Reap",
    ),
  ),
);

class FamilyModifierView extends ConsumerWidget {
  const FamilyModifierView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(
      userProvider(
        User(
          username: "Vichet",
          address: "Siem Reap",
        ),
      ),
    );
    final inputUser = ref.watch(
      userInputProvider.select((value) => value.username),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Family Modifier",
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              user,
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              onSubmitted: (value) {
                ref.watch(userInputProvider.notifier).updateUsername(value);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onSubmitted: (value) {
                ref.watch(userInputProvider.notifier).updateAddress(value);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Text(inputUser),
          ],
        ),
      ),
    );
  }
}
