class MiddlePage {
  List<ShopByCategory>? shopByCategory;
  List<ShopByFabric>? shopByFabric;
  List<Unstitched>? unstitched;
  List<BoutiqueCollection>? boutiqueCollection;
  String? status;
  String? message;

  MiddlePage(
      {this.shopByCategory,
      this.shopByFabric,
      this.unstitched,
      this.boutiqueCollection,
      this.status,
      this.message});

  MiddlePage.fromJson(Map<String, dynamic> json) {
    if (json['shop_by_category'] != null) {
      shopByCategory = <ShopByCategory>[];
      json['shop_by_category'].forEach((v) {
        shopByCategory!.add(new ShopByCategory.fromJson(v));
      });
    }
    if (json['shop_by_fabric'] != null) {
      shopByFabric = <ShopByFabric>[];
      json['shop_by_fabric'].forEach((v) {
        shopByFabric!.add(new ShopByFabric.fromJson(v));
      });
    }
    if (json['Unstitched'] != null) {
      unstitched = <Unstitched>[];
      json['Unstitched'].forEach((v) {
        unstitched!.add(new Unstitched.fromJson(v));
      });
    }
    if (json['boutique_collection'] != null) {
      boutiqueCollection = <BoutiqueCollection>[];
      json['boutique_collection'].forEach((v) {
        boutiqueCollection!.add(new BoutiqueCollection.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shopByCategory != null) {
      data['shop_by_category'] =
          this.shopByCategory!.map((v) => v.toJson()).toList();
    }
    if (this.shopByFabric != null) {
      data['shop_by_fabric'] =
          this.shopByFabric!.map((v) => v.toJson()).toList();
    }
    if (this.unstitched != null) {
      data['Unstitched'] = this.unstitched!.map((v) => v.toJson()).toList();
    }
    if (this.boutiqueCollection != null) {
      data['boutique_collection'] =
          this.boutiqueCollection!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class ShopByCategory {
  String? categoryId;
  String? name;
  String? tintColor;
  String? image;
  String? sortOrder;

  ShopByCategory(
      {this.categoryId, this.name, this.tintColor, this.image, this.sortOrder});

  ShopByCategory.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    tintColor = json['tint_color'];
    image = json['image'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['tint_color'] = this.tintColor;
    data['image'] = this.image;
    data['sort_order'] = this.sortOrder;
    return data;
  }
}

class ShopByFabric {
  String? fabricId;
  String? name;
  String? tintColor;
  String? image;
  String? sortOrder;

  ShopByFabric(
      {this.fabricId, this.name, this.tintColor, this.image, this.sortOrder});

  ShopByFabric.fromJson(Map<String, dynamic> json) {
    fabricId = json['fabric_id'];
    name = json['name'];
    tintColor = json['tint_color'];
    image = json['image'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fabric_id'] = this.fabricId;
    data['name'] = this.name;
    data['tint_color'] = this.tintColor;
    data['image'] = this.image;
    data['sort_order'] = this.sortOrder;
    return data;
  }
}

class Unstitched {
  String? rangeId;
  String? name;
  String? description;
  String? image;

  Unstitched({this.rangeId, this.name, this.description, this.image});

  Unstitched.fromJson(Map<String, dynamic> json) {
    rangeId = json['range_id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['range_id'] = this.rangeId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}

class BoutiqueCollection {
  String? bannerImage;
  String? name;
  String? cta;
  String? bannerId;

  BoutiqueCollection({this.bannerImage, this.name, this.cta, this.bannerId});

  BoutiqueCollection.fromJson(Map<String, dynamic> json) {
    bannerImage = json['banner_image'];
    name = json['name'];
    cta = json['cta'];
    bannerId = json['banner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_image'] = this.bannerImage;
    data['name'] = this.name;
    data['cta'] = this.cta;
    data['banner_id'] = this.bannerId;
    return data;
  }
}
