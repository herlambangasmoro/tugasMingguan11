
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Gallery Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Gallery dan Image Picker"),
            const SizedBox(
              height: 10,
            ),
            _image == null
                ? Container(
                    height: 60,
                    width: 150,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "No Image Selected",
                      style: TextStyle(color: Colors.white),
                    ))
                : Image.file(
                    File(_image!.path),
                    height: 100,
                    width: 100,
                  ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: getImage,
              child: const Text("Access Data Gallery"),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}