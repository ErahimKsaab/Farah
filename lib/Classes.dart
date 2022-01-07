import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class pro extends  ChangeNotifier {
  var information,manufaturesss,blog;
  Profile(c){
    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
    information=c;
    print(information);
    notifyListeners();
  }

  var Sections;
  section(c){
    Sections=c;
    print(Sections);
    notifyListeners();
  }


}