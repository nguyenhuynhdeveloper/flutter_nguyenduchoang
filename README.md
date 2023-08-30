//Mỗi màn hình có nhiều thẻ khác nhau

Trong android studio có thể lựa chọn điểm bắt đầu chương trình
object ở bên JavaScript cũng có key: value
 nếu value không phải hàm thì sẽ là property
 nếu value là hàm thì sẽ là method
 từ ES6 trở đi có cách viết method gọn hơn , không cần viết
  const var= {
  price: 1000,
  name : 'toyota',
  action : function () {...}
  action : () =>{...}
  action() {}  // Cách viết từ ES6 không cần phải viết key nữa cho mặc định key trùng name Function
  }

  /*
   * Thẻ text là con của thẻ Center
   * child là thuộc tính của thẻ Center là Text
   *
   * cmd+ \ : hot reload lại app
   * shifft + cmd + \ : hot restart lại app   hoặc ctrl+ R
   * format lại code trong android studio cmd+ option+ L
   *
   *Kết thúc mỗi câu lệnh phải có dấu ; Không có sẽ lỗi
   * Flutter có công cụ web là Flutter DevTool để có thể debug print
   *
   *Nguyên tắc đặt tên biến là nếu số nhiều thì thêm s ở cuối tên biến
   * Khi đặt điểm đỏ ở dòng code nào thì code sẽ dừng lại ở dòng code đó để có thễ xem  giá trị của các biến tại thời điểm đó là bao nhiêu
   * Bắt buột tham số phải nằm trong ()
   */


   Không nên để const trước widget MaterialApp  vì nếu sau dùng thêm Column thì sẽ lỗi
   
//KHI MUỐN THAY ĐỔI PHIÊN BẢN FLUTTER CHẠY TRÊN MÁY CHỈ CẦN VÀO FOLDER MÀ CHỨA FILE FLUTTER XONG CHUYỂN PHIÊN BẢN ĐÓ VỀ TÊN  flutter .. còn các phiên bản khác để tên khác
flutter/bin là đường dẫn thuộc file path của biến môi trường 

!!! trong file pubspec.yaml : Phải dùng dấu tab thay cho 4 dấu cách










/**
 * Ngày 2/10/2022:
 * Bài 19 : Ứng dụng FoodApp - những cài đặt ban đầu
 * Bài 20 : Danh sách với GridView và Grid Item
 * Bài 21: Cài đặt Theme và tuỷ biến font
 */

/**
 * Sử dụng các thẻ Navigation , ListView, Image...
 * -Các chức năng : Xem danh mục (Category) , danh sách /chi tiết món ăn ...
 *
 * Quy tắc đặt tên :
 * _class name: CategoryPage, FoodList..
 * _.dart file name: categories_page.dart , food_list.dart
 */

/**
 * Ngày 20/10/2022: bài 22 :Truyền tham số giữa 2 màn hình dùng hàm Contructors
Các màn hình trong Flutter được để trong các Stack giống như ngăn xếp trong tủ quần áo, màn hình đang nhìn thấy là nằm trên đỉnh 
Muốn đưa màn hình đó xuống thì dùng pop, Muốn đẩy nó nên đỉnh thì dùng push  
Để tạo ra 1 route từ cái 1 widget. cái widget màn hình đó phải được đưa thành 1 cái route

Cách 1: để có thể truyển sang 1 màn hình khác ---> Đưa widget màn hình đó lên đỉnh ngăn xếp

import 'FoodsPage.dart'
 Navigator.of(context).push(
  MaterialPageRoute(
    builder(context) =>FoodsPage(),   //Có thể dùng hàm khỏi tạo Contructor để truyền tham số sang
  )
 )

 */

Cách 2 : Sử dụng RouteName có thể truyền nhiều tham số từ 1 màn hình sang 1 màn hình mới

Navigator.pushName(context, '/FoodsPage', arguments: {'category': category}); // argumnets là kiểu dữ liệu kiểu map , dạng key: value

Bài 23 -Navigation | Food App- Truyền tham số với RouteNames, dữ liệu quan hệ 1- N

Để có thể sử dụng được RouteName thì tại Widget root -- cái widget dược viết trong runApp(MyApp())

Trong thẻ Material(
  initialRoute: '/'  , // this is 'root'
  routes: {
    '/FoodsPage': (context) => FoodsPage(),
    '/CategotiesPage': (context) => CategoriesPage(),
  }
) của MyApp()


Cách lấy ra arguments từ arguments truyền từ Navigator

Map<String, dynamic> argumentns = ModalRoute.of(context).settings.arguments;
category = arguments['category'];

Bản Flutter cũ phải @require












