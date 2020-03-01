import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:tcompress/ui/functionwidget/web.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> drive() async {
  if (kIsWeb) {
    driveWebapp();
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
driveWebapp() async {
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
    githubWeb();
  } else {
    await FlutterShare.share(
        title: 'GitHub Code',
        text: 'GitHub Code',
        linkUrl: 'https://github.com/joaoquinto/compress');
  }
}

// Para o uso no Flutter WEB
githubWeb() async {
  final urlG = "https://github.com/joaoquinto/compress";

  if (await canLaunch(urlG)) {
    await launch(urlG);
  } else {
    throw "O link $urlG não pode ser acessado";
  }
}

launchUrl(BuildContext context) async {
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

Future<void> webApp(BuildContext context) async {
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
