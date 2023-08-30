import 'package:flutter/cupertino.dart';

// Tạo ra 2 class Car
class Car {

  // property của Class
  String name;
  int yearOfProduction;

// Constructor của class 
  Car({
    @required this.name = "huỳnh",  //@required = Not null(warning),
    this.yearOfProduction = 2020  //what about "default parameter" ? nhận giá trị mặc định là 2020 
  });

// getter - setter của class 
  set handleEvent(Function() ){}   // Method handleEvent sẽ được nhận giá trị khi được gọi car.handleEvent = () => { print ('Gán giá trị cho Method')}

  // Method của class 

  @override
  String toString() {
    // TODO: implement toString
    return '${this.name} - ${this.yearOfProduction}';
  }
  void doSomething(){
    print('I am doing something...');
    // this.handleEvent();
  }
  // method with named arguments ? // Method có tham số dạng named arguments 
  void sayHello({required String personName}){
    print('Hello $personName');
    //_doSomething();//You can access "private" property inside
  }

  //function as "a variable"
  // Function handleEvent;
}