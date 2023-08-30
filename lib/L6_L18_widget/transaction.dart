import 'package:flutter/material.dart';
class Transaction {
  String content;
  double amount;
  DateTime? createdDate;
  
  // Constructor của class
  Transaction({required this.content, required this.amount ,  this.createdDate});

  //Để hiện thông tin của 1 đối tượng ta hiện từng trường 1 Or thực hiện phương thức toString()
@override
  String toString(){
  return 'content: $content , amount: $amount';
}
}