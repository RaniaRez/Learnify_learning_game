

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:audioplayers/audio_cache.dart';

import 'DialogBoxLocker.dart';



void timeCounter(context ) {

  Timer(Duration(hours  : 1 ), (){
    //afficher un avertissement : lapplication va se terminer , terminer le niveau courant pour sauvegarder tes donnees
    // boite de dialogue : oui ->terminer maintenant     non ->terminer dans 10min le temps de completer le niveau courant

    showDialog(context: context,
        builder: (BuildContext context){
          return customDialogLock();
        }
    );

    //SystemNavigator.pop();
    print("application terminee  ");
  });
}