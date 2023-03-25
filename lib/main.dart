import 'package:flutter/material.dart';
import 'package:projeto_daily/cadastro.dart';
import 'package:projeto_daily/calendario.dart';
import 'package:projeto_daily/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu aplicativo',
      theme: ThemeData.dark(),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
