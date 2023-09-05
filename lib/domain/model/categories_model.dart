class CategoriesModel {
  String? categoryId;
  String? categoryNameAr;
  String? categoryNameEn;
  String? categoryImage;
  String? categoryTimecreate;
  String? categoryApprove;

  CategoriesModel(
      {this.categoryId,
      this.categoryNameAr,
      this.categoryNameEn,
      this.categoryImage,
      this.categoryTimecreate,
      this.categoryApprove});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryNameAr = json['category_name_ar'];
    categoryNameEn = json['category_name_en'];
    categoryImage = json['category_image'];
    categoryTimecreate = json['category_timecreate'];
    categoryApprove = json['category_approve'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['category_id'] = categoryId;
    data['category_name_ar'] = categoryNameAr;
    data['category_name_en'] = categoryNameEn;
    data['category_image'] = categoryImage;
    data['category_timecreate'] = categoryTimecreate;
    data['category_approve'] = categoryApprove;
    return data;
  }
}
