class Questions {
  int? id;
  String? question;
  String? answer1;
  String? answer2;
  String? answer3;
  String? answer4;
  String? result;
  String? correct;
  Questions({
    this.id,
    this.question,
    this.answer1,
    this.answer2,
    this.answer3,
    this.answer4,
    this.result,
    this.correct,
  });
  Questions.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    question = json["question"];
    answer1 = json["answer1"];
    answer2 = json["answer2"];
    answer3 = json["answer3"];
    answer4 = json["answer4"];
    result = json["result"];
    correct = json["correct"];
  }
  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["question"] = question;
    data["answer1"] = answer1;
    data["answer2"] = answer2;
    data["answer3"] = answer3;
    data["answer4"] = answer4;
    data["result"] = result;
    data["correct"] = correct;
    return data;
  }
}
