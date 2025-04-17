class RegisterDeviceBody {
  String? id;
  String? headUnitSn;

  RegisterDeviceBody({this.id, this.headUnitSn});

  RegisterDeviceBody.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    headUnitSn = json['head_unit_sn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['head_unit_sn'] = this.headUnitSn;
    return data;
  }
}
