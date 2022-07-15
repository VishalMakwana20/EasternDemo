class TopMenu {
  List<MainStickyMenu>? mainStickyMenu;
  String? status;
  String? message;

  TopMenu({this.mainStickyMenu, this.status, this.message});

  TopMenu.fromJson(Map<String, dynamic> json) {
    if (json['main_sticky_menu'] != null) {
      mainStickyMenu = <MainStickyMenu>[];
      json['main_sticky_menu'].forEach((v) {
        mainStickyMenu!.add(new MainStickyMenu.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainStickyMenu != null) {
      data['main_sticky_menu'] =
          this.mainStickyMenu!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class MainStickyMenu {
  String? title;
  String? image;
  String? sortOrder;
  List<SliderImages>? sliderImages;

  MainStickyMenu({this.title, this.image, this.sortOrder, this.sliderImages});

  MainStickyMenu.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    sortOrder = json['sort_order'];
    if (json['slider_images'] != null) {
      sliderImages = <SliderImages>[];
      json['slider_images'].forEach((v) {
        sliderImages!.add(new SliderImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['sort_order'] = this.sortOrder;
    if (this.sliderImages != null) {
      data['slider_images'] =
          this.sliderImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SliderImages {
  String? title;
  String? image;
  String? sortOrder;
  String? cta;

  SliderImages({this.title, this.image, this.sortOrder, this.cta});

  SliderImages.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    sortOrder = json['sort_order'];
    cta = json['cta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['sort_order'] = this.sortOrder;
    data['cta'] = this.cta;
    return data;
  }
}
