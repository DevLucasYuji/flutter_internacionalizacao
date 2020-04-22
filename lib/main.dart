import 'package:flutter/material.dart';
import 'package:flutter_internacionalizacao/generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
      ],
      title: "Flutter",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "Flutter internacionalização"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _setLocale(String language) {
    setState(() {
      S.load(Locale(language));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.of(context).hello("Lucas"),
              style: TextStyle(fontSize: 30),
            ),
            Text(
              S.of(context).yearsOld(20),
              style: TextStyle(fontSize: 30),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text('Português'),
                  onPressed: () => _setLocale('pt'),
                ),
                RaisedButton(
                  child: Text('Inglês'),
                  onPressed: () => _setLocale('en'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
