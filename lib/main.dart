
import 'package:flutter/material.dart';
import 'package:somthn/Mutual/Statistiques.dart';
import 'package:somthn/WelcomePages/Home.dart';
import 'Geographie/N3Q1.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, dynamic> mots = {
    'manger': {
      'nombreDeLettre': 3,
      'lettres': ['m', 'a', 'n', 'g', 'e', 'r'],
      'lettresEntre': []
    }
  };

  runApp(MaterialApp(home: N3Q1()));
}
