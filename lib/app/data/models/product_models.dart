class Product {
  String? message;
  Data? data;

  Product({this.message, this.data});

  Product.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Rows>? rows;

  Data({this.rows});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(new Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rows != null) {
      data['rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  int? id;
  String? productName;
  String? slug;
  String? shortDescription;
  String? description;
  String? howToInstall;
  int? price;
  int? stock;
  int? weight;
  String? imageUrl;
  String? status;
  String? createdAt;
  String? updatedAt;
  Brand? brand;
  Category? category;

  Rows(
      {this.id,
      this.productName,
      this.slug,
      this.shortDescription,
      this.description,
      this.howToInstall,
      this.price,
      this.stock,
      this.weight,
      this.imageUrl,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.brand,
      this.category});

  Rows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    slug = json['slug'];
    shortDescription = json['short_description'];
    description = json['description'];
    howToInstall = json['how_to_install'];
    price = json['price'];
    stock = json['stock'];
    weight = json['weight'];
    imageUrl = json['image_url'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    brand = json['Brand'] != null ? new Brand.fromJson(json['Brand']) : null;
    category = json['Category'] != null
        ? new Category.fromJson(json['Category'])
        : null;
  }

  get message => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['slug'] = this.slug;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['how_to_install'] = this.howToInstall;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['weight'] = this.weight;
    data['image_url'] = this.imageUrl;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.brand != null) {
      data['Brand'] = this.brand!.toJson();
    }
    if (this.category != null) {
      data['Category'] = this.category!.toJson();
    }
    return data;
  }
}

class Brand {
  int? id;
  String? brandName;
  String? slug;

  Brand({this.id, this.brandName, this.slug});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brand_name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand_name'] = this.brandName;
    data['slug'] = this.slug;
    return data;
  }
}

class Category {
  int? id;
  String? categoryName;
  String? slug;

  Category({this.id, this.categoryName, this.slug});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['slug'] = this.slug;
    return data;
  }
}
