import 'package:flutter/material.dart';
import 'package:meme_generator/core/theme/custom_theme.dart';
import 'package:meme_generator/screen/meme_generator_many_pictires.dart';
import 'package:meme_generator/screen/meme_generator_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const MemeGeneratorScreenSecondText(),
    );
  }
}
