class WalletModel {
  String? walletId;
  String? walletPrice;
  String? walletUserid;
  String? walletDetails;
  String? walletTimecreate;

  WalletModel(
      {this.walletId,
      this.walletPrice,
      this.walletUserid,
      this.walletDetails,
      this.walletTimecreate});

  WalletModel.fromJson(Map<String, dynamic> json) {
    walletId = json['wallet_id'];
    walletPrice = json['wallet_price'];
    walletUserid = json['wallet_userid'];
    walletDetails = json['wallet_details'];
    walletTimecreate = json['wallet_timecreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['wallet_id'] = walletId;
    data['wallet_price'] = walletPrice;
    data['wallet_userid'] = walletUserid;
    data['wallet_details'] = walletDetails;
    data['wallet_timecreate'] = walletTimecreate;
    return data;
  }
}
