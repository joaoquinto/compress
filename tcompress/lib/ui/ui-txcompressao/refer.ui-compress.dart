import 'package:flutter/material.dart';

Widget explainText(String title, double elevation) {
  return SizedBox(
    width: double.infinity,
    child: Card(
      elevation: elevation,
      child: Column(
        children: <Widget>[
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 7.0),
            child: Text(
              "$title",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          )),
        ],
      ),
    ),
  );
}

Widget explainTextWithImg(
    String title, String img, double tamanho, heigthcard, double elevation) {
  return SizedBox(
    width: double.infinity,
    height: 170,
    child: Card(
      elevation: elevation,
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


// Bug No Align do texto e não funciona no Web.
Widget richText01(BuildContext context, String boldtext, String text) {
  return SizedBox(
    width: double.infinity,
    child: Card(
      child: Column(
        children: <Widget>[
          SelectableText.rich(TextSpan(children: <TextSpan>[
            TextSpan(
                text: boldtext,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            TextSpan(
              text: text,
              style: TextStyle(fontSize: 17, color: Colors.black),
            )
          ]))
        ],
      ),
    ),
  );
}
