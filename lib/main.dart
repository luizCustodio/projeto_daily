import 'package:flutter/material.dart';
import 'package:projeto_daily/cadastro.dart';
import 'package:projeto_daily/calendario.dart';
import 'package:projeto_daily/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkModeEnabled = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu aplicativo',
      theme: isDarkModeEnabled
          ? ThemeData.dark().copyWith(
              primaryColor: Colors.cyan.shade400,
              colorScheme:
                  ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
            )
          : ThemeData(
              primaryColor: Colors.cyan.shade400,
              colorScheme:
                  ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
            ),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}