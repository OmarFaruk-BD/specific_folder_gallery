import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageGrid extends StatefulWidget {
  const ImageGrid({Key? key}) : super(key: key);

  @override
  State<ImageGrid> createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  final directory = Directory('/storage/emulated/0/Download/');

  List<String> imageList() {
    RegExp regExp =
        RegExp(".(gif|jpe?g|tiff?|png|webp|bmp)", caseSensitive: false);
    final imageList =
        directory.listSync().map((item) => item.path).where((item) {
      return regExp.hasMatch(item);
    }).toList(growable: false);
    return imageList;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: imageList().length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3.0 / 4.6,
      ),
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: InkWell(
              onTap: () => {
                Navigator.push<dynamic>(context,
                    MaterialPageRoute<dynamic>(builder: (context) {
                  return Material(
                    child: Center(
                      child: Text(
                        imageList()[index],
                      ),
                    ),
                  );
                })).then((dynamic refreshGridView) {
                  if (refreshGridView != null) {
                    build(context);
                  }
                }).catchError((dynamic er) {
                  if (kDebugMode) {
                    print(er);
                  }
                }),
              },
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Image.file(
                  File(imageList()[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
