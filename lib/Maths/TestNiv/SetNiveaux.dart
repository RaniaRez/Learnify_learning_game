import 'package:flutter/material.dart';
import '../ScoreMaths.dart';
import 'TestMaths.dart';

void setNiv(TestMaths t,ScoreMaths s){
  /*s.testFait=true ;
    s.niv1=0;
    if (t.q1&&t.q2) {
      s.niv2 = 0;
      if (t.q3) {
        s.niv3 = 0;
      }
    }*/
  s.testFait=true ;
  s.niv1=0;
  /* if (t.q1&&t.q2) {
      s.niv2 = 0;
      if (t.q3) {
        s.niv3 = 0;
      }
    }*/
  if (t.score >= 2) { s.niv2=0;}
  if (t.score==3) {s.niv3=0;}
}