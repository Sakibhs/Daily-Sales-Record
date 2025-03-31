class Transaction {
  int? transactionId;
  String? transactionName;
  double? transactionPaid;
  String? customerIdFR;
  String? productIdFR;

  double? transactionDue;
  double? transactionQuantity;
  double? transactionPrice;
  Transaction({this.transactionId, this.transactionName, this.transactionPaid,
    this.customerIdFR, this.productIdFR, this.transactionDue, this.transactionQuantity,
     this.transactionPrice});

  factory Transaction.fromMap(Map<dynamic, dynamic> json){
    return Transaction(
        transactionId: json['transactionId'],
        transactionName: json['transactionName'],
        transactionPaid : json['transactionPaid'],
        customerIdFR : json['customerIdFR'],
        productIdFR: json['productIdFR'],
        transactionDue: json['transactionDue'],
      transactionQuantity: json['transactionQuantity'],
      transactionPrice: json['transactionPrice'],
    );
      }
  Map<String, dynamic> toMap(){
    return {
      'transactionId': transactionId,
      'transactionName' : transactionName,
      'transactionPaid' : transactionPaid,
      'customerIdFR' : customerIdFR,
      'productIdFR': productIdFR,
      'transactionDue': transactionDue,
      'transactionQuantity': transactionQuantity,
      'transactionPrice': transactionPrice,
   };
  }

}
