class Babyhatch {
  final int babyhatch_auto_id;
  final String bhID;
  final String bhName;
  final String bhState;
  final String bhAddress;
  final String bhHotline;
  final String mapLatitude;
  final String mapLongitude;
  final int user_id_auto;

  Babyhatch({
    required this.babyhatch_auto_id,
    required this.bhID,
    required this.bhName,
    required this.bhState,
    required this.bhAddress,
    required this.bhHotline,
    required this.mapLatitude,
    required this.mapLongitude,
    required this.user_id_auto,
  });

  factory Babyhatch.fromMap(Map<String, dynamic> snippet) {
    return Babyhatch(
      babyhatch_auto_id: snippet['resourceId']['videoId'],
      bhID: snippet['title'],
      bhName: snippet['thumbnails']['high']['url'],
      bhState: snippet['channelTitle'],
      bhAddress: snippet['channelTitle'],
      bhHotline: snippet['channelTitle'],
      mapLatitude: snippet['channelTitle'],
      mapLongitude: snippet['channelTitle'],
      user_id_auto: snippet['channelTitle'],
    );
  }
}