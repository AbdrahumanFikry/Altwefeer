class Products {
  List<Ads> ads;
  List<Sections> sections;

  Products({this.ads, this.sections});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['ads'] != null) {
      ads = new List<Ads>();
      json['ads'].forEach((v) {
        ads.add(new Ads.fromJson(v));
      });
    }
    if (json['sections'] != null) {
      sections = new List<Sections>();
      json['sections'].forEach((v) {
        sections.add(new Sections.fromJson(v));
      });
    }
  }
}

class Ads {
  int id;
  String path;

  Ads({this.id, this.path});

  Ads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
  }
}

class Sections {
  List<Src> src;
  String title;

  Sections({this.src, this.title});

  Sections.fromJson(Map<String, dynamic> json) {
    if (json['src'] != null) {
      src = new List<Src>();
      json['src'].forEach((v) {
        src.add(new Src.fromJson(v));
      });
    }
    title = json['title'];
  }
}

class Src {
  int id;
  String name;
  int price;
  List<Image> images;

  Src({
    this.id,
    this.name,
    this.price,
    this.images,
  });

  Src.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    if (json['images'] != null) {
      images = new List<Image>();
      json['images'].forEach((v) {
        images.add(new Image.fromJson(v));
      });
    }
  }
}

class Image {
  int id;
  String path;

  Image({
    this.id,
    this.path,
  });

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
  }
}
