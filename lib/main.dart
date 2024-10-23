import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_notifier.dart';
import 'package:shop_app_flutter/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Shop App',
        theme: ThemeData(
          fontFamily: 'SpaceGrotesk',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: const Color.fromRGBO(254, 206, 1, 1),
          ),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
            fontFamily: 'SpaceGrotesk',
            fontSize: 20,
            color: Colors.black,
          )),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontFamily: 'SpaceGrotesk',
              fontWeight: FontWeight.w600,
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontFamily: 'SpaceGrotesk',
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
            titleMedium: TextStyle(
              fontFamily: 'SpaceGrotesk',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontFamily: 'SpaceGrotesk',
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
