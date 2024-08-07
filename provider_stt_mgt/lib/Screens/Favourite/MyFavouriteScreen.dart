
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/Favourite_Item.dart';

class Myfavouritescreen extends StatefulWidget {
  const Myfavouritescreen({super.key});

  @override
  State<Myfavouritescreen> createState() => _MyfavouritescreenState();
}

class _MyfavouritescreenState extends State<Myfavouritescreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider=Provider.of<FavouriteItemProvider>(context);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Screen"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
              child: Consumer<FavouriteItemProvider>(
                builder: (context,value,child){
                  return  ListView.builder(
                      itemCount: favouriteProvider.selectedItem.length,
                      itemBuilder: (context,indix){
                        return ListTile(
                            onTap: (){

                              if(value.selectedItem.contains(indix)){
                                value.removeItem(indix);
                              }else{
                                value.addItem(indix);
                              }
                            },
                            title: Text("Item"+indix.toString()),
                            trailing: Icon(value.selectedItem.contains(indix)? Icons.favorite : Icons.favorite_border_outlined,)
                        );
                      });
                },
              )
          )
        ],
      ),
    );
  }
}
