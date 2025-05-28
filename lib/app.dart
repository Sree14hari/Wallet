import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet/constants/colors.dart';
import 'package:wallet/widgets/profiletap.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});

  final ThemeData theme = ThemeData(
    primaryColor: Wcolors.primary,
    scaffoldBackgroundColor: Wcolors.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: Wcolors.primary,
      foregroundColor: Wcolors.text,
    ),
  );

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Wcolors.primary,
        statusBarIconBrightness: Brightness.light,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wallet App',
        theme: ThemeData(
          primaryColor: widget.theme.primaryColor,
          scaffoldBackgroundColor: widget.theme.scaffoldBackgroundColor,
          appBarTheme: widget.theme.appBarTheme,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Wallet',
              style: TextStyle(
                color: Wcolors.text,
                fontSize: 30,
                fontWeight: FontWeight.w600,
                fontStyle: GoogleFonts.roboto().fontStyle,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Profiletap(),
              ),
            ],
          ),
          body: const Center(child: Text('Welcome to the Wallet App!')),
        ),
      ),
    );
  }
}
