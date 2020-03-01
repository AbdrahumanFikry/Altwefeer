import '../models/singleProduct.dart';

class SingleCategory {
  Data data;

  SingleCategory({this.data});

  SingleCategory.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int id;
  String name;
  List<Type> type;

  Data({this.id, this.name, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['type'] != null) {
      type = new List<Type>();
      json['type'].forEach((v) {
        type.add(new Type.fromJson(v));
      });
    }
  }
}

class Type {
  int id;
  bool avaiable;
  String name;
  List<Products> products;

  Type({this.id, this.avaiable, this.name, this.products});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avaiable = json['avaiable'];
    name = json['name'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }
}

class Products {
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

  Products(
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

  Products.fromJson(Map<String, dynamic> json) {
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

class Kind {
  int id;
  String name;

  Kind({this.id, this.name});

  Kind.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
