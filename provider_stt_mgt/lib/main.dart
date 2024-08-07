import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_stt_mgt/Provider/login_auth_provider.dart';
import 'package:provider_stt_mgt/Screens/Favourite/Favourit_Screen.dart';
import 'package:provider_stt_mgt/Provider/Example_one_Provider.dart';
import 'package:provider_stt_mgt/Provider/Theme_changer_provider.dart';
import 'package:provider_stt_mgt/Screens/Dark_Theme_Changer.dart';
import 'package:provider_stt_mgt/Screens/Example_one.dart';
import 'package:provider_stt_mgt/Screens/Login_Screen.dart';
import 'package:provider_stt_mgt/Screens/countEx_withChange_notifier&Consumer.dart';

import 'Provider/Favourite_Item.dart';
import 'Provider/coutn_provider.dart';
import 'Screens/value_notifier_listner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers:[
      ChangeNotifierProvider(create: (_)=>CountProvider()),
      ChangeNotifierProvider(create: (_)=> ExampleOneProvider()),
      ChangeNotifierProvider(create: (_)=> FavouriteItemProvider()),
      ChangeNotifierProvider(create: (_)=> ThemeChangerProvider()),
      ChangeNotifierProvider(create: (_)=> authProvider()),


    ] ,
    child: Builder(
        builder: (BuildContext context){
          final themeChanger=Provider.of<ThemeChangerProvider>(context);
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode:themeChanger.themeMode1,
            theme: ThemeData(
              brightness: Brightness.light,
                primarySwatch: Colors.red,
                useMaterial3: true
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.blue
              ),
              iconTheme: IconThemeData(
                color: Colors.pink,
              )
            ),
            home: LoginScreen(),
          );
        })
    );
  }
}