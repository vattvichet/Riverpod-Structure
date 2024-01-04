import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_structure/pages/page_data/page_data_controller.dart';

class DataScreen extends ConsumerWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postList = ref.watch(getPostProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data"),
      ),
      body: switch (postList) {
        AsyncData(:final value) => ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            itemBuilder: (context, index) {
              return PostWidget(
                title: value[index].title,
                id: value[index].userID.toString(),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
            itemCount: value!.length,
          ),
        AsyncError() => const Text('Oops, something unexpected happened'),
        _ => const Center(child: CircularProgressIndicator()),
      },

      // postList.when(
      //   data: (data) {
      //     if (data == null) {
      //       return const PostWidget(
      //         id: "id_",
      //         title: "description-",
      //       );
      //     }
      //     return RefreshIndicator(
      //       onRefresh: () => ref.refresh(getPostProvider.future),
      //       child:
      //     );
      //   },
      //   error: (error, stackTrace) => const Center(
      //       child: Icon(
      //     Icons.error,
      //     color: Colors.red,
      //   )),
      //   loading: () {
      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.title,
    required this.id,
  });
  final String title;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.deepOrange[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(id),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
