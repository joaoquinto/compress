import 'package:flutter/material.dart';

Widget explainText(String title, double tamanho) {
  return SizedBox(
    width: double.infinity,
    height: tamanho,
    child: Card(
      elevation: 15,
      child: Column(
        children: <Widget>[
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 7.0),
            child: Text(
              "$title",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, ),
            ),
          )),
        ],
      ),
    ),
  );
}

Widget explainTextWithImg(String title, String img, double tamanho, heigthcard) {
  return SizedBox(
    width: double.infinity,
    height: 170,
    child: Card(
      elevation: 15,
      child: Column(
        children: <Widget>[
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 7.0),
            child: Text(
              "$title",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          )),
          Center(
            child: Image.asset(
              "$img",
              width: tamanho,
            ),
          ),
        ],
      ),
    ),
  );
}
