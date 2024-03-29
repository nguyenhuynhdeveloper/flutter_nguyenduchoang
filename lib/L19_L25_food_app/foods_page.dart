import 'package:flutter/material.dart';
// import 'package:myapp/fake_data.dart';
import 'package:myapp/L19_L25_food_app/fake_data.dart';
import 'package:myapp/L19_L25_food_app/models/category.dart';
import 'package:myapp/L19_L25_food_app/models/food.dart';
// import 'package:myapp/models/category.dart';
// import 'package:myapp/models/food.dart';
import 'detail_food_page.dart';

class FoodsPage extends StatelessWidget {
  static const String routeName = '/FoodsPage';
  Category? category;
  FoodsPage({Key? key,  this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //Cách hứng tham số từ 1 màn hình khác truyền tới màn hình này 
    Map<String , Category >? arguments = ModalRoute.of(context)?.settings.arguments as Map<String, Category>? ;
    category = arguments!['category'];
    
    //Filter foods of from category
    List<Food> foods = FAKE_FOODS.where((food) => food.categoryId == this.category?.id).toList();


    return Scaffold(
      appBar: AppBar(
        title: Text('Foods from ${category?.content}'),
      ),
      body: Center(
        child: Center(
          child: foods.length > 0 ? ListView.builder(
              itemCount: foods.length,
              itemBuilder: (context, index) {
                //We will continue in the next lesson
                Food food = foods[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => DetailFoodPage(food: food)//send params using "constructor"
                        )
                    );
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20),
                        child: ClipRRect(     
                          borderRadius: BorderRadius.circular(10),
                          clipBehavior: Clip.hardEdge,
                          child: Center(
                            child: FadeInImage.assetNetwork(   // widget có thể hiện 1 hình ảnh từ 1 link : và có cả hiệu ứng mà đợi load ảnh lên 
                                placeholder: 'assets/images/loading.gif',
                                image: food.urlImage
                            ),
                          ),
                        ),
                      ),
                      Positioned(   // Positioned để có thể quyết định vị trí của nó so với thẻ Stack 
                        top: 30,left: 30,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white, width: 2)
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.timer, color: Colors.white, size: 25,),
                              Text('${food.duration.inMinutes} minutes',
                                style: TextStyle(fontSize: 22, color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,right: 30,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: Row(
                            children: <Widget>[
                              Text('${food.complexity.toString().split('.').last}',
                                style: TextStyle(fontSize: 22, color: Colors.black),),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,right: 30,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: Text('${food.name}',
                            style: TextStyle(fontSize: 30, color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                );
              }
          ):
          Text('No foods found',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        )
      ),
    );
  }
}