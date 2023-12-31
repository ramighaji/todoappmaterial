import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/presentation/home_page.dart';

Future<void> main() async {
  // init the hive
  await Hive.initFlutter();
  // init a box
   var myBox = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      
      home: HomePage()
    );
  }
}


