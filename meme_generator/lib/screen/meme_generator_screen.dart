import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MemeGeneratorScreen extends StatefulWidget {
  const MemeGeneratorScreen({Key? key}) : super(key: key);

  @override
  State<MemeGeneratorScreen> createState() => _MemeGeneratorScreenState();
}

class _MemeGeneratorScreenState extends State<MemeGeneratorScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String displayText = 'Ваш текст может быть здесь';
  final TextEditingController _urlController = TextEditingController();
  Image? _image = Image.network(
      'https://i.cbc.ca/1.6713656.1679693029!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_780/this-is-fine.jpg');

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context);
    final decoration = BoxDecoration(
      border: Border.all(
        color: Colors.white,
        width: 2,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: ListView(
          children: [
            ColoredBox(
              color: Colors.black,
              child: DecoratedBox(
                decoration: decoration,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: DecoratedBox(
                          decoration: decoration,
                          child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: _image),
                        ),
                      ),
                      Text(
                        displayText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Impact',
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                labelText: 'Enter Text',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
                fillColor: Colors.white,
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: (text) {
                setState(() {
                  displayText = text;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(
                labelText: 'Enter URL',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
                fillColor: Colors.grey,
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: (url) {
                setState(() {
                  _image = Image.network(url);
                });
              },
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  getImage();
                },
                child: const Text('Pick Image from Gallery'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = Image.file(File(pickedFile.path));
      } else {
        debugPrint('No image selected.');
      }
    });
  }
}
