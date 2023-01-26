class QuizHistoryRequest {
  int? quizId;
  String? userId;
  int? score;

  QuizHistoryRequest({this.quizId, this.userId, this.score});

  QuizHistoryRequest.fromJson(Map<String, dynamic> json) {
    quizId = json['quiz_id'];
    userId = json['user_id'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quiz_id'] = this.quizId;
    data['user_id'] = this.userId;
    data['score'] = this.score;
    return data;
  }
}
