import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recipeai/screen/homescreen.dart';
import 'package:recipeai/workingcomps/themes.dart';

Future<void> main() async {
  await dotenv.load();
  runApp( MyApp());  
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light ;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RecepAi',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      themeMode: _themeMode,
      
      home: Homescreen(onThemeChanged: _toggletheme, themeMode: _themeMode,),
  
      );
  }

  void _toggletheme(){
    setState(() {
       _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

}
      