import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MemeGeneratorScreenSecondText extends StatefulWidget {
  const MemeGeneratorScreenSecondText({Key? key}) : super(key: key);

  @override
  State<MemeGeneratorScreenSecondText> createState() =>
      _MemeGeneratorScreenState();
}

class _MemeGeneratorScreenState extends State<MemeGeneratorScreenSecondText> {
  final TextEditingController _textEditingControllerUpper =
      TextEditingController();
  final TextEditingController _textEditingControllerLower =
      TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  String _displayTextUpper = 'Ваш текст может быть здесь';
  String _displayTextLower = 'Ваш текст может быть здесь';

  Image? _image = Image.network(
      'https://i.cbc.ca/1.6713656.1679693029!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_780/this-is-fine.jpg');
  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final decoration = BoxDecoration(
      border: Border.all(
        color: theme.colorScheme.primary,
        width: 2,
      ),
    );
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: ListView(
          children: [
            RepaintBoundary(
              key: globalKey,
              child: ColoredBox(
                color: theme.colorScheme.background,
                child: DecoratedBox(
                  decoration: decoration,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        DecoratedBox(
                          decoration: decoration,
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
                              Text(_displayTextUpper,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.titleLarge),
                            ],
                          ),
                        ),
                        Text(_displayTextLower,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyLarge),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _textEditingControllerUpper,
              decoration: InputDecoration(
                labelText: 'Enter Upper Text',
                labelStyle: theme.textTheme.titleMedium,
                border: const OutlineInputBorder(),
                fillColor: Colors.white,
              ),
              style: theme.textTheme.bodyMedium,
              onChanged: (text) {
                setState(() {
                  _displayTextUpper = text;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _textEditingControllerLower,
              decoration: InputDecoration(
                labelText: 'Enter Lower Text',
                labelStyle: theme.textTheme.titleMedium,
                border: const OutlineInputBorder(),
                fillColor: Colors.white,
              ),
              style: theme.textTheme.bodyMedium,
              onChanged: (text) {
                setState(() {
                  _displayTextLower = text;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: 'Enter URL',
                labelStyle: theme.textTheme.titleMedium,
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: theme.colorScheme.background)),
              ),
              style: theme.textTheme.bodyMedium,
              onChanged: (url) {
                setState(() {
                  _image = Image.network(url);
                });
              },
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    getImage();
                  },
                  child: Text(
                    'Pick Image from Gallery',
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: decoration,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
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
