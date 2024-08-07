

import 'package:flutter/foundation.dart';

class FavouriteItemProvider with ChangeNotifier{
  List<int> _selectItem=[];

  List<int> get selectedItem => _selectItem;

  void addItem(int value){
    _selectItem.add(value);

    notifyListeners();
  }

  void removeItem(int value){

    _selectItem.remove(value);
    notifyListeners();
  }
}