// import 'package:flutter/material.dart';
// import 'transaction.dart';
//
// class TransactionList extends StatelessWidget {
//   List<Transaction> transactions ;
//  TransactionList({Key? key, required this.transactions}) : super(key: key);
//
//   List<Widget> _buildWidgetList(){
//     int index = 0;
//     return transactions.map((eachTransaction) {
//       index++;
//       return Card (
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10)),
//         color: (index -1) %2 == 0? Colors.pinkAccent : Colors.teal,
//         elevation: 10,
//         child: ListTile(
//           leading: const Icon(Icons.ice_skating),
//           title: Text(
//             eachTransaction.content,
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           subtitle: Text(
//             '$eachTransaction.amount',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//             ),
//           ),
//           onTap: () {
//             print('tap me');
//           },
//         ),
//       );
//     } ).toList();}
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 500,
//       child: ListView(
//           children: this._buildWidgetList(),
//       ),
//     );
//   }
// }

/**
 * ListView
 *  1. ListView(children: <Widget>[]) => this is loads all children at the same time
 *  2. ListView(itemBuilder: ...) => this loads only visible items : quantity limited
 *
 *  method ListView.builder have itemCount, itemBuilder(function)
 *
 *  error when    keyboard on -> height change -> alert error => Wrap all in SingleChildScrollView : able scrollable
 */

// import 'package:flutter/material.dart';
// import 'transaction.dart';
//
// class TransactionList extends StatelessWidget {
//   List<Transaction> transactions ;
//  TransactionList({Key? key, required this.transactions}) : super(key: key);
//
//   ListView _buildListView(){
//     return ListView.builder(
//       itemCount:transactions.length ,
//         itemBuilder: (context , index) {
//       return Card (
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10)),
//         color: (index -1) %2 == 0? Colors.pinkAccent : Colors.teal,
//         elevation: 10,
//         child: ListTile(
//           leading: const Icon(Icons.ice_skating),
//           title: Text(
//             transactions[index].content,
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           subtitle: Text(
//             '${transactions[index].amount}',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//             ),
//           ),
//           onTap: () {
//             print('tap me');
//           },
//         ),
//       );
//     }
//     );}
//     int index = 0;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 500,
//       child:_buildListView()
//     );
//   }
// }

// Bài 15 : Tuỳ chỉnh ListView item sử dụng Column và Row
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions ;
 TransactionList({Key? key, required this.transactions}) : super(key: key);

// Đây là 1 ListView được viết ở trên và được sử dụng ở vòng đời build phía dưới 
  ListView _buildListView(){
    return ListView.builder(
      itemCount:transactions.length ,
        itemBuilder: (context , index) {
      return Container(
        child: Card (
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            color: (index -1) %2 == 0? Colors.pinkAccent : Colors.teal,
            elevation: 10,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.all(10),),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top:10)),
                    Text(
                      transactions[index].content,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Date : ${transactions[index].createdDate}',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Padding(padding: EdgeInsets.only(bottom:10)),

                  ],
                ),
                Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '${transactions[index].amount}\$',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 10),),
                  ],
                ))



              ],
            )

        ),
      );
    }
    );}
    int index = 0;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child:_buildListView()
    );
  }
}

