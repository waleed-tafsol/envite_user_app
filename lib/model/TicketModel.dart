class TicketModel {
  String? title;
  String? description;
  int? ticketNumber;
  String? createdBy;
  String? status;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  TicketModel(
      {this.title,
      this.description,
      this.ticketNumber,
      this.createdBy,
      this.status,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  TicketModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    ticketNumber = json['ticketNumber'];
    createdBy = json['createdBy'];
    status = json['status'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['ticketNumber'] = this.ticketNumber;
    data['createdBy'] = this.createdBy;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
