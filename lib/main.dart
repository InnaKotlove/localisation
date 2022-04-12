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

  Widget _buildLangButton(String lang) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: MaterialButton(
        color: app.loc.languageCode == lang ? Colors.green : Colors.white,
        shape: const CircleBorder(),
        onPressed: () {
          app.changeLocale(lang);
        },
        child: Text(
          lang.toUpperCase(),
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    var translation = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          _buildLangButton('en'),
          _buildLangButton('ru'),
        ],
        title: Text(translation.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyCard(
            image: Image.network(
                'https://i.pinimg.com/originals/a1/90/5c/a1905c3d2adac96c9e9c094dccafc857.jpg'),
            title: translation.winnieName,
            data: translation.born(DateTime(2022, DateTime.january, 17)),
            price: translation.honey(4) + " " + translation.price(20.0),
          ),
          MyCard(
            image: Image.network(
                'https://static.wikia.nocookie.net/disney/images/d/da/Rabbit_Winnie_the_Pooh.jpg/revision/latest/top-crop/width/360/height/450?cb=20170928185405'),
            title: translation.rabbit,
            data: translation.born(DateTime(2021, DateTime.april, 19)),
            price: translation.honey(1) + " " + translation.price(20.0),
          ),
          MyCard(
            image: Image.network(
                'https://sidex.ru/images_offers/330/330744/nakleiki_roommates_rmk1500gm_disney_vinni_pyh_2.jpg'),
            title: translation.tiger,
            data: translation.born(DateTime(2021, DateTime.february, 07)),
            price: translation.honey(2) + " " + translation.price(5.0),
          ),
        ],
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final Image image;
  final String title;
  final String data;
  final String price;

  const MyCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.data,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: image,
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
                Text(data),
                Text(price),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
