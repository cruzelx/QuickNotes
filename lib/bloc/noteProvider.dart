import 'package:flutter/cupertino.dart';

class NoteProvider extends ChangeNotifier{
  double _fontSize = 20.0;
  String _fontFamily = "Roboto-Regular";

  double get fontSize => _fontSize;
  String get fontFamily => _fontFamily;

  set fontSize(double newVal){
    _fontSize = newVal;
    notifyListeners();
  }

  set fontFamily(String newVal){
    _fontFamily = newVal;
    notifyListeners();
  }
}