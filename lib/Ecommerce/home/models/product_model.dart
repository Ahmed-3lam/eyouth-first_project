class ProductModel {
  int? statusCode;
  ProductData? data;
  String? message;

  ProductModel({this.statusCode, this.data, this.message});

  ProductModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    data = json['data'] != null ? new ProductData.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class ProductData {
  List<Products>? products;
  Pagination? pagination;

  ProductData({this.products, this.pagination});

  ProductData.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }
}

class Products {
  int? id;
  String? name;
  String? description;
  double? price;
  int? categoryId;
  String? image;
  int? stock;
  double? rating;
  int? reviews;
  String? brand;
  String? createdAt;

  Products(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.categoryId,
      this.image,
      this.stock,
      this.rating,
      this.reviews,
      this.brand,
      this.createdAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    categoryId = json['categoryId'];
    image = json['image'];
    stock = json['stock'];
    rating = json['rating'];
    reviews = json['reviews'];
    brand = json['brand'];
    createdAt = json['createdAt'];
  }
}

class Pagination {
  int? page;
  int? limit;
  int? total;
  int? pages;

  Pagination({this.page, this.limit, this.total, this.pages});

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    pages = json['pages'];
  }
}
