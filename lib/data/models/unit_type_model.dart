class UnitTypeModel{
  int? id;
  String? title;
  String? variantName;
  double? variantValue;

  UnitTypeModel({this.id, this.title, this.variantName, this.variantValue});

  factory UnitTypeModel.fromMap(Map<dynamic, dynamic> json){
    return UnitTypeModel(
        id : json['unitTypeId'],
        title: json['unitTypeTitle'],
        variantName: json['variantName'],
        variantValue: json['variantValue']
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'unitTypeId' : id,
      'unitTypeTitle' : title,
      'variantName' : variantName,
      'variantValue' : variantValue
    };
  }
}

