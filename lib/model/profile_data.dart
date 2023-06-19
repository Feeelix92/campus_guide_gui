class ProfileData {
  final String? id;
  final String? image;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;

  const ProfileData({
    required this.id,
    required this.image,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
  });

  factory ProfileData.fromJSON(Map<String, dynamic> json) {
    return ProfileData(
      id: json['id'] as String?,
      image: json['image'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );
  }
}