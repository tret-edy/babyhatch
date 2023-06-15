class User {
  final int user_id_auto;
  final String userID;
  final String username;
  final String user_phone;
  final String user_nama;
  final String user_password;
  final String user_email;
  final String user_active;
  final String user_type;
  final String user_verification;

  User({
    required this.user_id_auto,
    required this.userID,
    required this.username,
    required this.user_phone,
    required this.user_nama,
    required this.user_password,
    required this.user_email,
    required this.user_active,
    required this.user_type,
    required this.user_verification,
  });

  factory User.fromMap(Map<String, dynamic> snippet) {
    return User(
      user_id_auto: snippet['resourceId']['videoId'],
      userID: snippet['title'],
      username: snippet['thumbnails']['high']['url'],
      user_phone: snippet['channelTitle'],
      user_nama: snippet['channelTitle'],
      user_password: snippet['channelTitle'],
      user_email: snippet['channelTitle'],
      user_active: snippet['channelTitle'],
      user_type: snippet['channelTitle'],
      user_verification: snippet['channelTitle'],
    );
  }
}