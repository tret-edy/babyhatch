class Faq {
  final int fq_auto_id;
  final String fqID;
  final String fqQuestion;
  final String fqAnswer;
  final String fqCategory;
  final int user_id_auto;

  Faq({
    required this.fq_auto_id,
    required this.fqID,
    required this.fqQuestion,
    required this.fqAnswer,
    required this.fqCategory,
    required this.user_id_auto,
  });

  factory Faq.fromMap(Map<String, dynamic> snippet) {
    return Faq(
      fq_auto_id: snippet['resourceId']['videoId'],
      fqID: snippet['title'],
      fqQuestion: snippet['thumbnails']['high']['url'],
      fqAnswer: snippet['channelTitle'],
      fqCategory: snippet['channelTitle'],
      user_id_auto: snippet['channelTitle'],
    );
  }
}