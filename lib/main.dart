import 'package:flutter/material.dart';
import 'package:somthn/Francais/F-1.dart';
import 'package:somthn/Francais/F-2-4.dart';
import 'package:somthn/Francais/F-2-5.dart';
import 'package:somthn/Francais/F-3-3.dart';
import 'package:somthn/Francais/F-3-4.dart';
import 'package:somthn/Francais/F-3-5.dart';
import 'package:somthn/Mutual/loading.dart';
import 'package:somthn/WelcomePages/Home.dart';
import 'package:somthn/WelcomePages/splash_screen.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, dynamic> mots = {
    'manger': {
      'nombreDeLettre': 3,
      'lettres': ['m', 'a', 'n', 'g', 'e', 'r'],
      'lettresEntre': []
    }
  };

  runApp(MaterialApp(
      home: Splash()
  ));
}
