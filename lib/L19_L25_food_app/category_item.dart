import 'package:flutter/material.dart';
import 'package:myapp/L19_L25_food_app/models/category.dart';
// import 'package:myapp/models/category.dart';
import 'foods_page.dart';
class CategoryItem extends StatelessWidget {
  //1 categoryItem - 1 category object
  Category category;
  CategoryItem({Key? key, required this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Color _color = this.category.color;
    //i[ you tap to this Container, it must navigate to the list of Foods
    return InkWell(
      onTap: (){
        print('tapped to category: ${this.category.content}');
        //Navigate to another page
        //Pages are stored into a Stack, the page you see is the top Page(in the stack)
      
        /*  Cách 1: Sử dụng Navigator.of(context).push +  MaterialPageRoute 
        để có thể Navigator màn hình ---> thì truyền tham số sang màn hình khác phải dùng Constructor
        Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FoodsPage(category: this.category,)//you can send parameters using constructor

            ));

         */




        
        //Cách 2: Sử dụng Navigator.pushNamed(context, /FoodsPage , arguments: {'category' : category}) 
        //Khi sử dụng pushNamed thì có thể sử dụng arguments để truyền tham số 
        //Để có thể sử dụng được pushNamed thì ở MaterialApp phải khai báo routeName
        
      //    MaterialApp(
      // initialRoute: '/',//this is "root"
      // routes: {
      //   '/FoodsPage': (context) => FoodsPage(),
      //   '/CategoriesPage': (context) => CategoriesPage()
      // },
      //title: "",
      //home: Scafold(),
      //theme: ThemeData(
      //   primarySwatch: Colors.cyan,
      //   fontFamily: 'Itim',
      // ),
      // )

        //Are there another way to send parameters ? Yes !, Use RouteNames
        Navigator.pushNamed(context, FoodsPage.routeName, arguments: {'category': category});
        //'/FoodsPage' is "route's name", donot save like this, let's use a "static variable"

      },
      splashColor: Colors.deepPurple,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Now change font's family from "Google Fonts"
            Text(this.category.content,
                // style: Theme.of(context).textTheme.title
                ),
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  _color.withOpacity(0.8),
                  _color
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft
            ),
            color:_color,
            borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}