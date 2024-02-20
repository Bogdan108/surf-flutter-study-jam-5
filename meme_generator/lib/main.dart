import 'package:flutter/material.dart';
import 'package:meme_generator/core/theme/custom_theme.dart';
import 'package:meme_generator/screen/meme_generator_many_pictires.dart';
import 'package:meme_generator/screen/meme_generator_screen.dart';
import 'package:meme_generator/screen/samples_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/detail_page_double_text': (context) =>
            const MemeGeneratorScreenSecondText(),
        '/detail_page_single_picture': (context) => const MemeGeneratorScreen(),
      },
    );
  }
}
