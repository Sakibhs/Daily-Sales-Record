class Product{
  int? id;
  String? title;
  int? categoryId;
  String? description;
  double? wholeSalePrice;
  double? retailPrice;
  double? discount;
  double? tax;
  double? quantity;
  String? quantityUnit;
  String? photo;

  Product({this.id, this.title, this.categoryId, this.description,
  this.wholeSalePrice, this.retailPrice, this.discount,
  this.tax, this.quantity, this.quantityUnit, this.photo});


  factory Product.fromMap(Map<dynamic, dynamic> json) {
    return Product(
        id: json['productId'],
        title: json['title'],
        categoryId: json['categoryId'],
        description: json['description'],
        wholeSalePrice: json['wprice'],
        retailPrice: json['rprice'],
        discount: json['discount'],
        tax: json['tax'],
        quantity: json['quantity'],
        quantityUnit: json['quantityUnit'],
        photo: json['photo'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'productId': id,
      'title': title,
      'categoryId': categoryId,
      'description': description,
      'wprice': wholeSalePrice,
      'rprice': retailPrice,
      'discount': discount,
      'tax': tax,
      'quantity': quantity,
      'quantityUnit': quantityUnit,
      'photo': photo
    };
  }


}