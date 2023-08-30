import 'package:flutter/material.dart';
// import 'package:myapp/categories_page.dart';
// import 'package:myapp/foods_page.dart';
import 'package:myapp/L19_L25_food_app/categories_page.dart';
import 'package:myapp/L19_L25_food_app/foods_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',//this is "root"
      routes: {
        '/FoodsPage': (context) => FoodsPage(),
        '/CategoriesPage': (context) => CategoriesPage()
      },
      
      title: 'Food App with Navigation',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'Itim',
      ),
      home: Scaffold(
        appBar: AppBar(
//          centerTitle: false,
          title: const Text('Food\'s categories' ),
        ),
        body: SafeArea(child: CategoriesPage(),)
      ),
    );
  }
}
