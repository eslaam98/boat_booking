class YachetDetailsModel {
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
  String? itemTimeAvailable;
  String? itemsStars;
  String? itemImage;

  YachetDetailsModel(
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
      this.itemTimeAvailable,
      this.itemsStars,
      this.itemImage});

  YachetDetailsModel.fromJson(Map<String, dynamic> json) {
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
    itemTimeAvailable = json['item_available_time'];
    itemsStars = json['item_stars'];
    itemImage = json['item_image'];
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
    data['item_available_time'] = itemTimeAvailable;
    data['item_stars'] = itemsStars;

    data['item_image'] = itemImage;
    return data;
  }
}
