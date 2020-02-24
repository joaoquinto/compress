import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tcompress/back-end/txcompressao/compress.dart';

void main() => runApp(
      MaterialApp(home: Home()),
    );

class Home extends StatelessWidget {
  final asset = "images/compress/eng.png";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(
          seconds: 5,
          navigateAfterSeconds: Compress(),
          image: Image.asset(asset),
          photoSize: 150,
          backgroundColor: Color.fromRGBO(41, 128, 185, 1.0),
          loaderColor: Colors.black,
          loadingText: Text("Aguarde um momento..."),
        ),
      ),
    );
  }
}
