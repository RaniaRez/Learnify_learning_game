import 'package:flutter/material.dart';
import 'package:somthn/Statistics/ScoreFinal.dart';
import 'package:somthn/WelcomePages/Home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, dynamic> mots = {
    'manger': {
      'nombreDeLettre': 3,
      'lettres': ['m', 'a', 'n', 'g', 'e', 'r'],
      'lettresEntre': []
    }
  };
  runApp(MaterialApp(home:Home()));
}


