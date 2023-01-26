class QuestionRequestResponse {
  int? count;
  List<QuestionData>? questionData;

  QuestionRequestResponse({this.count, this.questionData});

  QuestionRequestResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['data'] != null) {
      questionData = <QuestionData>[];
      json['data'].forEach((v) {
        questionData!.add( QuestionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> questionData =  Map<String, dynamic>();
    questionData['count'] = this.count;
    if (this.questionData != null) {
      questionData['data'] = this.questionData!.map((v) => v.toJson()).toList();
    }
    return questionData;
  }
}

class QuestionData {
  int? id;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? question;
  int? quizId;
  List<Choices>? choices;

  QuestionData(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.question,
      this.quizId,
      this.choices});

  QuestionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    question = json['question'];
    quizId = json['quiz_id'];
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add( Choices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> QuestionData =  Map<String, dynamic>();
    QuestionData['id'] = this.id;
    QuestionData['created_at'] = this.createdAt;
    QuestionData['updated_at'] = this.updatedAt;
    QuestionData['deleted_at'] = this.deletedAt;
    QuestionData['question'] = this.question;
    QuestionData['quiz_id'] = this.quizId;
    if (this.choices != null) {
      QuestionData['choices'] = this.choices!.map((v) => v.toJson()).toList();
    }
    return QuestionData;
  }
}

class Choices {
  int? id;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? choice;
  int? isCorrect;
  int? questionId;

  Choices(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.choice,
      this.isCorrect,
      this.questionId});

  Choices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    choice = json['choice'];
    isCorrect = json['is_correct'];
    questionId = json['question_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> QuestionData =  Map<String, dynamic>();
    QuestionData['id'] = this.id;
    QuestionData['created_at'] = this.createdAt;
    QuestionData['updated_at'] = this.updatedAt;
    QuestionData['deleted_at'] = this.deletedAt;
    QuestionData['choice'] = this.choice;
    QuestionData['is_correct'] = this.isCorrect;
    QuestionData['question_id'] = this.questionId;
    return QuestionData;
  }
}
