import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider.autoDispose<int>(
  (ref) => 0,
);

class StateNotifierView extends ConsumerWidget {
  const StateNotifierView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test (StateProvider)"),
        actions: [
          IconButton(
            onPressed: () {
              // ref.refresh(counterProvider);
              ref.read(counterProvider.notifier).update((state) => state = 0);
            },
            icon: const Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
      body: Center(
          child: GestureDetector(
        onTap: () {
          print("counter: $counter");
        },
        child: Text(
          counter.toString(),
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
