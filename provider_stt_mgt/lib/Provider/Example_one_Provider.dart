

// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
import 'package:flutter/foundation.dart';
import 'dart:core';
import 'package:flutter/cupertino.dart';

class ExampleOneProvider with ChangeNotifier{

  double _value=1.0;
  double get value=> _value;

  void setValue(double val){

    _value=val;
    notifyListeners();
}
}