class ResponseApi {
  bool? success;
  int? code;
  bool? status;
  String? message;
  dynamic data;

  ResponseApi({
    this.success = false,
    this.code,
    this.status,
    this.message,
    this.data,
  });

  ResponseApi.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}
