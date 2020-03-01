import 'package:flutter/material.dart';
import 'package:tcompress/back-end/drawer.dart';
import 'package:tcompress/back-end/txcompressao/compress.dart';
import 'package:tcompress/ui/ui-txcompressao/refer.ui-compress.dart';

class Refer extends StatelessWidget {
  final asset = "images/compress/cilindro.png";
  final asset1 = "images/compress/Tc.gif";
  final asset2 = "images/compress/Vcam.png";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        home: Scaffold(
            appBar: AppBar(
              title: Text("Referências Estudantis",
                  style: TextStyle(fontSize: 19.5)),
              centerTitle: true,
              backgroundColor: Color.fromRGBO(
                41,
                128,
                185,
                1.0,
              ),
              elevation: 0.0,
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
                      leading: Icon(
                        Icons.new_releases,
                      ),
                    ),
                  ),
                  ExpansionTile(
                    title: Text("Sobre"),
                    leading: Icon(Icons.info),
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.share,
                          color: Color.fromRGBO(69, 170, 242, 1.0),
                        ),
                        title: Text("GitHub Code"),
                        subtitle: Text("Versão 1.0"),
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
                ],
              ),
            ),
            backgroundColor: Color.fromRGBO(69, 170, 242, 1.0),
            body: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: explainTextWithImg(
                      "Volume do Cilindro", asset, 200.0, 200),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: explainText(
                      "Como todo sólido geométrico o cilindro possui volume. O volume de um cilindro é dado através da multiplicação da área da base pela altura. O cilindro está presente em diversas situações cotidianas pela sua capacidade de armazenamento de substâncias, por exemplo, botijão de gás, reservatório de água ou combustível entre outros. As duas bases de um cilindro possuem a forma circular e a área do círculo é determinada pela expressão π*r². Assim temos que o volume do cilindro é dado pela seguinte expressão matemática:",
                      308),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: explainTextWithImg(
                      "Volume da Câmara de Combustão", asset2, 500, 250),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: explainText(
                      "Feita em duas etapas: medição do volume da câmara e medição do volume da junta.Medição do volume da câmara de combustão: Com o cabeçote fora do motor, prenda-o em uma morsa, mantendo-o perfeitamente nivelado e com as câmares de combustão voltadas para cima. Utilizando uma seringa de 10ml cheia de água ou gasolina, injete a quantidade de líquido suficiente para preencher completamente a câmara de combustão, até nivelá-la com o restante do cabeçote. Anote o volume encontrado com a precisão de uma casa decimal",
                      300),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: explainText(
                      "Medição do volume da junta do cabeçote: utilizando um paquimetro, meça o diâmetro interno do anel metálico da junta do cabeçote e meça a espessura da junta, anote os valores e utilize a fórmula acima para calcular o volume da junta. Anote o volume encontrado com a precisão de uma casa decimal (ex. 10,5cm3). Esse valor deverá ser SOMADO ao valor encontrado na medição do volume da câmara de combustão ",
                      300),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: explainTextWithImg(
                      "Taxa de Compressão", asset1, 270, 250),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: explainText(
                      "A taxa de compressão é um conceito intrínseco aos motores a combustão interna. É um valor numérico adimensional representando a proporção entre o volume aspirado somado ao volume da câmara de combustão em relação ao volume da câmara de combustão. Por exemplo, quando se diz que um motor possui uma taxa de compressão de 10:1 significa que a razão entre o volume do cilindro quando o pistão se encontra no Ponto Morto Inferior e quando se encontra no Ponto Morto Superior é igual a 10/ A Taxa de compressão e denominada pela quantidade de ar que passa pelo carburador.",
                      360),
                ),
              ],
            ))));
  }
}
