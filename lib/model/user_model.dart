// class User {
//   const User({
//     required this.id,
//     this.email,
//     this.fullName,

//   });

//   final String id;
//   final String? email;
//   final String? fullName;

//   static const empty = User(id: '');

//   bool get isEmpty => this == User.empty;
//   bool get isNotEmpty => this != User.empty;



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
