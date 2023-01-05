import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickerImage extends StatefulWidget {
  @override
  _PickerImageState createState() => _PickerImageState();
}

class _PickerImageState extends State<PickerImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pickin Image')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showImage(),
            ElevatedButton(
                onPressed: () {
                  pickImageFromGallery(ImageSource.camera);
                },
                child: Text('Select image from gallery'))
          ],
        ),
      ),
    );
  }

  Widget showImage() {
    return FutureBuilder<XFile?>(
      future: imageFile,
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done && snap.data != null) {
          return Image.file(
           File( snap.data!.path) ,
            width: 300,
            height: 300,
          );
        }

        if (snap.error != null) {
          return const Text('Error picking image');
        }

        return const Text('Not picking image');
      },
    );
  }

  Future<XFile?>? imageFile;

  void pickImageFromGallery(ImageSource source) {
    imageFile = ImagePicker().pickImage(source: source) ;
    setState(() {
      
    });
  }
}
