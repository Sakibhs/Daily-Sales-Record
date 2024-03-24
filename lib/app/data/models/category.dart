class Category{
  int? id;
  String? title;
  String? description;
  String? photoUrl;

  Category({this.id, this.title, this.description, this.photoUrl});

  factory Category.fromMap(Map<dynamic, dynamic> json){
    return Category(
      id : json['categoryId'],
      title: json['categoryTitle'],
      description: json['categoryDescription'],
      photoUrl: json['categoryPhotoUrl']
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'categoryId' : id,
      'categoryTitle' : title,
      'categoryDescription' : description,
      'categoryPhotoUrl' : photoUrl
    };
  }
}

