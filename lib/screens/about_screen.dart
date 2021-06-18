import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Created By:"),
            Container(
              width: 100,
              child: Image.network(
                  "https://irvanyanuar.github.io/assets/img/IYR-logo.png"),
            ),
            Text(
              "Muhammad Irvan Yanuar",
              style: TextStyle(fontFamily: 'Enclave', fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text("https://github.com/irvanyanuar/"),
          ],
        ),
      ),
    );
  }
}
