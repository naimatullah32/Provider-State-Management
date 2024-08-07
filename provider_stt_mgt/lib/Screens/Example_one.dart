import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_stt_mgt/Provider/Example_one_Provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}
class _ExampleOneState extends State<ExampleOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example One"),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(
              builder: (context,value1,child){
                return Slider(
                    min: 0,
                    max: 1,
                    value: value1.value, onChanged: (val){
                  value1.setValue(val);
                });
              }),
          Consumer<ExampleOneProvider>(
              builder:(context,value1,child){
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.pink.withOpacity(value1.value)
                        ),
                        child: Center(child: Text("Container 1")),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(value1.value)
                        ),
                        child: Center(child: Text("Container 1")),
                      ),
                    ),
                  ],
                );
              })

        ],
      ),
    );
  }
}
