

class User {
  String? uid;
  String? email;
  String? fullName;

  User({
    required this.uid,
    required this.email,
    required this.fullName,
  });

  static User fromMap(Map<String, dynamic> map) {
    return User(uid: map['uid'], email: map['email'], fullName: map['fullName']);
  }
}
