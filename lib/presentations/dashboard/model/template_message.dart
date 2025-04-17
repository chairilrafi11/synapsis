class TemplateMessage {
  String? id;
  String? name;
  String? categoryId;
  String? createdAt;
  String? updatedAt;
  String? categoryName;
  bool? isForOperator;
  bool? isForDispatch;
  bool? isActive;
  bool? isNotifScheduler;
  String? templateMessageOperator;
  String? templateMessageDispatch;

  TemplateMessage({
    this.id,
    this.name,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.categoryName,
    this.isForOperator,
    this.isForDispatch,
    this.isActive,
    this.isNotifScheduler,
    this.templateMessageOperator,
    this.templateMessageDispatch,
  });

  TemplateMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryName = json['category_name'];
    isForOperator = json['is_for_operator'];
    isForDispatch = json['is_for_dispatch'];
    isActive = json['is_active'];
    isNotifScheduler = json['is_notif_scheduler'];
    templateMessageOperator = json['template_message_operator'];
    templateMessageDispatch = json['template_message_dispatch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['category_name'] = this.categoryName;
    data['is_for_operator'] = this.isForOperator;
    data['is_for_dispatch'] = this.isForDispatch;
    data['is_active'] = this.isActive;
    data['is_notif_scheduler'] = this.isNotifScheduler;
    data['template_message_operator'] = this.templateMessageOperator;
    data['template_message_dispatch'] = this.templateMessageDispatch;
    return data;
  }
}
