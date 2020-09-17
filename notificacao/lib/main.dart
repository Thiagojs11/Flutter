import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notificacao/page/second_page.dart';
import 'package:notificacao/sistemas.dart';
import 'package:notificacao/widget/local_notification_widget.dart';

import 'api/api.dart';
import 'local_notications_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String appTitle = 'Local Notifications';
  var sistemas = new List<Sistema>();
  final notifications = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();

    final settingsAndroid = AndroidInitializationSettings('app_icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async => await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondPage(payload: payload)),
      );

  _getSistemas() {
    API.getSistemas().then((response) {
      setState(() {
        var source = Utf8Decoder().convert(response.bodyBytes);
        Iterable lista = json.decode(source);
        sistemas = lista.map((model) => Sistema.fromJson(model)).toList();
        

        if (lista.isEmpty) {

        }
        else{
          showSilentNotification(notifications,
                  title: 'Sistemas', 
                  body: sistemas[0].sistemaProc.descricao.toString(), 
                  id: 30);
        }
      });
    });
  }

  _MyAppState() {
    _getSistemas();
  }

  @override
  Widget build(BuildContext context) {
    // Timer para atualização
    Timer.periodic(Duration(seconds: 30), (timer) {
      _getSistemas();
    });

    return MaterialApp(
      title: appTitle,
      home: MainPage(appTitle: appTitle),
    );
  }
}

class MainPage extends StatelessWidget {
  final String appTitle;

  const MainPage({this.appTitle});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LocalNotificationWidget(),
        ),
      );
}
