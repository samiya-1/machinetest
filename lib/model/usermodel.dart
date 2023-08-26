class userModel {
  final int username;
  final String password;

  const userModel({required this.username, required this.password});

  factory userModel.fromJson(Map<String, dynamic> json) {
    return userModel(
      username: json['username'],
      password: json['password'],
    );
  }
}