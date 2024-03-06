import 'package:flutter/material.dart';
import 'package:git_hub_users_app/pages/home.page.dart';
import 'package:git_hub_users_app/pages/users.page.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context)=>HomePage(),
        "/users" : (context)=>UsersPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),

      ),
      initialRoute: "/users",
    );
  }
}
