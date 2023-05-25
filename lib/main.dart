import 'package:flutter/material.dart';
import 'package:to_do_app/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'To Do app',
      routes:{
        Home.routeName:(_)=>Home(),

      },
initialRoute: Home.routeName,

    );
  }
}

