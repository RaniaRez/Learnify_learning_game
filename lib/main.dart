
import 'package:flutter/material.dart';
import 'package:somthn/Francais/ScoreFr.dart';
import 'package:somthn/Mutual/ScoreFr.dart';
import 'package:somthn/Mutual/ScoreGeo.dart';
import 'package:somthn/Mutual/ScoreMath.dart';
import 'package:somthn/WelcomePages/Voila.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, dynamic> mots = {
    'manger': {
      'nombreDeLettre': 3,
      'lettres': ['m', 'a', 'n', 'g', 'e', 'r'],
      'lettresEntre': []
    }
  };

  runApp(MaterialApp(home: MathScore()));
}
