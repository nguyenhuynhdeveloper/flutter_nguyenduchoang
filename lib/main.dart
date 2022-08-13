// Bài2-Dart coả bản biến - String - hàm - mảng
//https://www.youtube.com/playlist?list=PLWBrqglnjNl3DzS2RHds5KlanGqQ1uLNQ

import 'package:flutter/material.dart';

//Thẻ Center là thẻ mà các thẻ con bên trong được căn giữa
/**
 * Thẻ text là con của thẻ Center
 * child là thuộc tính của thẻ Center là Text
 * cmd+ \ : hot reload lại app
 * shifft + cmd + \ : hot restart lại app   hoặc ctrl+ R
 * format lại code trong android studio cmd+ option+ L
 *Kết thúc mỗi câu lệnh phải có dấu ; Không có sẽ lỗi
 * Flutter có công cụ web là Flutter DevTool để có thể debug print
 *
 *Nguyên tắc đặt tên biến là nếu số nhiều thì thêm s ở cuối tên biến
 * Khi đặt điểm đỏ ở dòng code nào thì code sẽ dừng lại ở dòng code đó để có thễ xem  giá trị của các biến tại thời điểm đó là bao nhiêu
 * Bắt buột tham số phải nằm trong ()
 */

//Kiểu string
String s0 = "I am Develope \n"; // khai báo kiểu string

// Kiểu number
int x= 10;
int y = x*2;

// Kiểu List mảng các số nguyên
List<int> numbers = [1, 2,3, 4, 5, 6, 7];


// Ký tự \n là xuống dòng
var s1 = "Nguyễn Huỳnh ";  // Khai báo mà khong ghi rõ kiểu có thể là kiểu gì khi gán
var s3 =  s0+ s1;  // Nối 2 xâu ký tự bằng + String concatenation
var s4 = '$s0 - $s1';  // Nối 2 chuỗi ký tự bằng ''  và dấu $ đứng trước variable
var list = [1, 2, 3, 4, 5, 6, 7];  // var có thể khai báo tất cả các kiểu dữ liệu


void main(){
// Vòng for duyệt các phần tử trong mảng
// for (int i= 0 ; i < numbers.length; i++){
//   print(numbers[i]);
// }

//Cách 2 để lặp qua các phần tử của list
//   "nameList".forEach("hàm không tên")
  numbers.forEach((element) {print('$element xin chào');
  });

  // Hàm map(ánh xạ): [List các biến kiểu X] => [List các biến kiểu Y]
  List<String> stringNumbers = numbers.map((e) => '$e map').toList();  // Phải có toList vào để chuyển đổi hàm map đó sang kết quả 1 danh sách
  stringNumbers.forEach((e) => print(e));

      runApp(Center(
          child: Text(  // Thẻ Text chỉ có thể hiển thị String
              // '$s4 năm nay $x tuổi',
            '$numbers $list',
              style: TextStyle(fontSize: 20),
              textDirection: TextDirection.ltr // left to right
              )));
    }  // Mở ngoặc nhọn đóng ngoặc nhọn để kết thúc 1 hàm khối lệnh


