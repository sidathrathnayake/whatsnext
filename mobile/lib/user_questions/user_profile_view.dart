// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:mobile/models/user_question_model.dart';


// void main() {
//   runApp(MyApp2());
// }

// class MyApp2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: UserProfileView(),
//     );
//   }
// }

// class UserProfileView extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _UserProfileViewState();
//   }
// }

// class _UserProfileViewState extends State<UserProfileView> {
//   var item_name = "item_name";
//   var dataList;

//   Future<List<UserQuestion>> listDataJSON() async {
//     final url = Uri.parse(
//         "http://localhost:5000/user/get/a@gmail.com");
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       List listData = json.decode(response.body);
//       dataList = json.decode(response.body);
//       print('dataList');
//       print(dataList);
//       return listData
//           .map((listData) => new UserQuestion.fromJson(listData))
//           .toList();
//     } else {
//       throw Exception("Error");
//     }
//   }

//   // Future delete(String id) async {
//   //   await http.delete(
//   //     Uri.parse('http://localhost:5000/inventory/delete-one-inventory/${id}'),
//   //     headers: <String, String>{
//   //       'Content-Type': 'application/json; charset=UTF-8',
//   //     },
//   //   );
//   // }

//   Color textfieldcolor = Colors.blue;
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           "Your Profile",
//         ),
//       ),
//       body: FutureBuilder<List<UserQuestion>>(
//           // future: listDataJSON(),
//           builder: (context, snapshot) {
//         // if (snapshot.data == null) {
//         //   return Center(
//         //     child: CircularProgressIndicator(),
//         //   );
//         // }
//         // else {
//         return new ListView.builder(
//             // itemCount: snapshot.data!.length,
//             itemCount: 1,
//             padding: EdgeInsets.all(10),
//             itemBuilder: (BuildContext context, int currentIndex) {
//               return Container(
//                 margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                 height: 160,
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: <Widget>[
//                     Container(
//                       height: 136,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.teal,
//                         boxShadow: [
//                           BoxShadow(
//                               offset: Offset(0, 15),
//                               blurRadius: 27,
//                               color: Colors.black12)
//                         ],
//                       ),
//                       child: Container(
//                         margin: EdgeInsets.only(right: 10),
//                         decoration: BoxDecoration(
//                             // color: Colors.teal.shade50,
//                             color: Colors.teal.shade200,
//                             borderRadius: BorderRadius.circular(10)),
//                       ),
//                     ),
//                     Positioned(
//                       top: 0,
//                       right: 0,
//                       child: Container(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         height: 50,
//                         width: 200,
//                         child: FlatButton(
//                             color: Colors.blue.shade600,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30.0)),
//                             onPressed: () {
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(
//                               //       builder: (context) =>
//                               //           EditInventory(
//                               //               update_inventory: snapshot
//                               //                   .data![currentIndex])),
//                               // );
//                             },
//                             child: Text(
//                               "Edit New",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18,
//                                   color: Colors.white),
//                             )),
//                       ),
//                     ),
//                     Positioned(
//                       top: 90,
//                       right: 0,
//                       child: Container(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         height: 50,
//                         width: 200,
//                         child: FlatButton(
//                             color: Colors.blue.shade600,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30.0)),
//                             onPressed: () => showDialog<String>(
//                                   context: context,
//                                   builder: (BuildContext context) =>
//                                       AlertDialog(
//                                     title: Text(
//                                       // snapshot.data![currentIndex].item_name,
//                                       'Sports Category'
//                                     ),
//                                     content: const Text(
//                                         'Do you want to delete this? '),
//                                     actions: <Widget>[
//                                       TextButton(
//                                         onPressed: () =>
//                                             Navigator.pop(context, 'Cancel'),
//                                         child: const Text('Cancel'),
//                                       ),
//                                       TextButton(
//                                         // onPressed: () =>
//                                         //     //delete();
//                                         //     Navigator.pop(context, 'OK'),
//                                         onPressed: () {
//                                           // delete(snapshot
//                                           //     .data![currentIndex].id);
//                                           // Navigator.pop(context, 'OK');
//                                         },
//                                         child: const Text('OK'),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                             child: Text(
//                               "Delete",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18,
//                                   color: Colors.white),
//                             )),
//                       ),
//                     ),
//                     Positioned(
//                         bottom: 0,
//                         left: 0,
//                         child: SizedBox(
//                           height: 136,
//                           width: size.width - 200,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Spacer(),
//                               Padding(
                                
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 20),
//                                 child: Text(
//                                   'Sports Category',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 25,
//                                       color: Colors.black),
//                                 ),
//                               ),
//                               Spacer(),
//                             ],
//                           ),
//                         ))
//                   ],
//                 ),
//               );
//             });
//         // }
//       }),
//     );
//   }
// }
