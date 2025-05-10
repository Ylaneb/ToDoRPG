import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final pixelText = GoogleFonts.pressStart2pTextTheme(
      ThemeData.dark().textTheme,
    ).apply(
      bodyColor: Colors.greenAccent,
      displayColor: Colors.greenAccent,
    );

    return MaterialApp(
      title: 'Gamified To-Do',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          primary: Colors.greenAccent,
          secondary: Colors.greenAccent,
        ),
        textTheme: pixelText,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'PressStart2P',
            fontSize: 14,
            color: Colors.greenAccent,
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          side: MaterialStateBorderSide.resolveWith(
            (_) => const BorderSide(color: Colors.greenAccent, width: 2),
          ),
          fillColor: MaterialStateProperty.all(Colors.greenAccent),
          checkColor: MaterialStateProperty.all(Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent,
            foregroundColor: Colors.black,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            textStyle: const TextStyle(fontFamily: 'PressStart2P', fontSize: 10),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.greenAccent, width: 2),
          ),
          labelStyle: TextStyle(
            fontFamily: 'PressStart2P',
            fontSize: 10,
            color: Colors.greenAccent,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
