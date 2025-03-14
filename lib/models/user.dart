class User {
  final int id;
  final String email;
  final String fullName;
  final String? photoURL;

  User({
    required this.id,
    required this.email,
    required this.fullName,
    this.photoURL,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      fullName: json['fullName'],
      photoURL: json['photoURL'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'photoURL': photoURL,
    };
  }
}
