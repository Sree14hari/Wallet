import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet/constants/colors.dart';

class Profiletap extends StatefulWidget {
  const Profiletap({super.key});

  @override
  State<Profiletap> createState() => _ProfiletapState();
}

class _ProfiletapState extends State<Profiletap> {
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _loadImage();
    // Set status bar color when widget loads
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Wcolors.primary,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  //FUNCTION TO LOAD IMAGE PATH FROM SHARED PREFERENCES
  Future<void> _loadImage() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      _imagePath = pref.getString('profileImage');
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final pref = await SharedPreferences.getInstance();
      await pref.setString('profileImage', pickedFile.path);
      setState(() {
        _imagePath = pickedFile.path;
      });
    }

    // Wait for the picker to close, then restore the status bar color
    Future.delayed(const Duration(milliseconds: 300), () {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Wcolors.primary,
          statusBarIconBrightness: Brightness.light,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Wcolors.primary,
        statusBarIconBrightness: Brightness.light,
      ),
      child: GestureDetector(
        onTap: _pickImage,
        child: CircleAvatar(
          backgroundColor: Wcolors.primary,
          radius: 20,
          backgroundImage:
              _imagePath != null ? FileImage(File(_imagePath!)) : null,
          child:
              _imagePath == null
                  ? const Icon(
                    Icons.account_circle,
                    size: 30,
                    color: Wcolors.text,
                  )
                  : null,
        ),
      ),
    );
  }
}
