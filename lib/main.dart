
import 'package:flutter/material.dart';
import 'package:somthn/Maths/M-1.dart';
import 'package:somthn/Maths/M-2.dart';
import 'package:somthn/Maths/M-3-2.dart';
import 'package:somthn/Maths/M-3.dart';
import 'package:somthn/Maths/Niveau1Pass%C3%A9.dart';
import 'package:somthn/Mutual/Statistiques.dart';
import 'package:somthn/WelcomePages/Entrernom.dart';
import 'package:somthn/WelcomePages/Home.dart';
import 'Geographie/N3Q5.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, dynamic> mots = {
    'manger': {
      'nombreDeLettre': 3,
      'lettres': ['m', 'a', 'n', 'g', 'e', 'r'],
      'lettresEntre': []
    }
  };

<<<<<<< HEAD
  runApp(MaterialApp(home: N3Q5()));
=======
  runApp(MaterialApp(home: Home()));
>>>>>>> afd52aa34e915f8cce09d4b6987f53c7e1b03bcd
}
