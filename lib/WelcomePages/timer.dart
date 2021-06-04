import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:audioplayers/audio_cache.dart';



void timeCounter() {

  Timer(Duration(hours  : 0, seconds: 5), (){
    //final player = AudioCache();
    //afficher un avertissement : lapplication va se terminer , terminer le niveau courant pour sauvegarder tes donnees
    // boite de dialogue : oui ->terminer maintenant     non ->terminer dans 10min le temps de completer le niveau courant
    print("application terminee  ");


    //SystemNavigator.pop();
  });
}