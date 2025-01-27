import 'package:flutshop/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
    const MyApp({super.key});

    @override
    Widget build(BuildContext context){
        return MaterialApp(
            title: "Shopping App",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                fontFamily: "Lato",
                colorScheme: ColorScheme.fromSeed(
                    seedColor: Color.fromRGBO(254, 206, 1, 1),
                    primary: Color.fromRGBO(254, 206, 1, 1),
                ),
                inputDecorationTheme: InputDecorationTheme(
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                    ),
                    prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
                ),
            ),
            home: HomePage(),
        );
    }
}