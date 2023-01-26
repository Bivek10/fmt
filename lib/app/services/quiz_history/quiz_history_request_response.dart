class QuizHistoryRequestResponse {
  String? msg;

  QuizHistoryRequestResponse({this.msg});

  QuizHistoryRequestResponse.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['msg'] = msg;
    return data;
  }
}
