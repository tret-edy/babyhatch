class Infographic {
  final int ig_auto_id;
  final String igID;
  final String igName;
  final String igImage;
  final String igDesc;
  final String igCategory;
  final int user_auto_id;

  Infographic({
    required this.ig_auto_id,
    required this.igID,
    required this.igName,
    required this.igImage,
    required this.igDesc,
    required this.igCategory,
    required this.user_auto_id,
  });

  factory Infographic.fromMap(Map<String, dynamic> snippet) {
    return Infographic(
      ig_auto_id: snippet['resourceId']['videoId'],
      igID: snippet['title'],
      igName: snippet['thumbnails']['high']['url'],
      igImage: snippet['channelTitle'],
      igDesc: snippet['channelTitle'],
      igCategory: snippet['channelTitle'],
      user_auto_id: snippet['channelTitle'],
    );
  }
}