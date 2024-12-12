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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalBalance'] = this.totalBalance;
    data['remainingBalance'] = this.remainingBalance;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
