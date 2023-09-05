class NotificationModel {
  String? notificationId;
  String? notificationTitle;
  String? notificationDesc;
  String? notificationImage;
  String? notificationItemid;
  String? notificationUserid;
  String? notificationApprove;
  String? notificationTimecreate;

  NotificationModel(
      {this.notificationId,
      this.notificationTitle,
      this.notificationDesc,
      this.notificationImage,
      this.notificationItemid,
      this.notificationUserid,
      this.notificationApprove,
      this.notificationTimecreate});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationTitle = json['notification_title'];
    notificationDesc = json['notification_desc'];
    notificationImage = json['notification_image'];
    notificationItemid = json['notification_itemid'];
    notificationUserid = json['notification_userid'];
    notificationApprove = json['notification_approve'];
    notificationTimecreate = json['notification_timecreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['notification_id'] = notificationId;
    data['notification_title'] = notificationTitle;
    data['notification_desc'] = notificationDesc;
    data['notification_image'] = notificationImage;
    data['notification_itemid'] = notificationItemid;
    data['notification_userid'] = notificationUserid;
    data['notification_approve'] = notificationApprove;
    data['notification_timecreate'] = notificationTimecreate;
    return data;
  }
}
