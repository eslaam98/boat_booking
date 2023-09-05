class OrderModel {
  String? itemId;
  String? itemName;
  String? itemLocation;
  String? itemDesc;
  String? itemHeight;
  String? itemWeight;
  String? itemFlash;
  String? itemFeatureOne;
  String? itemFeatureTow;
  String? itemPrice;
  String? itemTotalPeople;
  String? itemApprove;
  String? itemCategoryId;
  String? itemOnerId;
  String? itemTimecreate;
  String? itemAvailableTime;
  String? itemImage;
  String? orderId;
  String? orderPrice;
  String? orderTotalPeople;
  String? orderDate;
  String? orderTime;
  String? orderMsg;
  String? orderDiscount;
  String? orderApprove;
  String? orderItemid;
  String? orderUserid;
  String? orderOnerid;
  String? orderTimecreate;

  OrderModel(
      {this.itemId,
      this.itemName,
      this.itemLocation,
      this.itemDesc,
      this.itemHeight,
      this.itemWeight,
      this.itemFlash,
      this.itemFeatureOne,
      this.itemFeatureTow,
      this.itemPrice,
      this.itemTotalPeople,
      this.itemApprove,
      this.itemCategoryId,
      this.itemOnerId,
      this.itemTimecreate,
      this.itemAvailableTime,
      this.itemImage,
      this.orderId,
      this.orderPrice,
      this.orderTotalPeople,
      this.orderDate,
      this.orderTime,
      this.orderMsg,
      this.orderDiscount,
      this.orderApprove,
      this.orderItemid,
      this.orderUserid,
      this.orderOnerid,
      this.orderTimecreate});

  OrderModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemLocation = json['item_location'];
    itemDesc = json['item_desc'];
    itemHeight = json['item_height'];
    itemWeight = json['item_weight'];
    itemFlash = json['item_flash'];
    itemFeatureOne = json['item_feature_one'];
    itemFeatureTow = json['item_feature_tow'];
    itemPrice = json['item_price'];
    itemTotalPeople = json['item_total_people'];
    itemApprove = json['item_approve'];
    itemCategoryId = json['item_category_id'];
    itemOnerId = json['item_oner_id'];
    itemTimecreate = json['item_timecreate'];
    itemAvailableTime = json['item_available_time'];
    itemImage = json['item_image'];
    orderId = json['order_id'];
    orderPrice = json['order_price'];
    orderTotalPeople = json['order_total_people'];
    orderDate = json['order_date'];
    orderTime = json['order_time'];
    orderMsg = json['order_msg'];
    orderDiscount = json['order_discount'];
    orderApprove = json['order_approve'];
    orderItemid = json['order_itemid'];
    orderUserid = json['order_userid'];
    orderOnerid = json['order_onerid'];
    orderTimecreate = json['order_timecreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['item_location'] = itemLocation;
    data['item_desc'] = itemDesc;
    data['item_height'] = itemHeight;
    data['item_weight'] = itemWeight;
    data['item_flash'] = itemFlash;
    data['item_feature_one'] = itemFeatureOne;
    data['item_feature_tow'] = itemFeatureTow;
    data['item_price'] = itemPrice;
    data['item_total_people'] = itemTotalPeople;
    data['item_approve'] = itemApprove;
    data['item_category_id'] = itemCategoryId;
    data['item_oner_id'] = itemOnerId;
    data['item_timecreate'] = itemTimecreate;
    data['item_available_time'] = itemAvailableTime;
    data['item_image'] = itemImage;
    data['order_id'] = orderId;
    data['order_price'] = orderPrice;
    data['order_total_people'] = orderTotalPeople;
    data['order_date'] = orderDate;
    data['order_time'] = orderTime;
    data['order_msg'] = orderMsg;
    data['order_discount'] = orderDiscount;
    data['order_approve'] = orderApprove;
    data['order_itemid'] = orderItemid;
    data['order_userid'] = orderUserid;
    data['order_onerid'] = orderOnerid;
    data['order_timecreate'] = orderTimecreate;
    return data;
  }
}
