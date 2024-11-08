class QuestionsModel {
  String? question;
  String? answer;
  String? hint;
  String? categoryType;
  String? createdAt;
  String? updatedAt;

  QuestionsModel(
      {this.question,
      this.answer,
      this.hint,
      this.categoryType,
      this.createdAt,
      this.updatedAt});

  QuestionsModel.fromJson(Map<String, dynamic> json) {
    question = json['question'] ?? "";
    answer = json['answer'] ?? "";
    hint = json['hint'] ?? "";
    categoryType = json['category_type'] != null
        ? json['category_type']["name"]
        : "Alphabet";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;
    data['hint'] = hint;
    // if (this.categoryType != null) {
    //   data['category_type'] = this.categoryType!.toJson();
    // }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
