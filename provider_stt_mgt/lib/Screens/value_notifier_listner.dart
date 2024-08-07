

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ValueNotifierListnerScreen extends StatelessWidget {
   ValueNotifierListnerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Value Notifie Listner"),
        backgroundColor: Colors.blue,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context ,value ,child){
                return   Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    obscureText: toggle.value,
                    decoration: InputDecoration(
                      hintText: 'password',
                      suffixIcon: InkWell(
                          onTap: (){

                          },
                          child: Icon( toggle.value? Icons.visibility_off_outlined:Icons.visibility)),
                    ),
                  ),
                );
              }),
          Center(
            child: ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context ,value ,child){
                  return Text(_counter.value.toString(),style: TextStyle(fontSize: 50),);
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _counter.value++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
