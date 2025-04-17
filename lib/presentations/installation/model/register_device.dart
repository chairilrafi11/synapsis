class RegisterDevice {
  String? id;
  bool? isActive;
  Null? activatedAt;
  String? createdAt;
  String? updatedAt;
  String? headUnitSn;
  Null? equipment;

  RegisterDevice({
    this.id,
    this.isActive,
    this.activatedAt,
    this.createdAt,
    this.updatedAt,
    this.headUnitSn,
    this.equipment,
  });

  RegisterDevice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['is_active'];
    activatedAt = json['activated_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    headUnitSn = json['head_unit_sn'];
    equipment = json['equipment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_active'] = this.isActive;
    data['activated_at'] = this.activatedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['head_unit_sn'] = this.headUnitSn;
    data['equipment'] = this.equipment;
    return data;
  }
}
