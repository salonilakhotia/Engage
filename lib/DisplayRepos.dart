import 'package:flutter/material.dart';
import 'package:engage/widget/Repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'widget/Repository.dart'; 


class DisplayRepos extends StatelessWidget{
  String urlRepos;
  DisplayRepos({required this.urlRepos});
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Repos(urlRepos : urlRepos),
      debugShowCheckedModeBanner: false,
      //theme : new ThemeData(primarySwatch : Colors.black,),
    );
  }
}

class Repos extends StatefulWidget {
  String urlRepos;
  Repos({required this.urlRepos});
  @override
  _ReposState createState() => _ReposState();
}

class _ReposState extends State<Repos> {
   var list = List<Repository>.empty();
  bool loading=false;
 

  Future<List<Repository>> getRepoInfo() async {
    print("helooe");
    print(widget.urlRepos);
    var res = await http.get(Uri.parse(widget.urlRepos));
    print(res);
    list = (json.decode(res.body) as List)
      .map((data) => new Repository.fromJson(data))
      .toList();
    
    print("heyy");
    print(list[0]);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    print("inide");
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Repos List', style: TextStyle( color: Colors.white ),), backgroundColor: Colors.grey[800],),
        body: FutureBuilder(
        future: getRepoInfo(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (snapshot.hasData && list.length != 0) {
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
              //if(list.length != 0 ){
               return Card(
                 margin: EdgeInsets.symmetric(vertical : 12, horizontal: 15),
                
                 shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                 color: Colors.grey[600],
                 child: ListTile(
                    // leading: Icon(Icons.shopping_cart),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(list[index].name, style: TextStyle( color: Colors.white ),),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(vertical : 8.0),
                      child: Text((){
                            if(list[index].description != null) {return list[index].description; } 
                            else{ return "No Description for this Repo "; }
                            }(),textAlign : TextAlign.left, style: TextStyle(fontSize: 15,), ),
                    ),    
                  ),
               );
              }
                  );
              }
          else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          else{
                print("list");
                return Center(child: Text('No Repos on your Github!!', style: TextStyle(fontSize : 20, color: Colors.grey, fontWeight: FontWeight.bold), ));
              }
        },),
    );
  }
}

