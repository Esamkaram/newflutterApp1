class OfferModel {
  int? status;
  List<OfferItem>? data;
  String? message;

  OfferModel({this.status, this.data, this.message});

  OfferModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <OfferItem>[];
      json['data'].forEach((v) {
        data!.add(OfferItem.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class OfferItem {
  String? iMG;

  OfferItem({this.iMG});

  OfferItem.fromJson(Map<String, dynamic> json) {
    iMG = json['IMG'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IMG'] = iMG;
    return data;
  }
}
