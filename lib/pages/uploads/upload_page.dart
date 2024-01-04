import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_structure/pages/uploads/upload_controller.dart';
import 'package:riverpod_structure/pages/uploads/upload_model.dart';

class UploadPage extends ConsumerStatefulWidget {
  const UploadPage({super.key});

  @override
  ConsumerState<UploadPage> createState() => _WidgetState();
}

TextEditingController userIDInput = TextEditingController();
TextEditingController titleInput = TextEditingController();
TextEditingController descriptionInput = TextEditingController();

void clearText() {
  userIDInput.clear();
  titleInput.clear();
  descriptionInput.clear();
}

getSuccessSnackBar(UploadModel m) {
  return SnackBar(
    content: Column(
      children: [
        Text("ID: ${m.userId}"),
        Text("Title: ${m.title}"),
        Text("Description: ${m.body}"),
      ],
    ),
  );
}

validatorCheck(context) {
  userIDInput.text.trim();
  descriptionInput.text.trim();
  titleInput.text.trim();
  if (userIDInput.text.isEmpty ||
      descriptionInput.text.isEmpty ||
      titleInput.text.isEmpty) {
    context.pop();
    return;
  }
}

class _WidgetState extends ConsumerState<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});

        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Uploads"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Text(
                      "Write Here!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 50,
                      width: 100,
                      child: TextField(
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: false,
                        ),
                        controller: userIDInput,
                        decoration: InputDecoration(
                          hintText: 'User ID',
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3, color: Colors.redAccent),
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Colors.greenAccent), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: TextField(
                        controller: titleInput,
                        decoration: InputDecoration(
                          hintText: 'Post Title',
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Colors.redAccent), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Colors.greenAccent), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 100,
                      child: TextField(
                        controller: descriptionInput,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Post Description',
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Colors.redAccent), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Colors.greenAccent), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            validatorCheck(context);
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const CupertinoActivityIndicator(
                                  color: Colors.amber,
                                );
                              },
                            );

                            final result = await ref.watch(
                              uploadPostProvider(
                                UploadModel(
                                  userId: int.parse(userIDInput.text),
                                  title: titleInput.text,
                                  body: descriptionInput.text,
                                ),
                              ).future,
                            );

                            if (result != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                getSuccessSnackBar(
                                  UploadModel(
                                    userId: result.userId,
                                    title: result.title,
                                    body: result.body,
                                  ),
                                ),
                              );
                              clearText();
                            }
                            context.pop();
                          },
                          child: const Text(
                            "Upload",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
