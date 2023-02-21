import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionPaperModel {
  String? id;
  String? title;
  String? imageUrl;
  String? description;
  int? timeSeconds;
  List<Questions>? questions;
  int? questionCount;

  QuestionPaperModel(
      {required this.id,
      required this.title,
      this.imageUrl,
      required this.description,
      required this.timeSeconds,
      required this.questionCount,
      this.questions});

  QuestionPaperModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['title'] as String,
        imageUrl = json['image_url'] as String,
        description = json['description'] as String,
        timeSeconds = json['time_seconds'] as int,
        questionCount = json['question_count'] as int;

  QuestionPaperModel.fromDocumentSnapshot({
    required DocumentSnapshot json,
  }) {
    id = json['id'] as String;
    title = json['title'] as String;
    imageUrl = json['image_url'] as String;
    description = json['description'] as String;
    timeSeconds = int.parse(json['time_seconds'].toString());
    questionCount = json['question_count'] as int;
    // questions = (json['questions'] as List)
    //     .map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
    //     .toList();
  }
  QuestionPaperModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json)
      : id = json.id,
        title = json['title'],
        imageUrl = json['image_url'],
        description = json['description'],
        timeSeconds = json['time_seconds'],
        questionCount = json['question_count'] as int;

  String timeinMinutes() => "${(timeSeconds! / 60).ceil()} mins";
  // questions = (json['questions'] as List)
  //     .map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
  //     .toList();
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image_url'] = imageUrl;
    data['Description'] = description;
    data['time_seconds'] = timeSeconds;

    return data;
  }
}

class Questions {
  String id;
  String question;
  List<Answers>? answers;
  String? correctAnswer;
  String? selectedAnswer;

  Questions(
      {required this.id,
      required this.question,
      required this.answers,
      this.correctAnswer});

  // : means the values get initialized before the constructor body runs
  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        answers =
            (json['answers'] as List).map((e) => Answers.fromJson(e)).toList(),
        correctAnswer = json['correct_answer'];

  Questions.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        question = snapshot['question'],
        answers = [],
        correctAnswer = snapshot['correct_answer'];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    data['correct_answer'] = correctAnswer;
    return data;
  }
}

class Answers {
  String? identifier;
  String? answer;

  Answers({this.identifier, this.answer});

  Answers.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    answer = json['answer'];
  }

  Answers.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : identifier = snapshot['identifier'] as String,
        answer = snapshot['answer'] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['answer'] = answer;
    return data;
  }
}

class UserModel {
  final String email;
  final String name;
  final String profilepic;
  final int role;

  UserModel({
    required this.email,
    required this.name,
    required this.profilepic,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json["email"],
      name: json["name"],
      profilepic: json["profilepic"],
      role: json["role"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "name": name,
      "profilepic": profilepic,
      "role": role,
    };
  }
}
