class BookingModel {
  String? bookingId;
  String? bookingPrice;
  String? bookingMsg;
  String? bookingDay;
  String? bookingTime;
  String? bookingTotalPeople;
  String? bookingItemid;
  String? bookingUserid;
  String? bookingOnerid;
  String? bookingApprove;
  String? bookingTimecreate;

  BookingModel(
      {this.bookingId,
      this.bookingPrice,
      this.bookingMsg,
      this.bookingDay,
      this.bookingTime,
      this.bookingTotalPeople,
      this.bookingItemid,
      this.bookingUserid,
      this.bookingOnerid,
      this.bookingApprove,
      this.bookingTimecreate});

  BookingModel.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    bookingPrice = json['booking_price'];
    bookingMsg = json['booking_msg'];
    bookingDay = json['booking_day'];
    bookingTime = json['booking_time'];
    bookingTotalPeople = json['booking_total_people'];
    bookingItemid = json['booking_itemid'];
    bookingUserid = json['booking_userid'];
    bookingOnerid = json['booking_onerid'];
    bookingApprove = json['booking_approve'];
    bookingTimecreate = json['booking_timecreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_id'] = this.bookingId;
    data['booking_price'] = this.bookingPrice;
    data['booking_msg'] = this.bookingMsg;
    data['booking_day'] = this.bookingDay;
    data['booking_time'] = this.bookingTime;
    data['booking_total_people'] = this.bookingTotalPeople;
    data['booking_itemid'] = this.bookingItemid;
    data['booking_userid'] = this.bookingUserid;
    data['booking_onerid'] = this.bookingOnerid;
    data['booking_approve'] = this.bookingApprove;
    data['booking_timecreate'] = this.bookingTimecreate;
    return data;
  }
}
