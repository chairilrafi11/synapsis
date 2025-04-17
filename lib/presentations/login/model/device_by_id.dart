  import 'package:synapsis/domain/model/base_model.dart';

class DeviceById {
	String? id;
	bool? isActive;
	dynamic activatedAt;
	String? createdAt;
	String? updatedAt;
	String? headUnitSn;
	Equipment? equipment;

	DeviceById({this.id, this.isActive, this.activatedAt, this.createdAt, this.updatedAt, this.headUnitSn, this.equipment});

	DeviceById.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		isActive = json['is_active'];
		activatedAt = json['activated_at'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		headUnitSn = json['head_unit_sn'];
		equipment = json['equipment'] != null ? new Equipment.fromJson(json['equipment']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['is_active'] = this.isActive;
		data['activated_at'] = this.activatedAt;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['head_unit_sn'] = this.headUnitSn;
		if (this.equipment != null) {
      data['equipment'] = this.equipment!.toJson();
    }
		return data;
	}
}

class Equipment {
	String? id;
	Site? site;
	Model? model;
	String? nearonSn;
	String? headUnitSn;
	String? deviceId;
	String? serialNumber;
	String? code;
	int? hm;
	int? km;
	String? engineNo;
	String? engineModel;
	String? purchasedDate;
	String? purchasedStatus;
	String? conditionStatus;
	String? outlineColor;
	bool? isActive;
	String? createdAt;
	String? updatedAt;
	Telemetry? telemetry;
	SiteFactorMaterial? siteFactorMaterial;
	InstalledModification? installedModification;
	dynamic siteFactorMaterials;

	Equipment({this.id, this.site, this.model, this.nearonSn, this.headUnitSn, this.deviceId, this.serialNumber, this.code, this.hm, this.km, this.engineNo, this.engineModel, this.purchasedDate, this.purchasedStatus, this.conditionStatus, this.outlineColor, this.isActive, this.createdAt, this.updatedAt, this.telemetry, this.siteFactorMaterial, this.installedModification, this.siteFactorMaterials});

	Equipment.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		site = json['site'] != null ? new Site.fromJson(json['site']) : null;
		model = json['model'] != null ? new Model.fromJson(json['model']) : null;
		nearonSn = json['nearon_sn'];
		headUnitSn = json['head_unit_sn'];
		deviceId = json['device_id'];
		serialNumber = json['serial_number'];
		code = json['code'];
		hm = json['hm'];
		km = json['km'];
		engineNo = json['engine_no'];
		engineModel = json['engine_model'];
		purchasedDate = json['purchased_date'];
		purchasedStatus = json['purchased_status'];
		conditionStatus = json['condition_status'];
		outlineColor = json['outline_color'];
		isActive = json['is_active'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		telemetry = json['telemetry'] != null ? new Telemetry.fromJson(json['telemetry']) : null;
		siteFactorMaterial = json['site_factor_material'] != null ? new SiteFactorMaterial.fromJson(json['site_factor_material']) : null;
		installedModification = json['installed_modification'] != null ? new InstalledModification.fromJson(json['installed_modification']) : null;
		siteFactorMaterials = json['site_factor_materials'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		if (this.site != null) {
      data['site'] = this.site!.toJson();
    }
		if (this.model != null) {
      data['model'] = this.model!.toJson();
    }
		data['nearon_sn'] = this.nearonSn;
		data['head_unit_sn'] = this.headUnitSn;
		data['device_id'] = this.deviceId;
		data['serial_number'] = this.serialNumber;
		data['code'] = this.code;
		data['hm'] = this.hm;
		data['km'] = this.km;
		data['engine_no'] = this.engineNo;
		data['engine_model'] = this.engineModel;
		data['purchased_date'] = this.purchasedDate;
		data['purchased_status'] = this.purchasedStatus;
		data['condition_status'] = this.conditionStatus;
		data['outline_color'] = this.outlineColor;
		data['is_active'] = this.isActive;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		if (this.telemetry != null) {
      data['telemetry'] = this.telemetry!.toJson();
    }
		if (this.siteFactorMaterial != null) {
      data['site_factor_material'] = this.siteFactorMaterial!.toJson();
    }
		if (this.installedModification != null) {
      data['installed_modification'] = this.installedModification!.toJson();
    }
		data['site_factor_materials'] = this.siteFactorMaterials;
		return data;
	}
}

class Site {
	String? id;
	String? geoJsonUrl;
	String? site;
	String? name;
	String? clientName;
	String? address;
	String? latitude;
	String? longitude;
	bool? isActive;
	bool? isDefault;
	String? createdAt;
	String? updatedAt;
	Geojson? geojson;

	Site({this.id, this.geoJsonUrl, this.site, this.name, this.clientName, this.address, this.latitude, this.longitude, this.isActive, this.isDefault, this.createdAt, this.updatedAt, this.geojson});

	Site.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		geoJsonUrl = json['geo_json_url'];
		site = json['site'];
		name = json['name'];
		clientName = json['client_name'];
		address = json['address'];
		latitude = json['latitude'];
		longitude = json['longitude'];
		isActive = json['is_active'];
		isDefault = json['is_default'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		geojson = json['geojson'] != null ? new Geojson.fromJson(json['geojson']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['geo_json_url'] = this.geoJsonUrl;
		data['site'] = this.site;
		data['name'] = this.name;
		data['client_name'] = this.clientName;
		data['address'] = this.address;
		data['latitude'] = this.latitude;
		data['longitude'] = this.longitude;
		data['is_active'] = this.isActive;
		data['is_default'] = this.isDefault;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		if (this.geojson != null) {
      data['geojson'] = this.geojson!.toJson();
    }
		return data;
	}
}

class Geojson {
	String? fileName;
	dynamic coordinates;

	Geojson({this.fileName, this.coordinates});

	Geojson.fromJson(Map<String, dynamic> json) {
		fileName = json['file_name'];
		coordinates = json['coordinates'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['file_name'] = this.fileName;
		data['coordinates'] = this.coordinates;
		return data;
	}
}

class Model {
	String? id;
	String? no;
	String? name;
	int? capacity;
	dynamic radiusMeters;
	bool? isTyre;
	String? tyreClass;
	bool? isActive;
	BaseModel? classModel;
	BaseModel? measurement;
	Manufacture? manufacture;
	EquipmentCategory? equipmentCategory;
	String? createdAt;
	String? updatedAt;

	Model({this.id, this.no, this.name, this.capacity, this.radiusMeters, this.isTyre, this.tyreClass, this.isActive, this.classModel, this.measurement, this.manufacture, this.equipmentCategory, this.createdAt, this.updatedAt});

	Model.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		no = json['no'];
		name = json['name'];
		capacity = json['capacity'];
		radiusMeters = json['radius_meters'];
		isTyre = json['is_tyre'];
		tyreClass = json['tyre_class'];
		isActive = json['is_active'];
		classModel = json['class'] != null ? new BaseModel.fromJson(json['class']) : null;
		measurement = json['measurement'] != null ? new BaseModel.fromJson(json['measurement']) : null;
		manufacture = json['manufacture'] != null ? new Manufacture.fromJson(json['manufacture']) : null;
		equipmentCategory = json['equipment_category'] != null ? new EquipmentCategory.fromJson(json['equipment_category']) : null;
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['no'] = this.no;
		data['name'] = this.name;
		data['capacity'] = this.capacity;
		data['radius_meters'] = this.radiusMeters;
		data['is_tyre'] = this.isTyre;
		data['tyre_class'] = this.tyreClass;
		data['is_active'] = this.isActive;
		if (this.classModel != null) {
      data['class'] = this.classModel!.toJson();
    }
		if (this.measurement != null) {
      data['measurement'] = this.measurement!.toJson();
    }
		if (this.manufacture != null) {
      data['manufacture'] = this.manufacture!.toJson();
    }
		if (this.equipmentCategory != null) {
      data['equipment_category'] = this.equipmentCategory!.toJson();
    }
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		return data;
	}
}

class Manufacture {
	String? id;
	String? code;
	String? name;
	bool? isActive;
	String? createdAt;
	String? updatedAt;
	int? modelCount;
	String? type;
	String? system;

	Manufacture({this.id, this.code, this.name, this.isActive, this.createdAt, this.updatedAt, this.modelCount, this.type, this.system});

	Manufacture.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		code = json['code'];
		name = json['name'];
		isActive = json['is_active'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		modelCount = json['model_count'];
		type = json['type'];
		system = json['system'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['code'] = this.code;
		data['name'] = this.name;
		data['is_active'] = this.isActive;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['model_count'] = this.modelCount;
		data['type'] = this.type;
		data['system'] = this.system;
		return data;
	}
}

class EquipmentCategory {
	String? id;
	String? name;
	bool? isActive;
	bool? isDefault;
	String? createdAt;
	String? updatedAt;
	EquipmentType? equipmentType;

	EquipmentCategory({this.id, this.name, this.isActive, this.isDefault, this.createdAt, this.updatedAt, this.equipmentType});

	EquipmentCategory.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		name = json['name'];
		isActive = json['is_active'];
		isDefault = json['is_default'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		equipmentType = json['equipment_type'] != null ? new EquipmentType.fromJson(json['equipment_type']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['name'] = this.name;
		data['is_active'] = this.isActive;
		data['is_default'] = this.isDefault;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		if (this.equipmentType != null) {
      data['equipment_type'] = this.equipmentType!.toJson();
    }
		return data;
	}
}

class EquipmentType {
	String? id;
	String? name;
	String? code;
	String? iconUrl;
	bool? isActive;
	bool? isDefault;
	dynamic modifications;
	String? createdAt;
	String? updatedAt;
	String? appBackgroundUrl;
	String? appLabel;

	EquipmentType({this.id, this.name, this.code, this.iconUrl, this.isActive, this.isDefault, this.modifications, this.createdAt, this.updatedAt, this.appBackgroundUrl, this.appLabel});

	EquipmentType.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		name = json['name'];
		code = json['code'];
		iconUrl = json['icon_url'];
		isActive = json['is_active'];
		isDefault = json['is_default'];
		modifications = json['modifications'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		appBackgroundUrl = json['app_background_url'];
		appLabel = json['app_label'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['name'] = this.name;
		data['code'] = this.code;
		data['icon_url'] = this.iconUrl;
		data['is_active'] = this.isActive;
		data['is_default'] = this.isDefault;
		data['modifications'] = this.modifications;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['app_background_url'] = this.appBackgroundUrl;
		data['app_label'] = this.appLabel;
		return data;
	}
}

class Telemetry {
	dynamic totalDistanceTravelled;

	Telemetry({this.totalDistanceTravelled});

	Telemetry.fromJson(Map<String, dynamic> json) {
		totalDistanceTravelled = json['total_distance_travelled'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['total_distance_travelled'] = this.totalDistanceTravelled;
		return data;
	}
}

class SiteFactorMaterial {
	int? factorMaterial;
	String? materialId;
	String? materialName;
	String? measurementId;
	String? measurementName;

	SiteFactorMaterial({this.factorMaterial, this.materialId, this.materialName, this.measurementId, this.measurementName});

	SiteFactorMaterial.fromJson(Map<String, dynamic> json) {
		factorMaterial = json['factor_material'];
		materialId = json['material_id'];
		materialName = json['material_name'];
		measurementId = json['measurement_id'];
		measurementName = json['measurement_name'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['factor_material'] = this.factorMaterial;
		data['material_id'] = this.materialId;
		data['material_name'] = this.materialName;
		data['measurement_id'] = this.measurementId;
		data['measurement_name'] = this.measurementName;
		return data;
	}
}

class InstalledModification {
	String? id;
	String? modification;
	String? description;

	InstalledModification({this.id, this.modification, this.description});

	InstalledModification.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		modification = json['modification'];
		description = json['description'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['modification'] = this.modification;
		data['description'] = this.description;
		return data;
	}
}