// ignore: unused_import

class UserQuestion {
  final String id;
  final String categoryName;
  final String userEmail;
  final Object question_1;
  final Object question_2;
  final Object question_3;
  final Object question_4;
  final Object question_5;

  UserQuestion({
    required this.id,
    required this.categoryName,
    required this.userEmail,
    required this.question_1,
    required this.question_2,
    required this.question_3,
    required this.question_4,
    required this.question_5,
  });

  factory UserQuestion.fromJson(Map<String, dynamic> json) {
    return UserQuestion(
      id: json['_id'],
      categoryName: json['categoryName'],
      userEmail: json['userEmail'],
      question_1: json['question_1'],
      question_2: json['question_2'],
      question_3: json['question_3'],
      question_4: json['question_4'],
      question_5: json['question_5'],
    );
  }
}

// class InventryUpdate {
//   String id;
//   String item_name;
//   String item_description;
//   String site_name;
//   String item_capacity;
//   String available_quantity;
//   String measuring_unit;
//   String unit_price;

//   InventryUpdate(
//     this.id,
//     this.item_name,
//     this.item_description,
//     this.site_name,
//     this.item_capacity,
//     this.available_quantity,
//     this.measuring_unit,
//     this.unit_price,
//   );
// }
