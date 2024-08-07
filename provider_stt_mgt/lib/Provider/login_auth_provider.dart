

import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class authProvider with ChangeNotifier {

  bool _loading=false;
  bool get loading=>_loading;

  setLoading(bool value){
    _loading = value;

    notifyListeners();
  }
  bool _isVisible = false;

  bool get isVisible => _isVisible;

  void toggleVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }
  
  void login(String email, String Password) async{

    setLoading(false);
    
    try{

      Response response= await post(Uri.parse('https://reqres.in/api/login'),

      body: {
        'email': email,
          'password':Password,
          }
      );

      if(response.statusCode == 200){
        print('Login Succesfully');
        setLoading(false);

      }
      else
      {
        setLoading(false);
        print("Login Faild");

      }

    }catch(e){
      setLoading(false);
      print(e.toString());

    }
  }

}