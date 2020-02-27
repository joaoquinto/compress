import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tcompress/back-end/txcompressao/refer-compress.dart';
import 'package:tcompress/ui/functionwidget/web.dart';
import 'package:tcompress/ui/ui-txcompressao/refer.ui-compress.dart';
import 'package:tcompress/ui/ui-txcompressao/view-compress.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_share/flutter_share.dart';

class Compress extends StatefulWidget {
  @override
  _CompressState createState() => _CompressState();
}

class _CompressState extends State<Compress> {
  final asset1 = "images/compress/Tc.gif";

  Future<void> share() async {
    if (kIsWeb) {
      _driveWebapp();
    } else {
      await FlutterShare.share(
          title: 'Compartilhamente do Tcompress',
          text: 'Aplicativo Tcompress',
          linkUrl:
              'https://drive.google.com/drive/folders/1nZY8gpscFXMVDNcsf_R8xGvdjDKjN24e?usp=sharing',
          chooserTitle: 'Compartilhamente do Tcompress');
    }
  }

  // Para o uso no Flutter WEB
  _driveWebapp() async {
    final url =
        'https://drive.google.com/drive/folders/1nZY8gpscFXMVDNcsf_R8xGvdjDKjN24e?usp=sharing';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw " O link $url não pode ser acessado";
    }
  }

  Future<void> github() async {
    if (kIsWeb) {
      _githubWeb();
    } else {
      await FlutterShare.share(
          title: 'GitHub Code',
          text: 'GitHub Code',
          linkUrl: 'https://github.com/joaoquinto/compress');
    }
  }

  // Para o uso no Flutter WEB
  _githubWeb() async {
    final urlG = "https://github.com/joaoquinto/compress";

    if (await canLaunch(urlG)) {
      await launch(urlG);
    } else {
      throw "O link $urlG não pode ser acessado";
    }
  }

  _launchUrl() async {
    final email = "mailto:joaovictoroliveirapereira6522@gmail.com";

    if (await canLaunch(email)) {
      await launch(email);
    } else {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return buildWebAlert();
          });
    }
  }

  void _resetFields() {
    raioController.text = "";
    alturaController.text = "";
    volumeCamaraController.text = "";
    volumeJuntaCabecoteController.text = "";
  }

  void _txCompressao() {
    setState(() {
      //Volume do Cilindro
      final double pi = 3.14;
      double r = double.parse(raioController.text);
      double h = double.parse(alturaController.text);
      double vCilindro = (pi * r * r) * h;

      // Volume da Câmara de Combustão
      double vCamara = double.parse(volumeCamaraController.text);
      double vJunta = double.parse(volumeJuntaCabecoteController.text);
      double vCamaraCombustao = vCamara + vJunta;

      // Taxa de Compressão
      double tC = (vCilindro + vCamaraCombustao) / vCamaraCombustao;

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return buildAlertDiaolg(vCilindro, vCamaraCombustao, tC);
          });
    });
  }

  Future<void> webApp() async {
    if (kIsWeb) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return buildWebAlertshare();
          });
    } else {
      await FlutterShare.share(
          title: "Link para a versão Web",
          text: 'Link para a versão Web',
          linkUrl: 'https://joaoquinto.github.io/compress/web/index.html#/');
    }
  }

  final TextEditingController raioController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
  final TextEditingController volumeCamaraController = TextEditingController();
  final TextEditingController volumeJuntaCabecoteController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                "Taxa de Compressão",
                style: TextStyle(fontSize: 19.5),
              ),
              centerTitle: true,
              backgroundColor: Color.fromRGBO(
                41,
                128,
                185,
                1.0,
              ),
              elevation: 0.0,
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      _resetFields();
                    })
              ],
            ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    child: Text(
                      "Menu",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(41, 128, 185, 1.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ExpansionTile(
                      title: Text("Compressão"),
                      leading: Icon(
                        Icons.settings,
                      ),
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.directions_car,
                            color: Color.fromRGBO(69, 170, 242, 1.0),
                          ),
                          title: Text("Taxa de Compressão"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Compress()),
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.book,
                              color: Color.fromRGBO(69, 170, 242, 1.0)),
                          title: Text("Referências Estudantis"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Refer()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ExpansionTile(
                      title: Text("Novo Módulo"),
                      leading: Icon(Icons.new_releases),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ExpansionTile(
                      title: Text("Sobre"),
                      leading: Icon(Icons.info),
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.share,
                            color: Color.fromRGBO(69, 170, 242, 1.0),
                          ),
                          title: Text("GitHub Code"),
                          onTap: () {
                            github();
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.share,
                              color: Color.fromRGBO(69, 170, 242, 1.0)),
                          title: Text("Versão Mobile ANDROID"),
                          onTap: () {
                            share();
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.share,
                            color: Color.fromRGBO(69, 170, 242, 1.0),
                          ),
                          title: Text("Versão Web"),
                          onTap: () {
                            webApp();
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            backgroundColor: Color.fromRGBO(69, 170, 242, 1.0),
            body: SlidingUpPanel(
                backdropEnabled: true,
                minHeight: 22.0,
                maxHeight: 200,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
                panel: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: explainTextWithImg(
                            "Taxa de Compressão", asset1, 270, 250),
                      ),
                    ],
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      textTitle("Volume do Cilindro"),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: buildTextField("Raio", raioController),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: buildTextField("Altura", alturaController),
                            ),
                          ],
                        ),
                      ),
                      textTitle("Volume da Câmara de Combustão"),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: buildTextField(
                                  "Câmara", volumeCamaraController),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: buildTextField(
                                    "Junta", volumeJuntaCabecoteController))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.5,
                      ),
                      builResult(_txCompressao),
                      SizedBox(
                        height: 5.5,
                      ),
                      buildButtonHelp(_launchUrl),
                    ],
                  ),
                ))));
  }
}
