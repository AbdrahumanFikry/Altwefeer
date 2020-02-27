class Categories {
  List<Category> data;

  Categories({this.data});

  Categories.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Category>();
      json['data'].forEach((v) {
        data.add(new Category.fromJson(v));
      });
    }
  }
}

class Category {
  int id;
  String name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'] == null ? 1 : json['id'];
    name = json['name'] == null ? '' : json['name'];
  }
}
