
import 'package:flutter/material.dart';
import 'package:somthn/Francais/testNiv/TestNivFrQ1.dart';
import 'package:somthn/Francais/testNiv/TestNivFrQ2.dart';
import 'package:somthn/Maths/M-1.dart';
import 'package:somthn/Maths/M-2.dart';
import 'package:somthn/Maths/M-3-2.dart';
import 'package:somthn/Maths/M-3.dart';
import 'package:somthn/Maths/Niveau1Pass%C3%A9.dart';
import 'package:somthn/Mutual/Statistiques.dart';
import 'package:somthn/WelcomePages/Entrernom.dart';
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

  runApp(MaterialApp(home: TestNivFr2()));
}
