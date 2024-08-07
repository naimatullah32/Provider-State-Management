
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_stt_mgt/Screens/Favourite/MyFavouriteScreen.dart';
import 'package:provider_stt_mgt/Provider/Favourite_Item.dart';

import 'Favourit_Screen.dart';

class FavouritScreen extends StatefulWidget {
  const FavouritScreen({super.key});

  @override
  State<FavouritScreen> createState() => _FavouritScreenState();
}
 List<int> selItem=[];
class _FavouritScreenState extends State<FavouritScreen> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Screen"),
        backgroundColor: Colors.blue,
        actions: [
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Myfavouritescreen()));
              },
              child: Icon(Icons.favorite,color: Colors.white,)),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FavouriteItemProvider>(
              builder: (context,value,child){
                return  ListView.builder(
                    itemCount: 50,
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
