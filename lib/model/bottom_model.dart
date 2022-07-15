class BottomPage {
  List<RangeOfPattern>? rangeOfPattern;
  List<DesignOccasion>? designOccasion;
  String? status;
  String? message;

  BottomPage(
      {this.rangeOfPattern, this.designOccasion, this.status, this.message});

  BottomPage.fromJson(Map<String, dynamic> json) {
    if (json['range_of_pattern'] != null) {
      rangeOfPattern = <RangeOfPattern>[];
      json['range_of_pattern'].forEach((v) {
        rangeOfPattern!.add(new RangeOfPattern.fromJson(v));
      });
    }
    if (json['design_occasion'] != null) {
      designOccasion = <DesignOccasion>[];
      json['design_occasion'].forEach((v) {
        designOccasion!.add(new DesignOccasion.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rangeOfPattern != null) {
      data['range_of_pattern'] =
          this.rangeOfPattern!.map((v) => v.toJson()).toList();
    }
    if (this.designOccasion != null) {
      data['design_occasion'] =
          this.designOccasion!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class RangeOfPattern {
  String? productId;
  String? image;
  String? name;

  RangeOfPattern({this.productId, this.image, this.name});

  RangeOfPattern.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}

class DesignOccasion {
  String? productId;
  String? name;
  String? image;
  String? subName;
  String? cta;

  DesignOccasion(
      {this.productId, this.name, this.image, this.subName, this.cta});

  DesignOccasion.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    image = json['image'];
    subName = json['sub_name'];
    cta = json['cta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['sub_name'] = this.subName;
    data['cta'] = this.cta;
    return data;
  }
}
