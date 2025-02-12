import 'dart:io';
import 'package:flutter/material.dart';

class ImgShow extends StatelessWidget {
  final List<File> imgList; // Accept image list as a parameter

  const ImgShow({super.key, required this.imgList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Viewer')),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: imgList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.amberAccent,
                          width: 2,
                        ),
                        image: DecorationImage(
                          image: FileImage(imgList[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
