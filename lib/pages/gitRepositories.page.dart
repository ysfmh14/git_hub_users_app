import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class GitRepositories extends StatefulWidget {
  String login;
  String avatarUrl;
  GitRepositories({required this.login, required this.avatarUrl});

  @override
  State<GitRepositories> createState() => _GitRepositoriesState();
}

class _GitRepositoriesState extends State<GitRepositories> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadRepositories();
  }
  dynamic repos ;
  void loadRepositories() {
    String url = "https://api.github.com/users/${this.widget.login}/repos";
    http.get(Uri.parse(url)).then((response){
      setState(() {
        this.repos= json.decode(response.body);
        print(repos);
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Repositories ${this.widget.login}"),
      actions: [
        CircleAvatar(backgroundImage: NetworkImage(widget.avatarUrl),)
      ],),

      body: Center(
        child:ListView.separated(

          itemBuilder:(context,index)=>ListTile(
              title: Row(children: [
                Icon(Icons.folder,color: Colors.blueAccent,),
                SizedBox(width: 20,),
                Text("${repos[index]['name']}",style: TextStyle(fontWeight: FontWeight.bold),),]
                 )

            ) ,

          separatorBuilder: (context, index) => Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.withOpacity(0.1), Colors.blue.withOpacity(0.4), Colors.blue.withOpacity(0.1)],

              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
          ),
            itemCount: repos == null?0:repos.length,
        )
      ),

    );
  }


}
