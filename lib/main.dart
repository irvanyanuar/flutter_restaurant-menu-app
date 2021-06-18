import 'package:flutter/material.dart';
import 'package:flutter_pemesanan_menu/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pemesanan Menu',
      theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.redAccent,
          primarySwatch: Colors.red,
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
          )),
      home: LoginScreen(),
    );
  }
}
