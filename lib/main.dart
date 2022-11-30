import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_master/constants/colors.dart';
import 'package:todo_master/screens/HomePage.dart';

void main() {
  runApp(const AppEntryPoint());
}

class AppEntryPoint extends StatelessWidget {
  const AppEntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: "Todo Master",
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        iconTheme: const IconThemeData(color: tdBlack),
        textTheme: GoogleFonts.poppinsTextTheme(),
        backgroundColor: tdBgColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: tdBgColor,
        ),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
