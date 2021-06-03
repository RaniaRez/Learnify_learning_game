
import 'package:flutter/material.dart';
import 'package:somthn/Francais/F-1-4.dart';
import 'package:somthn/Maths/M-1-2.dart';
import 'package:somthn/Maths/M-2-1.dart';
import 'package:somthn/Maths/M-2-4.dart';
import 'package:somthn/Maths/M-2-5-2ndAttemptThreeclick.dart';
//import 'package:somthn/TestDeNiveau/TestNivFrQ3.dart';
//import 'package:somthn/TestDeNiveau/TestNivMathQ1.dart';
//import 'package:somthn/TestDeNiveau/TestNivMathQ2.dart';

//import 'package:somthn/TestDeNiveau/TestNivFrQ2.dart';
import 'package:somthn/WelcomePages/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:somthn/WelcomePages/Voila.dart';

import 'WelcomePages/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, dynamic> mots = {
    'manger': {
      'nombreDeLettre': 3,
      'lettres': ['m', 'a', 'n', 'g', 'e', 'r'],
      'lettresEntre': []
    }
  };

  runApp(MaterialApp(home:Splash()));
}
