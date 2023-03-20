class Player {
  int? id;
  String? name;
  int? score;
  Player({
    this.id,
    this.name,
    this.score,
  });
  Player.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    score = json["score"];
  }
  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["name"] = name;
    data["score"] = score;
    return data;
  }
}
