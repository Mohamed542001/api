import 'package:api/screens/Login/LoginImports.dart';
import 'package:api/utilities/dio_helper/DioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {

  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark
          )

        )
      ),
      debugShowCheckedModeBanner: false,
      home: const Login(),
    );
  }
}


