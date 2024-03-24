class Transaction {
  int? transactionId;
  String? transactionName;
  double? transactionPaid;
  String? customerIdFR;
  String? productIdFR;

  Transaction({this.transactionId, this.transactionName, this.transactionPaid, this.customerIdFR, this.productIdFR});

  factory Transaction.fromMap(Map<dynamic, dynamic> json){
    return Transaction(
        transactionId: json['transactionId'],
        transactionName: json['transactionName'],
        transactionPaid : json['transactionPaid'],
        customerIdFR : json['customerIdFR'],
        productIdFR: json['productIdFR'],
    );
      }
  Map<String, dynamic> toMap(){
    return {
      'transactionId': transactionId,
      'transactionName' : transactionName,
      'transactionPaid' : transactionPaid,
      'customerIdFR' : customerIdFR,
      'productIdFR': productIdFR,
   };
  }

}
