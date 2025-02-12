import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_project/img_show.dart';

void main() {
  runApp(const MaterialApp(home: CameraImageList()));
}

class CameraImageList extends StatefulWidget {
  const CameraImageList({super.key});

  @override
  State<CameraImageList> createState() => _CameraImageListState();
}

class _CameraImageListState extends State<CameraImageList> {
  List<File> _imageList = []; // List to hold image files
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _imageList.add(File(image.path));
      });
    }
  }

  Future<void> _getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageList.add(File(image.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera & Gallery Image List'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _getImageFromCamera,
                child: const Text('Take a Picture'),
              ),
              ElevatedButton(
                onPressed: _getImageFromGallery,
                child: const Text('Pick from Gallery'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImgShow(imgList: _imageList),
                ),
              );
            },
            child: const Text('Next Page'),
          ),
        ],
      ),
    );
  }
}
