import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            FutureBuilder(
              future: Clipboard.getData('text/plain'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.text);
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
