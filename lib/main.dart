import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet/app.dart';
import 'package:wallet/constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Wcolors.primary,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(MyApp());
}
