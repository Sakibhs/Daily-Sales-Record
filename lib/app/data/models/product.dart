class Product{
  int? id;
  String? title;
  String? category;
  String? description;
  double? wholeSalePrice;
  double? retailPrice;
  double? discount;
  double? tax;
  double? quantity;
  int? quantityUnit;
  String? photoUrl;

  Product({this.id, this.title, this.category, this.description,
  this.wholeSalePrice, this.retailPrice, this.discount,
  this.tax, this.quantity, this.quantityUnit, this.photoUrl});


  factory Product.fromMap(Map<dynamic, dynamic> json) {
    return Product(
        id: json['productId'],
        title: json['title'],
        category: json['productCategory'],
        description: json['description'],
        wholeSalePrice: json['wprice'],
        retailPrice: json['rprice'],
        discount: json['discount'],
        tax: json['tax'],
        quantity: json['quantity'],
        quantityUnit: json['quantityUnit'],
        photoUrl: json['photoUrl'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'productId': id,
      'title': title,
      'productCategory': category,
      'description': description,
      'wprice': wholeSalePrice,
      'rprice': retailPrice,
      'discount': discount,
      'tax': tax,
      'quantity': quantity,
      'quantityUnit': quantityUnit,
      'photoUrl': photoUrl
    };
  }


}