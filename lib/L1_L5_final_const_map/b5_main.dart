import 'package:flutter/material.dart';
import 'b5_calculation.dart'; //calculation is a "module"
import 'b5_car.dart';

// Bài 2-Dart cơ bản biến - String - hàm - mảng
//https://www.youtube.com/playlist?list=PLWBrqglnjNl3DzS2RHds5KlanGqQ1uLNQ



//Kiểu string
String s0 = "I am Develope \n"; // khai báo kiểu string

// Kiểu number
int x = 10;
int y = x * 2;

// Kiểu List mảng các số nguyên
List<int> numbers = [1, 2, 3, 4, 5, 6, 7];

// Ký tự \n là xuống dòng
var s1 =
    "Nguyễn Huỳnh "; // Khai báo mà không ghi rõ kiểu có thể là kiểu gì khi gán
var s3 = s0 + s1; // Nối 2 xâu ký tự bằng + String concatenation
var s4 = '$s0 - $s1'; // Nối 2 chuỗi ký tự bằng ''  và dấu $ đứng trước variable
var list = [1, 2, 3, 4, 5, 6, 7]; // var có thể khai báo tất cả các kiểu dữ liệu

void main() {
  // Buổi 2: Biến hàm kiểu dữ liệu
// Vòng for duyệt các phần tử trong mảng
// for (int i= 0 ; i < numbers.length; i++){
//   print(numbers[i]);
// }

//Cách 2 để lặp qua các phần tử của list
//   "nameList".forEach("hàm không tên")
  numbers.forEach((element) {
    print('$element xin chào');
  });

  // Hàm map(ánh xạ): [List các biến kiểu X] => [List các biến kiểu Y]
  List<String> stringNumbers = numbers
      .map((e) => '$e map')
      .toList(); // Phải có toList vào để chuyển đổi hàm map đó sang kết quả 1 mảng List
  stringNumbers.forEach((e) => print(e));

  //Buổi 3: Class_ object_constructor
  // Cách tạo 1 object từ Class Car
  var myCar = Car(
      name: 'Mercedes-Maybach S-Class Saloon',
      yearOfProduction: 2021); //Flutter style

  myCar.handleEvent = () {
    print("Handle in main");
  };

  myCar.doSomething(); // Method mà k có tham số
  myCar.sayHello(personName: 'Hoang'); // method có tham số

  //Buổi 4: mảng List

  //Tạo ra 1 mảng List gồm toàn những phần tử cars

  // List<Car> cars = <Car>[];//a blank list sau đó add từng phần tử trong list
  // cars.add(Car(name: 'Mercedes Benz C class 250', yearOfProduction: 2016), );
  // cars.add(Car(name:'Mercedes-Maybach S-Class Saloon', yearOfProduction: 2020), );
  // cars.add(Car(name: ' Mercedes Benz C class C300 AMG', yearOfProduction: 2017));

  //Tạo sẵn 1 List đã có đủ các phần tử
  List<Car> cars = <Car>[
    Car(name: 'Mercedes Benz C class 250', yearOfProduction: 2016),
    Car(name: 'Mercedes-Maybach S-Class Saloon', yearOfProduction: 2020),
    Car(name: ' Mercedes Benz C class C300 AMG', yearOfProduction: 2017)
  ];

  //add : thêm phần tử vào trong mảng
  cars.add(Car(name: '2020 Mercedes-AMG ONE', yearOfProduction: 2020));

  //update an item in  the list: update 1 thuộc tính của  phần tử ở vị trí chỉ định của mảng List 
  cars[0].yearOfProduction = 2022;

  // where : Để lọc các phần tử trong mảng 
  //delete an item = using filter  : Xoá phần tử ra khỏi mảng
  // Tạo  ra 1 mảng mới khi đã xoá các phần tử không thoả mãn . chỉ cần lọc ngược lại các phần tử không thoả mãn
  // Hoặc có thể toList() luôn vào mảng cũ ban đầu  Kết quả sau khi xoá đè lên kết quả cũ
  cars = cars
      .where((car) => car.name != 'Mercedes-Maybach S-Class Saloon')
      .toList();

  // forEach : Duyệt từng phần tử cho mảng
  cars.forEach((element) {
    print(element);
  });

  //How to filter ? Ex: get only cars in 2020  : Lọc phần tử trong mảng
  //Mảng cũ không bị thay đổi
  var filteredCars = cars
      .where((car) =>
          car.yearOfProduction == 2020 &&
          car.name.toUpperCase().contains("AMG"))
      .toList();

// sort : Sắp xếp phần tử trong mảng 
  //How to sort this list , by yearOfProduction ?
  cars.sort(
      (c1, c2) => c1.yearOfProduction - c2.yearOfProduction); // sort ascending
  cars.sort(
      (c1, c2) => c2.yearOfProduction - c1.yearOfProduction); //sort descending
      
  // How to sort by alpabe
  cars.sort((c1, c2) => c1.name.compareTo(c2.name)); // sort by abc

  // map : Tạo 1 mảng mới bằng cách ánh xạ các phần tử của mảng cũ 
  //How to get a list of names ? Use "map : Tạo 1 mảng khác  bằng cách ánh xạ mảng cũ
  List<String> names = cars.map((car) => car.name).toList();

  names.forEach((name) {
    print('name: ${name}');
  });

  //Buổi 5: final/const kiểu dữ liệu Map
  // Khi biến là String , int , double : thì khi khai báo final / const thì k được phép thay đổi giá trị của nó

  //Khi kiểu biến là tham chiếu : List, Map , Set
  const List<int> someNumbers = [1, 2, 3, 5];
  // someNumbers = [2, 4, 8]   //Cả final , const đều không được phép tham chiếu tới 1 biến khác
  //someNumbers.add(7);   //final có thể thêm phần tử , const : Không
  //someNumbers[1] = 99;   // final có thể update giá trị của phần tử , const : không

// TỔNG KẾT 
  //final : có thể thêm phần tử , sửa giá trị của phần tử
  // const: Không được phép làm gì :Bị đóng băng hoàn toàn

  // Tham chiếu tới final/const
  //Tham chiếu 1 biến tự do vào biến  final : thì nó có tất cả thuộc tính của biến final : có thể chỉnh sửa phần tử + có thể thêm phần tử
  List<int> someNumbers2 = someNumbers;
  //someNumbers2.add(123);
  //someNumbers2[0]= 99 ;

  //Tham chiếu 1 biến tự do vào biến const : thì có tất cả thuộc tính của const :không thể làm gì được

  // Tổng kết : Tham chiếu 1 biến không phải final/ const sang 1 biến final/const thì nhận tất cả các tính chất trừ tính chất tham chiếu sang 1 thằng tiếp theo

  // nhưng nó là biến tự do nên nó có thê tự do tham chiếu tới đâu tuỳ thích. tham chiếu tới final/const rồi vẫn tham chiếu sang List , map , set khác
  someNumbers2 = [
    4,
    7,
    9
  ]; // Có thể tham chiếu someNumbers2 sang 1 List khác , dù trước đó đã tham chiếu tới final/ const

  // TÓM TẮT : Tham chiếu tới final/const chứ không phải final/const
  //Bạn có thể định nghĩa 1 object mà không cần tạo 1 class > Bằng kiểu dữ liệu kiểu Map Vì Map chính là object
  //Tạo ra 1 đối tượng mà không cần định nghĩa 1 class


  // Kiểu dữ liệu Map

  Map<String, dynamic> personA = Map(); //key:String, value: String
  personA['name'] = 'Hoang';
  personA['age'] = 18;

  Map<double, double> point = Map();
  point[2] = 3; //x = 2, y = 3  //Rất thích hợp cho vẽ đồ thị
  point[1.0] = 5.6; //  Có thể thêm rất nhiều key: value không giới hạn
  // point.4 = 6;      //Cách này không khả dụng

  runApp(
    Center(
        child: Text(
            // names.toString(),
            point.toString(),
            style: TextStyle(fontSize: 30),
            textDirection: TextDirection.ltr //left-to-right
        )),
  );
}



