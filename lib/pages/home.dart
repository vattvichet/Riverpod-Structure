import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     context.pushNamed(AppRoute.page1.name);
            //   },
            //   child: const Text("Page 1"),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     context.pushNamed(AppRoute.page2.name);
            //   },
            //   child: const Text("Page 2"),
            // ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(AppRoute.pageData.name);
              },
              child: const Text("Get Data"),
            ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(AppRoute.uploadPage.name);
              },
              child: const Text("Uploads"),
            ),
          ],
        ),
      ),
    );
  }
}
