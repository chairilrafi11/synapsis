class Auth {
  String? id;
  int? roleId;
  String? roleName;
  bool? isDefaultRole;
  String? departmentId;
  String? departmentName;
  String? siteId;
  String? siteName;
  Null? fleetId;
  String? nik;
  String? name;
  String? email;
  String? phone;
  bool? isActive;
  String? imageUrl;
  String? unitId;
  String? unitCode;
  String? unitTypeId;
  String? unitCategoryId;
  int? loginType;
  int? loginStatus;
  String? loginAt;
  int? lastTotalCycle;
  int? lastTotalHauler;
  String? lastCycleId;
  String? lastActivityId;
  LastPit? lastPit;
  LastHauler? lastHauler;
  LastLoader? lastLoader;
  LastPit? lastLoadingPoint;
  LastPit? lastDumpingPoint;
  LastPit? lastMaterial;
  bool? cycleFinished;
  bool? isDisposal;

  Auth({
    this.id,
    this.roleId,
    this.roleName,
    this.isDefaultRole,
    this.departmentId,
    this.departmentName,
    this.siteId,
    this.siteName,
    this.fleetId,
    this.nik,
    this.name,
    this.email,
    this.phone,
    this.isActive,
    this.imageUrl,
    this.unitId,
    this.unitCode,
    this.unitTypeId,
    this.unitCategoryId,
    this.loginType,
    this.loginStatus,
    this.loginAt,
    this.lastTotalCycle,
    this.lastTotalHauler,
    this.lastCycleId,
    this.lastActivityId,
    this.lastPit,
    this.lastHauler,
    this.lastLoader,
    this.lastLoadingPoint,
    this.lastDumpingPoint,
    this.lastMaterial,
    this.cycleFinished,
    this.isDisposal,
  });

  Auth.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    roleName = json['role_name'];
    isDefaultRole = json['is_default_role'];
    departmentId = json['department_id'];
    departmentName = json['department_name'];
    siteId = json['site_id'];
    siteName = json['site_name'];
    fleetId = json['fleet_id'];
    nik = json['nik'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    isActive = json['is_active'];
    imageUrl = json['image_url'];
    unitId = json['unit_id'];
    unitCode = json['unit_code'];
    unitTypeId = json['unit_type_id'];
    unitCategoryId = json['unit_category_id'];
    loginType = json['login_type'];
    loginStatus = json['login_status'];
    loginAt = json['login_at'];
    lastTotalCycle = json['last_total_cycle'];
    lastTotalHauler = json['last_total_hauler'];
    lastCycleId = json['last_cycle_id'];
    lastActivityId = json['last_activity_id'];
    lastPit = json['last_pit'] != null ? new LastPit.fromJson(json['last_pit']) : null;
    lastHauler = json['last_hauler'] != null ? new LastHauler.fromJson(json['last_hauler']) : null;
    lastLoader = json['last_loader'] != null ? new LastLoader.fromJson(json['last_loader']) : null;
    lastLoadingPoint = json['last_loading_point'] != null ? new LastPit.fromJson(json['last_loading_point']) : null;
    lastDumpingPoint = json['last_dumping_point'] != null ? new LastPit.fromJson(json['last_dumping_point']) : null;
    lastMaterial = json['last_material'] != null ? new LastPit.fromJson(json['last_material']) : null;
    cycleFinished = json['cycle_finished'];
    isDisposal = json['is_disposal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role_id'] = this.roleId;
    data['role_name'] = this.roleName;
    data['is_default_role'] = this.isDefaultRole;
    data['department_id'] = this.departmentId;
    data['department_name'] = this.departmentName;
    data['site_id'] = this.siteId;
    data['site_name'] = this.siteName;
    data['fleet_id'] = this.fleetId;
    data['nik'] = this.nik;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['is_active'] = this.isActive;
    data['image_url'] = this.imageUrl;
    data['unit_id'] = this.unitId;
    data['unit_code'] = this.unitCode;
    data['unit_type_id'] = this.unitTypeId;
    data['unit_category_id'] = this.unitCategoryId;
    data['login_type'] = this.loginType;
    data['login_status'] = this.loginStatus;
    data['login_at'] = this.loginAt;
    data['last_total_cycle'] = this.lastTotalCycle;
    data['last_total_hauler'] = this.lastTotalHauler;
    data['last_cycle_id'] = this.lastCycleId;
    data['last_activity_id'] = this.lastActivityId;
    if (this.lastPit != null) {
      data['last_pit'] = this.lastPit!.toJson();
    }
    if (this.lastHauler != null) {
      data['last_hauler'] = this.lastHauler!.toJson();
    }
    if (this.lastLoader != null) {
      data['last_loader'] = this.lastLoader!.toJson();
    }
    if (this.lastLoadingPoint != null) {
      data['last_loading_point'] = this.lastLoadingPoint!.toJson();
    }
    if (this.lastDumpingPoint != null) {
      data['last_dumping_point'] = this.lastDumpingPoint!.toJson();
    }
    if (this.lastMaterial != null) {
      data['last_material'] = this.lastMaterial!.toJson();
    }
    data['cycle_finished'] = this.cycleFinished;
    data['is_disposal'] = this.isDisposal;
    return data;
  }
}

class LastPit {
  String? id;
  String? name;

  LastPit({this.id, this.name});

  LastPit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class LastHauler {
  String? haulerId;
  String? code;
  String? operatorHaulerId;

  LastHauler({this.haulerId, this.code, this.operatorHaulerId});

  LastHauler.fromJson(Map<String, dynamic> json) {
    haulerId = json['hauler_id'];
    code = json['code'];
    operatorHaulerId = json['operator_hauler_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hauler_id'] = this.haulerId;
    data['code'] = this.code;
    data['operator_hauler_id'] = this.operatorHaulerId;
    return data;
  }
}

class LastLoader {
  String? loaderId;
  String? code;
  String? operatorLoaderId;

  LastLoader({this.loaderId, this.code, this.operatorLoaderId});

  LastLoader.fromJson(Map<String, dynamic> json) {
    loaderId = json['loader_id'];
    code = json['code'];
    operatorLoaderId = json['operator_loader_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loader_id'] = this.loaderId;
    data['code'] = this.code;
    data['operator_loader_id'] = this.operatorLoaderId;
    return data;
  }
}
