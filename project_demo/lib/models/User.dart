class User {

  final String? name;
  final String? password;
  final String? email;

  User(  this.name, this.password, this.email);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(

      json['name'] as String?, // Optional String
      json['password'] as String?,
      json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {

      'name': name,
      'password': password,
      'email': email,
    };
  }
}
