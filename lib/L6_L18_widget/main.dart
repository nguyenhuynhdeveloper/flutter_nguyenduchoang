import 'package:flutter/material.dart';
import 'MyApp.dart';

void main() {
  runApp(
 MaterialApp(
   title: 'TRansaction app',
   theme: ThemeData(
    primaryColor: Colors.red, // Màu chủ đạo
    accentColor:  Colors.pink[300]

   ),
   home : MyApp(),
 )
  );
}

// Có thể tự tạo ra 1 thẻ widget riêng để tái sử dụng
// Mỗi lần state thay đổi hàm build được render lại -> Giao diện được reload lại
// không nên khai báo const cho widget --- mới học hay lỗi
//Scaffold have media query


