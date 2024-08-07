import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_stt_mgt/Provider/coutn_provider.dart';

class countExample extends StatefulWidget {
  const countExample({super.key});

  @override
  State<countExample> createState() => _countExampleState();
}

class _countExampleState extends State<countExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider=Provider.of<CountProvider>(context,listen: false);
    Timer.periodic(Duration(seconds: 1), (Timer){
      countProvider.setCount();
    });
  }
  @override
  Widget build(BuildContext context) {
    final countProvider= Provider.of<CountProvider>(context ,listen: false);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title:Text ("Count Example"),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Consumer<CountProvider>(
          builder: (context ,value, child){
            return Text(value.count.toString(),
              style: TextStyle(fontSize: 50),);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
