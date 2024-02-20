import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class MemeGeneratorScreen extends StatefulWidget {
  const MemeGeneratorScreen({Key? key}) : super(key: key);

  @override
  State<MemeGeneratorScreen> createState() => _MemeGeneratorScreenState();
}

class _MemeGeneratorScreenState extends State<MemeGeneratorScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  String _displayText = 'Ваш текст может быть здесь';
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
                        Text(_displayText,
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
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Enter Text',
                labelStyle: theme.textTheme.titleMedium,
                border: const OutlineInputBorder(),
                fillColor: Colors.white,
              ),
              style: theme.textTheme.bodyMedium,
              onChanged: (text) {
                setState(() {
                  _displayText = text;
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
                  onPressed: _capturePng,
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

  Future<void> _capturePng() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    final directory = await getTemporaryDirectory();
    final imagePath = await File('${directory.path}/image.png').create();
    await imagePath.writeAsBytes(pngBytes);

    await Share.shareXFiles([XFile(imagePath.path)],
        text: 'Посмотри на мой скриншот!');
  }
}
