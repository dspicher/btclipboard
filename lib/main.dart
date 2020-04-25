import 'package:btc_address_validate/btc_address_validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:btclipboard/btc_string.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SelectableText(
              'This is what is in the clipboard',
            ),
            FutureBuilder<ClipboardData>(
              future: Clipboard.getData('text/plain'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var network = btcString(snapshot.data.text);
                  if (network == null) {
                    return Column(
                      children: [
                        Text('no BTC String:'),
                        Text(snapshot.data.text),
                      ],
                    );
                  }
                  var infix = "";
                  if (network == Network.testnet) {
                    infix = "testnet/";
                  }
                  var url = "https://blockstream.info/" +
                      infix +
                      "search?q=" +
                      snapshot.data.text;

                  return Column(
                    children: [
                      Text(snapshot.data.text),
                      RaisedButton(
                        onPressed: () => _launchURL(url),
                        child: Text("Search"),
                      ),
                    ],
                  );
                } else {
                  return Text('nothing');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
