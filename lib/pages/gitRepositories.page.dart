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
      appBar: AppBar(title: Text("Repositories"),
      actions: [
        Text("${this.widget.login}",style: TextStyle(fontSize: 20),),
        SizedBox(width: 10,height: 10,),
        CircleAvatar(backgroundImage: NetworkImage(widget.avatarUrl),),
        SizedBox(width: 10,height: 10,),
      ],),

      body: Center(
        child:ListView.builder(

          itemBuilder: (context, index) {
            return ListTile(
              title: Card(
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.only(top: 0),
                child: InkWell(
                  splashColor: Colors.blueAccent,
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0, left: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Row(children: [Icon(Icons.folder),
                           SizedBox(width: 10),
                           Text("${repos[index]['name']}"),
                         ]),
                          // Icon(this.repos[index]['visibility']=="private"?Icons.lock:Icons.lock_open,color: Colors.green,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },


            itemCount: repos == null?0:repos.length,
        )
      ),

    );
  }


}
