import 'package:flutshop/global_variables.dart';
import 'package:flutshop/home_page.dart';
import 'package:flutshop/product_details_page.dart';
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
                appBarTheme: AppBarTheme(
                    titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                    ),
                    centerTitle: true,
                ),
                inputDecorationTheme: InputDecorationTheme(
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                    ),
                    prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
                ),
                textTheme: TextTheme(
                    titleLarge: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                    titleMedium: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                    ),
                    bodySmall: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                    )
                ),
                useMaterial3: true,
            ),
            home: HomePage(),
        );
    }
}