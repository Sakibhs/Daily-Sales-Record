class Category{
  int? id;
  String? title;
  String? description;
  String? photo;

  Category({this.id, this.title, this.description, this.photo});

  factory Category.fromMap(Map<dynamic, dynamic> json){
    return Category(
      id : json['categoryId'],
      title: json['categoryTitle'],
      description: json['categoryDescription'],
      photo: json['categoryPhoto']
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'categoryId' : id,
      'categoryTitle' : title,
      'categoryDescription' : description,
      'categoryPhoto' : photo
    };
  }
}

