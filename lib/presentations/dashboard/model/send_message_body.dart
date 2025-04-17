class SendMessageBody {
  String? equipmentId;
  String? message;
  String? deviceType;
  String? categoryId;

  SendMessageBody({
    this.equipmentId,
    this.message,
    this.deviceType,
    this.categoryId,
  });

  SendMessageBody.fromJson(Map<String, dynamic> json) {
    equipmentId = json['equipment_id'];
    message = json['message'];
    deviceType = json['device_type'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['equipment_id'] = this.equipmentId;
    data['message'] = this.message;
    data['device_type'] = this.deviceType;
    data['category_id'] = this.categoryId;
    return data;
  }
}
