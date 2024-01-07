import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_structure/pages/family_modifier/family_modifier_model.dart';
import 'package:riverpod_structure/pages/family_modifier/provider.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Family Modifier",
        ),
      ),
      body: Center(
        child: Text(
          user,
        ),
      ),
    );
  }
}
