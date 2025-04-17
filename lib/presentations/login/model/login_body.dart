class LoginBody {
  String? unitId;
  String? nik;
  String? shiftId;
  int? loginType;

  LoginBody({this.unitId, this.nik, this.shiftId, this.loginType});

  LoginBody.fromJson(Map<String, dynamic> json) {
    unitId = json['unit_id'];
    nik = json['nik'];
    shiftId = json['shift_id'];
    loginType = json['login_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit_id'] = this.unitId;
    data['nik'] = this.nik;
    data['shift_id'] = this.shiftId;
    data['login_type'] = this.loginType;
    return data;
  }
}
