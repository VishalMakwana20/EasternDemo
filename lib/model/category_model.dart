class AllCategories {
  List<Categories>? categories;
  String? bannerImage;
  String? status;
  String? message;

  AllCategories({this.categories, this.bannerImage, this.status, this.message});

  AllCategories.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    bannerImage = json['banner_image'];
    status = json['status'];
    message = json['message'];
  }
}

class Categories {
  String? categoryId;
  String? categoryName;
  String? parentId;
  List<Child>? child;

  Categories({this.categoryId, this.categoryName, this.parentId, this.child});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    parentId = json['parent_id'];
    if (json['child'] != null) {
      child = <Child>[];
      json['child'].forEach((v) {
        child!.add(new Child.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['parent_id'] = this.parentId;
    if (child != null) {
      data['child'] = this.child!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Child {
  String? categoryId;
  String? categoryName;
  String? parentId;

  Child({this.categoryId, this.categoryName, this.parentId});

  Child.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['parent_id'] = this.parentId;
    return data;
  }
}
