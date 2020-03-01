class SingleProduct {
  Data data;

  SingleProduct({this.data});

  SingleProduct.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int id;
  String name;
  Type type;
  int quantity;
  int price;
  int discount;
  String priceAfterDiscount;
  List<Images> images;
  String brand;
  bool avaiable;
  List<Spc> spc;
  List<Review> reviews;
  String description;

  Data(
      {this.id,
      this.name,
      this.type,
      this.quantity,
      this.price,
      this.discount,
      this.priceAfterDiscount,
      this.images,
      this.brand,
      this.avaiable,
      this.spc,
      this.reviews,
      this.description});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    quantity = json['quantity'];
    price = json['price'];
    discount = json['discount'];
    priceAfterDiscount = json['price_after_discount'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    brand = json['brand'];
    avaiable = json['avaiable'];
    if (json['spc'] != null) {
      spc = new List<Spc>();
      json['spc'].forEach((v) {
        spc.add(new Spc.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = new List<Review>();
      json['reviews'].forEach((v) {
        reviews.add(new Review.fromJson(v));
      });
    }
    description = json['description'];
  }
}

class Type {
  int id;
  String name;

  Type({this.id, this.name});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Images {
  int id;
  String path;

  Images({this.id, this.path});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
  }
}

class Spc {
  String attr;
  String value;

  Spc({this.attr, this.value});

  Spc.fromJson(Map<String, dynamic> json) {
    attr = json['attr'];
    value = json['value'];
  }
}

class Review {
  int id;
  String review;
  String rate;

  Review({this.id, this.review, this.rate});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    review = json['review'];
    rate = json['rate'].toString();
  }
}
