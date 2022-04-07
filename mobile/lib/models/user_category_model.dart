// ignore: unused_import

class UserCategory {
  final String id;
  final String categoryName;

  UserCategory({
    required this.id,
    required this.categoryName,
  });

  factory UserCategory.fromJson(Map<String, dynamic> json) {
    return UserCategory(
      id: json['_id'],
      categoryName: json['categoryName'],
    );
  }

}

