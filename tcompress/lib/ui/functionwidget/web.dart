import 'package:flutter/material.dart';

// Função de Alerta de erro.
Widget buildWebAlert() {
  return AlertDialog(
    title: Center(
      child: Text("Informativo"),
    ),
    content: Container(
      height: 150,
      child: Center(
        child: Text("Confira se você tem instalado um aplicativo de email"),
      ),
    ),
  );
}

Widget buildWebAlertshare() {
  return AlertDialog(
      title: Center(
        child: Text("AVISO"),
      ),
      content: Container(
          height: 100,
          child: Center(
              child: Text("Você já está na versão web",
                  style: TextStyle(fontWeight: FontWeight.bold)))));
}
