class Player {
  int? score;
  String? name;

  Player({
    this.score,
    this.name,
  });

  Player.fromJson(Map<String, dynamic> json) {
    score = json["score"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["score"] = score;
    data["name"] = name;
    return data;
  }
}
