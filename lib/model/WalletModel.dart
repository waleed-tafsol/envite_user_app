class Wallet {
  int? totalBalance;
  int? remainingBalance;
  String? sId;
  String? createdAt;
  String? updatedAt;

  Wallet(
      {this.totalBalance,
      this.remainingBalance,
      this.sId,
      this.createdAt,
      this.updatedAt});

  Wallet.fromJson(Map<String, dynamic> json) {
    totalBalance = json['totalBalance'];
    remainingBalance = json['remainingBalance'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalBalance'] = totalBalance;
    data['remainingBalance'] = remainingBalance;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
