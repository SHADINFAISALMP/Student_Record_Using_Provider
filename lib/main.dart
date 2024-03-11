// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_10/controllerss/add_student_controller.dart';
import 'package:sqflite_10/controllerss/bottom_controller.dart';
import 'package:sqflite_10/controllerss/edit_controller.dart';
import 'package:sqflite_10/controllerss/student_controller.dart';

import 'package:sqflite_10/database/db_functions.dart';
import 'package:sqflite_10/screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AddstudentController()),
    ChangeNotifierProvider(create: (context) => Editcontroller()),
    ChangeNotifierProvider(create: (context) => StudentController()),
    ChangeNotifierProvider(create: (context) => BottomController()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
