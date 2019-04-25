class ProductsResponse {
  bool success;
  String message;
  Data data;

  ProductsResponse({this.success, this.message, this.data});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int total;
  int perPage;
  int currentPage;
  int lastPage;
  List<Product> products;

  Data(
      {this.total,
      this.perPage,
      this.currentPage,
      this.lastPage,
      this.products});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    if (json['products'] != null) {
      products = new List<Product>();
      json['products'].forEach((v) {
        products.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['last_page'] = this.lastPage;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int id;
  String image;
  int price;
  int oldPrice;
  String currency;
  bool isInCart;
  double rating;
  String title;
  bool isFavourite;
  int discountRatio;
  bool isFreeShipping;
  int reviewersCount;

  Product(
      {this.id,
      this.image,
      this.price,
      this.oldPrice,
      this.currency,
      this.isInCart,
      this.rating,
      this.title,
      this.isFavourite,
      this.discountRatio,
      this.isFreeShipping,
      this.reviewersCount});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    price = json['Price'];
    oldPrice = json['oldPrice'];
    currency = json['currency'];
    isInCart = json['isInCart'];
    rating = json['rating'];
    title = json['title'];
    isFavourite = json['isFavourite'];
    discountRatio = json['discountRatio'];
    isFreeShipping = json['is_free_shipping'];
    reviewersCount = json['reviewersCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['Price'] = this.price;
    data['oldPrice'] = this.oldPrice;
    data['currency'] = this.currency;
    data['isInCart'] = this.isInCart;
    data['rating'] = this.rating;
    data['title'] = this.title;
    data['isFavourite'] = this.isFavourite;
    data['discountRatio'] = this.discountRatio;
    data['is_free_shipping'] = this.isFreeShipping;
    data['reviewersCount'] = this.reviewersCount;
    return data;
  }
}