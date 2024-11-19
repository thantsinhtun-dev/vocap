class UserEntity {
  final String name;
  final String email;
  final String image;
  final String phoneNumber;
  final String uid;
  final String token;

  const UserEntity({
    required this.name,
    required this.email,
    required this.image,
    required this.phoneNumber,
    required this.uid,
    required this.token,
  });


  @override
  String toString() {
    return "name : ${name} , email : ${email}, image : ${image}, phoneNumber : ${phoneNumber}, uid : ${uid}, token : ${token}";
  }
}
