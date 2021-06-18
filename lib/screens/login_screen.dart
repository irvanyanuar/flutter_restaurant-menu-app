import 'package:flutter/material.dart';
import 'package:flutter_pemesanan_menu/models/User.dart';
import 'package:flutter_pemesanan_menu/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _text = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: (orientation == Orientation.landscape) ? 500 : double.infinity,
          child: (orientation == Orientation.landscape)
              ? SingleChildScrollView(
                  child: formLogin(context, orientation),
                )
              : formLogin(context, orientation),
        ),
      ),
    );
  }

  Padding formLogin(BuildContext context, Orientation orientation) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (orientation == Orientation.landscape)
              ? SizedBox(
                  height: 50,
                )
              : Container(),
          Image.asset(
            'images/main-icon.png',
            width: 50,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Restaurant Menu',
            style: TextStyle(fontSize: 30, fontFamily: 'Menu Hollow'),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _text,
            decoration: InputDecoration(
              hintText: "Masukkan Nama Anda",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              errorText: _validate ? 'Nama harus diisi' : null,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {
                setState(() {
                  if (_text.text.isEmpty) {
                    _validate = true;
                  } else {
                    User.name = _text.text;
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }));
                  }
                });
              },
              child: Text('Masuk'),
            ),
          ),
        ],
      ),
    );
  }
}
