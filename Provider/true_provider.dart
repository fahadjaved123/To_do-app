import 'package:flutter/cupertino.dart';

class IsTrue with ChangeNotifier{
  List<bool> _true=[];
  List<bool> get istrue=>_true;
  setTrue(int index){
    _true[index]=!_true[index];
    notifyListeners();
  }
  find(String vale){
    _true.contains((vale));
    notifyListeners();
  }
}