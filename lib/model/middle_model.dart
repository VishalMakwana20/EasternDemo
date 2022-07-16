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
        shopByCategory!.add(ShopByCategory.fromJson(v));
      });
    }
    if (json['shop_by_fabric'] != null) {
      shopByFabric = <ShopByFabric>[];
      json['shop_by_fabric'].forEach((v) {
        shopByFabric!.add(ShopByFabric.fromJson(v));
      });
    }
    if (json['Unstitched'] != null) {
      unstitched = <Unstitched>[];
      json['Unstitched'].forEach((v) {
        unstitched!.add(Unstitched.fromJson(v));
      });
    }
    if (json['boutique_collection'] != null) {
      boutiqueCollection = <BoutiqueCollection>[];
      json['boutique_collection'].forEach((v) {
        boutiqueCollection!.add(BoutiqueCollection.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (shopByCategory != null) {
      data['shop_by_category'] =
          shopByCategory!.map((v) => v.toJson()).toList();
    }
    if (shopByFabric != null) {
      data['shop_by_fabric'] = shopByFabric!.map((v) => v.toJson()).toList();
    }
    if (unstitched != null) {
      data['Unstitched'] = unstitched!.map((v) => v.toJson()).toList();
    }
    if (boutiqueCollection != null) {
      data['boutique_collection'] =
          boutiqueCollection!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['name'] = name;
    data['tint_color'] = tintColor;
    data['image'] = image;
    data['sort_order'] = sortOrder;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fabric_id'] = fabricId;
    data['name'] = name;
    data['tint_color'] = tintColor;
    data['image'] = image;
    data['sort_order'] = sortOrder;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['range_id'] = rangeId;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banner_image'] = bannerImage;
    data['name'] = name;
    data['cta'] = cta;
    data['banner_id'] = bannerId;
    return data;
  }
}
