import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_structure/pages/StateNotifierProvider_page/provider.dart';

final counterProvider = StateNotifierProvider<CounterDemo, int>(
  (ref) => CounterDemo(),
);

class StateNotifierProviderView extends ConsumerWidget {
  const StateNotifierProviderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test (StateNotifierProvider)"),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       // ref.refresh(counterProvider);
        //       ref.read(counterProvider.notifier).update((state) => state = 0);
        //     },
        //     icon: const Icon(
        //       Icons.refresh,
        //     ),
        //   ),
        // ],
      ),
      body: Center(
          child: GestureDetector(
        onTap: () {},
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
          ref.read(counterProvider.notifier).onAdd();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
