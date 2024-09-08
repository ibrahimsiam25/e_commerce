class UserEntity {
  final String name;
  final String email;
  final String uId;

  UserEntity({required this.name, required this.email, required this.uId});



  toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
    };
  }

}
