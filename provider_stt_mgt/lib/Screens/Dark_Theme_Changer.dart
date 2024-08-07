
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Theme_changer_provider.dart';

class DarkThemeChanger extends StatefulWidget {
  const DarkThemeChanger({super.key});

  @override
  State<DarkThemeChanger> createState() => _DarkThemeChangerState();
}

class _DarkThemeChangerState extends State<DarkThemeChanger> {
  @override
  Widget build(BuildContext context) {
    final themeChanger=Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Dark mode and Light"),
      ),
      body: Column(
        children: [
          RadioListTile(
              title: Text("Light Mode"),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode1,
              onChanged: themeChanger.setTheme
          ),
          RadioListTile(
              title: Text("Dark Mode"),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode1,
              onChanged: themeChanger.setTheme
          ),
          RadioListTile(
              title: Text("System Mode"),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode1,
              onChanged: themeChanger.setTheme
          ),
          Icon(Icons.favorite)
        ],
      ),
    );
  }
}
