import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recipeai/screen/homescreen.dart';
import 'package:recipeai/workingcomps/themes.dart';

Future<void> main() async {
  await dotenv.load();
  runApp( MyApp());  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RecepAi',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      themeMode: ThemeMode.dark,
      //themeMode: ThemeMode.light,
      home: Homescreen(),
  
      );
  }
}
        