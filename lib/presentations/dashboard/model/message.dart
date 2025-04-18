class Message {
  String? id;
  String? equipmentId;
  String? senderNik;
  bool? isRead;
  String? message;
  String? createdAt;
  String? updatedAt;
  String? senderName;
  String? deviceType;
  String? categoryId;
  String? equipmentCode;
dynamic fleetId;
  String? equipmentSiteId;
  String? categoryName;

  Message({
    this.id,
    this.equipmentId,
    this.senderNik,
    this.isRead,
    this.message,
    this.createdAt,
    this.updatedAt,
    this.senderName,
    this.deviceType,
    this.categoryId,
    this.equipmentCode,
    this.fleetId,
    this.equipmentSiteId,
    this.categoryName,
  });

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    equipmentId = json['equipment_id'];
    senderNik = json['sender_nik'];
    isRead = json['is_read'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    senderName = json['sender_name'];
    deviceType = json['device_type'];
    categoryId = json['category_id'];
    equipmentCode = json['equipment_code'];
    fleetId = json['fleet_id'];
    equipmentSiteId = json['equipment_site_id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['equipment_id'] = this.equipmentId;
    data['sender_nik'] = this.senderNik;
    data['is_read'] = this.isRead;
    data['message'] = this.message;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['sender_name'] = this.senderName;
    data['device_type'] = this.deviceType;
    data['category_id'] = this.categoryId;
    data['equipment_code'] = this.equipmentCode;
    data['fleet_id'] = this.fleetId;
    data['equipment_site_id'] = this.equipmentSiteId;
    data['category_name'] = this.categoryName;
    return data;
  }
}
