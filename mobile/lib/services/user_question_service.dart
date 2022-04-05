// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:mobile/models/user_question_model.dart';

// class UserQuestionService {
//   // static const String endpoint = "http://localhost:5000/user/get/a@gmail.com";
//   static const String endpoint =
//       // "http://192.168.8.104:5000/user/get/a@gmail.com";
//       "http://localhost:5000/user/get/a@gmail.com";
//   Future<List<UserQuestion>> listDataJSON() async {
//     final url = Uri.parse("http://localhost:5000/user/get/a@gmail.com");
//     final response = await http.get(url);
//     var dataList;
//     // Response response = await get(Uri.parse(endpoint));
//     if (response.statusCode == 200) {
//       // List listData = json.decode(response.body);
//       List listData = jsonDecode(response.body);
//       dataList = json.decode(response.body);
//       print(dataList);
//       print(listData);
//       // return listData
//       //     .map((listData) => new UserQuestion.fromJson(listData))
//       //     .toList();
//       return listData.map((listData) => new UserQuestion.fromJson(listData)).toList();
//     } else {
//       throw Exception("Error");
//     }
//   }

//   // Future<List<UserQuestion>> getCases() async {
//   //   final url = Uri.parse("http://localhost:5000/user/get/a@gmail.com");
//   //   final response = await http.get(url);
//   //   // Response res = await get(apiUrl);
//   //   // Response res = await get(Uri.parse(endpoint));
//   //   if (response.statusCode == 200) {
//   //     // List<dynamic> body = jsonDecode(res.body);
//   //     List<dynamic> body = json.decode(response.body);
//   //     List<UserQuestion> cases =
//   //         body.map((dynamic item) => UserQuestion.fromJson(item)).toList();
//   //     return cases;
//   //   } else {
//   //     throw "Failed to load cases list";
//   //   }
//   // }
// }
