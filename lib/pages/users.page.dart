import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_hub_users_app/pages/gitRepositories.page.dart';
import 'package:http/http.dart' as http;
class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  String query = '';
  bool notVisibl = false;
  dynamic data ;
  TextEditingController queryTextEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();
  int currentPage = 1;
  int totalPages = 0;
  int pageSize = 20 ;
  List<dynamic> items = [];
  void _search(String query) {
    String url = "https://api.github.com/search/users?q=${query}&per_page=${pageSize}&page=${currentPage}";
    http.get(Uri.parse(url)).then((response){
      setState(() {
        this.data = json.decode(response.body);
        items.addAll(data['items']);
        if(data['total_count'] % pageSize == 0){
          totalPages = data['total_count']~/pageSize;
        }else{
          totalPages = (data['total_count']/pageSize).floor()+1;
        }
      });

      print(data);
    }).catchError((err){
      print(err);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
       setState(() {
         if(currentPage < totalPages-1){
           ++currentPage;
           _search(query);
         }
       });
      }
    });
    

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users"),),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        obscureText: notVisibl,
                        onChanged: (value){
                          setState(() {
                            query = queryTextEditingController.text;
                          });
                        },
                        controller: queryTextEditingController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left:20 ),
                            suffixIcon:  IconButton(onPressed: (){
                              setState(() {
                                this.notVisibl= !notVisibl;
                              });
                            },icon: Icon(this.notVisibl == true ?Icons.visibility:Icons.visibility_off,color: Colors.blueAccent,)),
                            border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(width: 1,color: Colors.blueAccent)
                            )
                        ),)),
                ),
                IconButton(onPressed: (){

                  setState(() {
                    items = [];
                    currentPage = 1;
                      query = queryTextEditingController.text;
                      _search(query);
                  });

                }, icon: Icon(Icons.search,color: Colors.blueAccent,))
              ],
            ),
            Expanded(
                child: ListView.separated(
                  separatorBuilder: (context,index)=> Divider(
                    height: 1,color: Colors.blueGrey
                  ),
                    controller: scrollController,
                    itemCount: items.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>GitRepositories(login : this.items[index]['login'],avatarUrl: this.items[index]['avatar_url'],)) );
                        },
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(backgroundImage: NetworkImage(items[index]['avatar_url']),
                                             radius: 40,
                                ),
                                SizedBox(width: 20,),
                                Text("${items[index]['login']}"),

                              ],
                            ),
                            CircleAvatar(
                              child: Text("${items[index]['score']}"),
                            ),
                          ],
                        ),
                      );
                    })
            )
            ],


        )
      ),
    );
  }


}
