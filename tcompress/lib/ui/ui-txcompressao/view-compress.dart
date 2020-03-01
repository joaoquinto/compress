import 'package:flutter/material.dart';

// Inputs
Widget buildTextField(String label, TextEditingController controller) {
  return TextFormField(
    keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
    controller: controller,
    decoration: InputDecoration(
      //filled: false, BGcolor de input
      //fillColor: Color.fromRGBO(69, 170, 242, 0.0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 40.0),
      focusColor: Colors.black,
      labelText: "$label",
      labelStyle: TextStyle(color: Colors.white),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 3.0)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      border: OutlineInputBorder(
        borderRadius: (BorderRadius.all(Radius.circular(5.0))),
      ),
    ),
  );
}

// Button help
Widget buildButtonHelp(dynamic onchanged) {
  return Column(
    children: <Widget>[
      Container(
        alignment: Alignment.bottomRight,
        child: IconButton(
          icon: Icon(
            Icons.help,
            color: Colors.white,
            size: 28,
          ),
          onPressed: onchanged,
        ),
      )
    ],
  );
}

// Button de results
Widget builResult(Function onchanged) {
  return ButtonTheme(
    minWidth: 200,
    height: 50,
    child: RaisedButton(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: onchanged,
      child: Text(
        "Resultado",
        style: TextStyle(color: Colors.black),
      ),
    ),
  );
}

// Result Alert
Widget buildAlertDiaolg(double vCilindro, double vCamaraCombustao, double tC) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    title: Center(
        child: Text("Taxa De compressão",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ))),
    content: Container(
      height: 200,
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              "Volume do Cilindro: ",
              style: TextStyle(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
            ),
          ),
          Text("${vCilindro.toStringAsFixed(1)}m³",
              style: TextStyle(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
          Divider(color: Colors.black),
          Text("Câmara de Combustão: ",
              style: TextStyle(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
          Text("${vCamaraCombustao.toStringAsFixed(1)}m³",
              style: TextStyle(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
          Divider(color: Colors.black),
          Text("Taxa de Compressão:",
              style: TextStyle(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
          Text("${tC.toStringAsFixed(1)} : 1",
              style: TextStyle(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

// Text title
Widget textTitle(String title) {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Text("$title",
          style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.normal,
              fontSize: 18.0,
              fontWeight: FontWeight.bold)),
    ),
  );
}
