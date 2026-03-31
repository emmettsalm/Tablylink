class AppUser {
  final int id;
  final String username;
  final String email;
  final String phone;
  final String profileImage;
  final DateTime? dateOfBirth;

  AppUser({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    this.profileImage = '',
    this.dateOfBirth,
  });
}