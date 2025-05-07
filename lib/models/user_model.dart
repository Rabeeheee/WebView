class UserModel {
  final String phoneNumber;
  final String uid;

  UserModel({required this.phoneNumber, required this.uid});

  Map<String, dynamic> toMap() {
    return {
      'phoneNumber': phoneNumber,
      'uid': uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      phoneNumber: map['phoneNumber'] ?? '',
      uid: map['uid'] ?? '',
    );
  }
}