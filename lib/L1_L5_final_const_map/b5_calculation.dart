//  Khai báo 1 biến String 
String s1 = 'How are you ?';
String s2 = 'I\'m fine';
var s3 = '$s1 - $s2'; //string concatenation

// Khai báo 1 biến kiểu int 
int x = 10;
int y = x * 2;

// Khai báo 1 biến kiểu List : mảng array 
//what about an array ?
List<int> numbers = [1, 4, 6, 2, 3, 9, 11];
//How to "map" an array?
List<String> stringNumbers = numbers.map((number){
  return 'value = $number';
}).toList();