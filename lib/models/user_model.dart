
class AppUser {
  AppUser(
      {required this.email, required this.userToken, required this.username});
  final String username;
  final String email;
  final String userToken;

  factory AppUser.fromjson({required Map<String, dynamic> json}) {
    return AppUser(
        username: json['username'],
        email: json['email'],
        userToken: json['token']);
  }

  Map<String, String> toJson() {
    return {
      "username": username,
      "email": email,
      "token": userToken,
    };
  }

  factory AppUser.empty() {
    return AppUser(username: '', email: '', userToken: '');
  }

  bool get isEmpty =>
      email.trim().isEmpty &&
      userToken.trim().isEmpty &&
      username.trim().isEmpty;
}
