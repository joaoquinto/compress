import 'package:flutter/material.dart';

// Função de Alerta de erro.
Widget buildWebAlert() {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      title: Center(
        child: Text(
          "AVISO",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      content: Container(
          height: 100,
          child: Center(
              child: Text("Você já está na versão web",
                  style: TextStyle(fontWeight: FontWeight.bold)))));
}
