import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loxtest/services/user_dao.dart';
import 'package:loxtest/ui/screens/message_list.dart';
import 'package:loxtest/ui/widgets/app_buttons.dart';
import 'package:loxtest/ui/widgets/app_text.dart';
import 'package:loxtest/ui/widgets/text_link.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? file;
  @override
  Widget build(BuildContext context) {
    final userDao = Provider.of<UserDao>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome  ${FirebaseAuth.instance.currentUser!.email!}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              FirebaseAuth.instance.currentUser!.photoURL != null ||
                      file != null
                  ? CircleAvatar(
                      radius: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: file != null
                            ? Image.file(
                                file!,
                                width: 60,
                              )
                            : Image.network(
                                FirebaseAuth.instance.currentUser!.photoURL!,
                                width: 100,
                              ),
                      ),
                    )
                  : CircleAvatar(
                      radius: 50,
                      child: Text(
                        FirebaseAuth.instance.currentUser!.email!
                            .substring(0, 2)
                            .toUpperCase(),
                      )),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextLink(
                      "Edit",
                      color: Colors.purpleAccent,
                      size: 18,
                      onPressed: () {
                        chooseImage();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppButtons(
                    color: Colors.black,
                    size: 100,
                    text: "Upload",
                    height: 50,
                    backgroundColor: Colors.white,
                    borderColor: Colors.purpleAccent,
                    onPressed: () {
                      updateProfile();
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const MessageList(),
                    ),
                  );
                },
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      child: const Icon(Icons.people),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppText(
                      text: "Community",
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    TextLink(
                      "Log Out",
                      color: Colors.red,
                      size: 16,
                      onPressed: () {
                        userDao.logout();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  chooseImage() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    print("File Path" + xfile!.path);

    setState(() {
      file = File(xfile.path);
    });
  }

  updateProfile() async {
    Map<String, dynamic> map = {};
    if (file != null) {
      String url = await uploadImage();
      print("Url $url");
      map['profileImage'] = url;
      await FirebaseAuth.instance.currentUser!.updatePhotoURL(url);
      print(FirebaseAuth.instance.currentUser!.photoURL);
    }

    // await FirebaseFirestore.instance
    //     .collection('messages')
    //     .doc(FirebaseAuth.instance.currentUser?.uid)
    //     .update(map);
  }

  Future<String> uploadImage() async {
    TaskSnapshot taskSnapshot = await FirebaseStorage.instance
        .ref()
        .child("profile")
        .child(
            FirebaseAuth.instance.currentUser!.uid + "_" + basename(file!.path))
        .putFile(file!);

    return await taskSnapshot.ref.getDownloadURL();
  }
}
