import 'package:flutter/material.dart';
import 'package:flutter_api/service/post_service.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController userController = TextEditingController();

  PostService postService = PostService();

  late String enteredTitle;
  late String enteredBody;
  late int enteredUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("Add Your Post"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Post title",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Post body",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                hintText: "Body",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "User ID",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: userController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "ID",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                  if (titleController.text.isNotEmpty &&
                      bodyController.text.isNotEmpty &&
                      userController.text.isNotEmpty) {
                    enteredTitle = titleController.text;
                    enteredBody = bodyController.text;
                    enteredUser = int.parse(userController.text);
                    // debugPrint(
                    //     enteredTitle + " " + enteredBody + " " + enteredUser);
                    var data = postService.addPost(
                        enteredTitle, enteredBody, enteredUser);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(color: Colors.white),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign in",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
