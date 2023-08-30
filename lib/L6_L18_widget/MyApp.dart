//2/9/2022
//Lesson 6: Khái niệm thet - Widget, StatelessWidget, phương thức build
// widget StatelessWidget
// import 'package:flutter/material.dart';
//
// class MyApp extends StatelessWidget {
//   String? name;
//   int? age;
// // Constructor của Class view : Gửi params từ widget cha xuống widget con sử dụng constructor
//   MyApp({this.name, this.age});    // Đây là hàm khởi tạo có tên
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Đây là màn hình 1',
//         home : Scaffold(
//           appBar: Text('xin chào'),
//             body: Center(
//               child: Text(
//                 '${this.name}, ${this.age} --- có thể bỏ this $name . $age',
//                 style: const TextStyle(fontSize:  30,  fontWeight: FontWeight.bold, color: Colors.red),
//                 textDirection: TextDirection.ltr,),
//             )
//         )
//     );
//   }
// }

// //  ngày 18/9/2022
//Lesson 7: Xây dựng một StatefulWidget, thay đổi state với TextFiled
// import 'dart:ffi';


//Mỗi StatefulWidget được tạo thành tử 2 class sau
//1 : 'public' Class kế thừa từ StatefulWidget
//2 : 'private' class để vẽ giao diện (qua hàm build())

/**
 * Khi state thay đổi thì hàm build sẽ được reander lại -> giao diện được reload lại
 * Trong hàm build sẽ chứa những hàm để thay đổi state , sự thay đổi này đến từ người dùng và API
 */

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class MyApp extends StatefulWidget {

//   // Các Property của class -- Để phục vụ cho Constructor 
//   String? name;
//   int? age;

//   MyApp({Key? key, this.name, this.age}) : super(key: key);
//   // get () {return this.name};

// @override
//   State<StatefulWidget> createState() {
//     // throw UnimplementedError();
//   return _MyAppState();
//   }
// }

// class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
//   String _email = '';   // Đây chính là state của Class : thay đổi nội tại bên trong myApp
//   final emailEditingController = TextEditingController();   // Để nhận sự thay đổi khi gõ vào : Mỗi 1 TextField phải có 1 controller

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     print("run initState");
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   WidgetsBinding.instance.removeObserver(this);
//     print("run dispose");
//   }

//   // Để nhận biết chế độ hiện hảnh của app :
//   // foreGround : đang mở app
//   //BackGround : App đang chạy nền : Khi người dùng bấm nút home
//   // Kế thừa từ WidgetsBindingObserver : Không cần @ override
// void didChangeAppLifecyccleState(AppLifecycleState state) {
//     super.didChangeAppLifecycleState(state);
//     if(state == AppLifecycleState.paused) {
//       print('App is in background mode');
//     }else if (state == AppLifecycleState.resumed){
//       print('App is in Foreground mode');
//     }
//  }

//   @override
//   Widget build(BuildContext context) {   // Hàm build này bắt buộc phải thực thi
//     print("Run Build");
//     return  MaterialApp(
//       title: "Học buổi 7",
//       home:  Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,   // Column nên là hướng dọc sẽ sắp xếp theo chiều nào 
//             children:  <Widget> [
//               Container(   // Gói vào trong thẻ Container để có thể padding và làm nhiều css hơn
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical:  40) ,
//                 child: TextField(
//                   controller: emailEditingController,   // Nói rằng khối điều khiển cái này là emailEditingController
//                   onChanged: (text) {
//                     setState(() {
//                       _email= text;   // Thay đổi gía trị cho state _email
//                     });
//                   },
//                 decoration:  const InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius:  BorderRadius.all(Radius.circular(20))
//                     ),
//                     labelText: 'Enter your name'
//                 ),
//               ),
//               ),
//              Text( _email,
//                 style: const TextStyle(fontSize: 20 , color: Colors.red),
//               ),
//               const Text(" name = widget.name} ,age = widget.age}   Không còn sài được nữa",
//                 style: TextStyle(fontSize: 20 , color: Colors.red),
//               ),
//             ],
//           )

//         ),
//       ),
//     );
//   }
// }

/**
 *  18/9/2022
 * Bài 8: WidgetBindingObserver, vòng đời (lifecycle) 1 Widget
 * khi 1 widget được tạo và chạy thì có 3 hàm thay nhau chạy tại các thời điểm
 * 
 * hàm Constructor sẽ chạy đầu tiên
 * 1. initState : Khi mà lần đầu tiênn Component này được bật lên
 * 2. build : Sẽ chạy lại khi call hàm setState(..) : Sẽ được chạy đi chạy lại nhiều lần
 * 3. dispose: Sẽ chạy  khi State/widget bị removed  : khi widget bị xoá đi
 * mở màn hình lên xong chuyển sang màn hình khác, giống như minimum tab ở trên web
 */

/**
 * 18/9/2022
 * Bài 9 : Thêm package và tuỳ biến ngày tháng DateTime với intl
 * hiển thị dữ liệu ngày tháng với các định dạng khác nhau sử dụng thư viện intl
 */
//

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// class MyApp extends StatefulWidget {
//    MyApp({Key? key }) : super(key: key);


//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
//   //Tạo ra 1 cái GlobalKey để set cho Scaffold.of
//   final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>() ;
//   final _contentController = TextEditingController();
//   final _amountController = TextEditingController();
//   // Định nghĩa 2 state
//   String? _content;
//   double? _amount;
//   @override
//   void initState(){
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//   }

//   @override
//   void dispose(){
//     super.dispose();
//     WidgetsBinding.instance.addObserver(this);
//   }
//   @override
//   Widget build(BuildContext context) {
//     // DateTime now = new DateTime.now();
//     // DateTime someDate = new DateTime(2022, 9,18);

//     return MaterialApp(
//       title: 'this is a StatefulWidget',
//       home: Scaffold(
//         body: SafeArea(
//           key: _scaffoldkey,
//           minimum:  const EdgeInsets.only(left: 20 , right : 20),   // Thuộc tính padding toàn màn hình vùng SafeArea
//           child:  Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               // Container(
//               //   padding: EdgeInsets.symmetric(vertical: 50),
//               //  child: Center(
//               //    child:  Text(
//               //      // now.toString()
//               //      // DateFormat('yyyy/MM/DD').format(now)
//               //      // DateFormat.yMMMd().format(now)
//               //      NumberFormat('###.0#,'en_US).format(12.34567),   // Làm tròn số chỉ lấy 2 số sau dấu ,
//               //    style: TextStyle(fontSize: 30 , color: Colors.green),
//               //  ),),
//               // ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Content'),
//                 controller:  _contentController,
//                 onChanged: (text) {
//                   setState(() {
//                     _content= text;
//                   });
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Amount(money'),
//                 controller:  _amountController,
//                 onChanged: (text) {
//                   setState(() {
//                     _amount = double.tryParse(text) ?? 0;
//                   });
//                 },
//               ),
//               FlatButton(
//                 child: Text('Insert Transaction'),
//                 textColor: Colors.white,
//                 color: Colors.pinkAccent,
//                 onPressed: (){
//                  // print('You Pressed thí button $_content $_amount');

//                   // Scaffold.of(context).showSnackBar(
//                   //   SnackBar(content: Text('Content $_content Amount $_amount'))
//                   // );  //Sẽ có 1 cái lỗi đó là Scaffold.of phải nằm trong thẻ Scaffold Cách khắc phục là tạo ra 1 cái GlobalKey Để ở bất kỳ đâu cũng có thể trỏ vào gọi sự kiện 

//                _scaffoldkey.currentState?.showSnackBar(
//                  SnackBar(content: Text('Content $_content Amount $_amount')),
//                  // duration : const Duration(seconds: 3), // Thuộc tính cho biết sẽ hiện ra bao nhiều giây
//                );
//                 },

//               )
//             ],
//           ),
//         )
//       ),
//     );
//   }
// }

/**
 * 19/9/2022
 * Bài 10 : Layout với SafeArea, Column, FlatButton , TextField
 * SafeArea để có thể bỏ qua phần tai thỏ
 * Nguyên tắc 1 TextField thì có 1 TextEditingController
 *
 * Toán tử envit  // check null 
 * y = x ?? 0; // if x == null => y = 0
 *
 *
 * Các Kiểu dữ liệu String , double ,
 *
 * Để có thể hiện Alert
 * bên ios : Alert controller
 * bên Android : Touch
 * bên ReactNative: Alert
 * bên Flutter : showSnackBar() hay ho hơn khi chỉnh được giây
 */

/**
 * 19/9/2022
 * Bải 11: Đưa dữ liệu state lên ListTile, sử dụng Map
 * ListTile hiển thị được các dạng thông tin khá là cơ bản ,
 *
 *
 */

/**
 * 21/9/2022
 * Bài 12: Đưa ListTile vào bên trong thẻ Card
 * Card là 1 widget mà cho phép tuỳ biến con của nó có thể tuỳ biến các thuộc tính : shape, set background color , elevation , ontap..
 */

/**
 * 21/9/2022
 * Bài 13: Tách riêng các Widget và tạo ListView
 *
 */

/**
 * 14/9/2022:
 * Bài 14: Tuỳ biến AppBar và FloatingActionButton
 *  AppBar like as head View
 *  AppBar this is Property widget Scaffold
 *  have Property title , action []
 *
 */

/**
 * 23/9/2022:
 * Bài 15: Tuỳ biến ListView item với Column và Row
 *
 */


// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'transaction.dart';
// import 'TransactionList.dart';

// class MyApp extends StatefulWidget {
//   MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
//   //Tạo ra 1 cái GlobalKey để set cho Scaffold.of
//   final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
//   final _contentController = TextEditingController();
//   final _amountController = TextEditingController();

//   //Định nghĩa state
//   Transaction _transaction = Transaction(content: "", amount: 0.0);
//   List<Transaction> _transactions = <Transaction>[];

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     WidgetsBinding.instance.addObserver(this);
//   }

//   // function common
//   void _insertTransaction() {
//     //validate Data
//     if (_transaction.content.isEmpty ||
//         _transaction.amount == 0.0 ||
//         _transaction.amount.isNaN) {
//       return;
//     }
//     _transaction.createdDate= DateTime.now();   // get day hour now
//     // _transactions.add(_transaction);

//     //xoá dữ liệu TextField sau khi thêm mới Transaction
//     _contentController.text = '';
//     _amountController.text = '';

//     //Khi mà đã đưa 1 _transaction và _transactions xong xuôi thì => clean state transaction về  thông tin trống rỗng
//     _transaction = Transaction(content: '', amount: 0.0);
    

//   }

//   // Lesson 16 :

//   @override
//   Widget build(BuildContext context) {
//     //MẢng bên trong là 1 hàm trả ra 1 mảng các giao diện

//     return MaterialApp(
//       title: 'this is a StatefulWidget',
//       home: Scaffold(

//         appBar: AppBar(
//           title: const Text('Transaction manager'),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.add),
//               onPressed: () {
//                 setState(() {
//                   this._insertTransaction();
//                 });
//               },
//             )
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(    //this is widget floating above other widget
//           tooltip: 'Add transaction',
//           child:  Icon(Icons.add),
//           onPressed: (){
//             setState(() {
//               this._insertTransaction();
//             });
//           },
//         ),

//         body: SafeArea(
//             key: _scaffoldkey,
//             minimum: const EdgeInsets.only(
//                 left: 20,
//                 right: 20), // Thuộc tính padding toàn màn hình vùng SafeArea
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   TextFormField(
//                     decoration: InputDecoration(labelText: 'Content'),
//                     controller: _contentController,
//                     onChanged: (text) {
//                       setState(() {
//                         _transaction.content = text;
//                       });
//                     },
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(labelText: 'Amount(money'),
//                     controller: _amountController,
//                     onChanged: (text) {
//                       setState(() {
//                         _transaction.amount = double.tryParse(text) ?? 0;
//                       });
//                     },
//                   ),
//                   Padding(padding: EdgeInsets.symmetric(vertical: 20)), // Đưa 1 khối view trống để chèn vào đây -- thay cho margin 
//                   ButtonTheme(
//                     height: 50,
//                     child: FlatButton(
//                         child: Text(
//                           'Insert Transaction',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         textColor: Colors.white,
//                         color: Colors.pinkAccent,
//                         onPressed: () {
//                           setState(() {
//                             this._insertTransaction();
//                           });

//                           // _scaffoldkey.currentState?.showSnackBar(
//                           //   SnackBar(
//                           //       content: Text(
//                           //           // 'Content ${_transaction.content}  Amount ${_transaction.amount}')),  //Cách này không được
//                           //   // duration : const Duration(seconds: 3), // Thuộc tính cho biết sẽ hiện ra bao nhiều giây
//                           // );
//                         }),
//                   ), // FlatButton : Cho phép chúng ta set chiều height , width , cho 1 button : Để dễ bấm , vì nếu bao bằng Container thì bấm vào Container không nhận Button

//                   Text("Content ${_transaction.toString()}"),
//                   TransactionList(transactions: _transactions)   // Đây là 1 widget được viết ở 1 file khác và đưa vào file này sử dụng -- chỉ cần truyền prop - params cho nó để khởi tạo đối tượng 
//                 ],
//               ),
//             )),
//       ),
//     );
//   }
// }

/**
 * 23/9/2022
 * Bài 16: Hiển thị và tuỳ biến Modal Bottom Sheet
 *  Show bottom above top : toast modal
 */

/**
 * 1/10/2022
 * Bài 17 : Thực thi các Actions trong ModalBottomSheet
 *
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'transaction.dart';
import 'TransactionList.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  //Tạo ra 1 cái GlobalKey để set cho Scaffold.of
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  //Định nghĩa state trong Class State 
  Transaction _transaction = Transaction(content: "", amount: 0.0);
  List<Transaction> _transactions = <Transaction>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.addObserver(this);
  }

  // function common
  void _insertTransaction() {
    //validate Data
    if (_transaction.content.isEmpty ||
        _transaction.amount == 0.0 ||
        _transaction.amount.isNaN) {
      return;
    }
    _transaction.createdDate = DateTime.now(); // get day hour now
    _transactions.add(_transaction);

    //xoá dữ liệu TextField sau khi thêm mới Transaction
    _contentController.text = '';
    _amountController.text = '';

    // //khởi tạo 1 transaction mới với thông tin trống rỗng
    // _transaction = Transaction(content: '', amount: 0.0);
  }

  // Bài 18 : Tuỳ biến Theme và font chữ
  void _onButtonShowModalSheet() {

    // Modal là 1 cái hàm được gọi để hiển thị lên View 
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Content'),
                  controller: _contentController,
                  onChanged: (text) {
                    setState(() {
                      _transaction.content = text;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Amount(money'),
                  controller: _amountController,
                  onChanged: (text) {
                    setState(() {
                      _transaction.amount = double.tryParse(text) ?? 0;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,  // Quy định chiều ngang của Row
                  children: [
                    Expanded(
                      child: RaisedButton(
                          color: Colors.teal,
                          child: (Text(
                            'Save',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          )),
                          onPressed: () {
                            print("onPress Save");
                            setState(() {
                              this._insertTransaction();
                            });
                            Navigator.of(context)
                                .pop(); // Để đóng ModalBottomSheet  Các màn hình đang xem là các lớp xếp , pop là quay trở lại màn hình trước đó
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    Expanded(
                        child: SizedBox(
                      child: RaisedButton(
                          child: (Text('Cancel')),
                          onPressed: () {
                            print("Pressed cancel");
                            Navigator.of(context).pop();  // Để đóng ModalBottomSheet 
                          }),
                      height: 50,
                      width: 150,
                    ))
                  ],
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    //MẢng bên trong là 1 hàm trả ra 1 mảng các giao diện
    // This must be Scaffold ? not Materrial App . --> error No MediaQuery widget ancestor found

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction manager'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              this._onButtonShowModalSheet();
            },
          )
        ],
      ),
      body: SafeArea(
          key: _scaffoldkey,
          minimum: const EdgeInsets.only(
              left: 20,
              right: 20), // Thuộc tính padding toàn màn hình vùng SafeArea
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                ButtonTheme(
                  height: 50,
                  child: FlatButton(
                      child: const Text(
                        'Insert Transaction',
                        style: TextStyle(fontSize: 18, fontFamily: 'Mulish'),

                      ),
                      textColor: Colors.white,
                      color: Colors.pinkAccent,
                      onPressed: () {
                        this._onButtonShowModalSheet();
                        // setState(() {
                        //   this._insertTransaction();
                        // });

                        // _scaffoldkey.currentState?.showSnackBar(
                        //   SnackBar(
                        //       content: Text(
                        //           // 'Content ${_transaction.content}  Amount ${_transaction.amount}')),  //Cách này không được
                        //   // duration : const Duration(seconds: 3), // Thuộc tính cho biết sẽ hiện ra bao nhiều giây
                        // );
                      }),
                ), // ButtonTheme : Cho phép chúng ta set chiều height , width , cho 1 button : Để dễ bấm , vì nếu bao bằng Container thì bấm vào Container không nhận Button

                Text("Content ${_transaction.toString()}"),
                TransactionList(transactions: _transactions)
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        //this is widget floating above other widget
        backgroundColor: Theme.of(context).primaryColor,   //Để có thể lấy màu theme ra làm màu cho widget
        tooltip: 'Add transaction',
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            this._onButtonShowModalSheet();
          });
        },
      ),
    );
  }
}

//If want padding :
// c1 :use Container
// c2 : Padding or sizeBox
/**
 * Expanded : no have color
 * want to fix height , width of widget > wrap in SizeBox
 */

/**
 * Thực thi các action trong ModalBottomSheet
 * off show ModalBottomSheet use Navigator
 *
 */
