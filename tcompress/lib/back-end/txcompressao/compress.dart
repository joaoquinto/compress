import 'package:flutter/material.dart';
import 'package:tcompress/back-end/drawer.dart';
import 'package:tcompress/back-end/txcompressao/refer-compress.dart';
import 'package:tcompress/ui/ui-txcompressao/refer.ui-compress.dart';
import 'package:tcompress/ui/ui-txcompressao/view-compress.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Compress extends StatefulWidget {
  @override
  _CompressState createState() => _CompressState();
}

class _CompressState extends State<Compress> {
  final asset = "images/compress/cilindro.png";
  final asset1 = "images/compress/Tc.gif";
  final asset2 = "images/compress/Vcam.png";

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
                          subtitle: Text("Versão 1.0.0"),
                          onTap: () {
                            github();
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.share,
                              color: Color.fromRGBO(69, 170, 242, 1.0)),
                          title: Text("Versão Mobile ANDROID"),
                          subtitle: Text("Ainda sem responsividade."),
                          onTap: () {
                            drive();
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.share,
                            color: Color.fromRGBO(69, 170, 242, 1.0),
                          ),
                          title: Text("Versão Web"),
                          subtitle: Text("Ainda sem responsividade."),
                          onTap: () {
                            webApp(context);
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
                minHeight: 50.0,
                maxHeight: 390,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
                panel: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: explainTextWithImg(
                            "Volume do Cilindro", asset, 200.0, 200, 0.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: explainText(
                            "Como todo sólido geométrico o cilindro possui volume. O volume de um cilindro é dado através da multiplicação da área da base pela altura. O cilindro está presente em diversas situações cotidianas pela sua capacidade de armazenamento de substâncias, por exemplo, botijão de gás, reservatório de água ou combustível entre outros. As duas bases de um cilindro possuem a forma circular e a área do círculo é determinada pela expressão π*r². Assim temos que o volume do cilindro é dado pela seguinte expressão matemática:",
                            308,
                            0.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: explainTextWithImg(
                            "Volume da Câmara de Combustão",
                            asset2,
                            500,
                            250,
                            0.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: explainText(
                            "Feita em duas etapas: medição do volume da câmara e medição do volume da junta.Medição do volume da câmara de combustão: Com o cabeçote fora do motor, prenda-o em uma morsa, mantendo-o perfeitamente nivelado e com as câmares de combustão voltadas para cima. Utilizando uma seringa de 10ml cheia de água ou gasolina, injete a quantidade de líquido suficiente para preencher completamente a câmara de combustão, até nivelá-la com o restante do cabeçote. Anote o volume encontrado com a precisão de uma casa decimal",
                            300,
                            0.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: explainText(
                            "Medição do volume da junta do cabeçote: utilizando um paquimetro, meça o diâmetro interno do anel metálico da junta do cabeçote e meça a espessura da junta, anote os valores e utilize a fórmula acima para calcular o volume da junta. Anote o volume encontrado com a precisão de uma casa decimal (ex. 10,5cm3). Esse valor deverá ser SOMADO ao valor encontrado na medição do volume da câmara de combustão ",
                            300,
                            0.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: explainTextWithImg(
                            "Taxa de Compressão", asset1, 270, 250, 0.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: explainText(
                            "A taxa de compressão é um conceito intrínseco aos motores a combustão interna. É um valor numérico adimensional representando a proporção entre o volume aspirado somado ao volume da câmara de combustão em relação ao volume da câmara de combustão. Por exemplo, quando se diz que um motor possui uma taxa de compressão de 10:1 significa que a razão entre o volume do cilindro quando o pistão se encontra no Ponto Morto Inferior e quando se encontra no Ponto Morto Superior é igual a 10/ A Taxa de compressão e denominada pela quantidade de ar que passa pelo carburador.",
                            360,
                            0.0),
                      ),
                    ],
                  ),
                ),
                collapsed: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0)),
                      color: Color.fromRGBO(52, 73, 94, 1.0)),
                  child: Center(
                    child: Text(
                      "Referências Estudantis",
                      style: TextStyle(color: Colors.white),
                    ),
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
                      FutureBuilder(
                        future: valida(),
                        builder: (context, AsyncSnapshot<bool> snapshot) {
                          if (snapshot.hasData) {
                            return buildButtonHelp(snapshot.data, context);
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ],
                  ),
                ))));
  }
}
