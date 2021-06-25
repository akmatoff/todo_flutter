import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:todo_flutter/screens/home.dart';
import 'package:todo_flutter/config/style.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: backgroundColor),
          fontFamily: GoogleFonts.lato().fontFamily,
          textTheme: GoogleFonts.latoTextTheme(),
          scaffoldBackgroundColor: backgroundColor,
        ),
        home: Home());
  }
}
