import 'package:flutshop/cart_provider.dart';
import 'package:flutshop/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

// Provider (read-only value)
// ChangeNotifierProvider (we can change the value and notify the widgets listening about the change)
// FutureProvider (listen to futures and subscribe to them)
// StreamProvider (listen to stream and subscribe to them)
// MultiProvider (adding multiple providers)

class MyApp extends StatelessWidget{
    const MyApp({super.key});

    @override
    Widget build(BuildContext context){
        return ChangeNotifierProvider(
            create: (context) => CartProvider(),
          child: MaterialApp(
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
          ),
        );
    }
}