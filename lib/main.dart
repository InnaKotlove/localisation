// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Locale loc = const Locale('ru', '');

  void changeLocale(String localeName) {
    setState(() {
      loc = Locale(localeName, '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: loc,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ru', ''),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomeWidget(app: this),
      },
    );
  }
}

class MyHomeWidget extends StatelessWidget {
  final MyAppState app;

  const MyHomeWidget({Key? key, required this.app}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var translation = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          MaterialButton(
            color: Colors.green,
            shape: const CircleBorder(),
            onPressed: () {
              app.changeLocale('en');
            },
            child: Text(
              'En',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          MaterialButton(
            color: Colors.green,
            shape: const CircleBorder(),
            onPressed: () {
              app.changeLocale('ru');
            },
            child: Text(
              'Ru',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
        title: Text(translation.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.network(
                        'https://i.pinimg.com/originals/a1/90/5c/a1905c3d2adac96c9e9c094dccafc857.jpg'),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translation.winnieName,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('Jan 17, 2022'),
                      Text('4 Jars - USD20'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
