class TableProduct{
  static const String tableName = 'productTable';
  static const String id = 'productId';
  static const String title = 'title';
  static const String category = 'productCategory';
  static const String description = 'description';
  static const String wholeSalePrice = 'wprice';
  static const String retailPrice = 'rprice';
  static const String discount = 'discount';
  static const String tax = 'tax';
  static const String quantity = 'quantity';
  static const String quantityUnit = 'quantityUnit';
  static const String photoUrl = 'photoUrl';
  static const String customerNameProduct = 'customerNameProduct';
}

class TableCustomer{
  static const String tableName = 'customerTable';
  static const String name = 'customerName';
  static const String id = 'customerId';
  static const String category = 'customerCategory';
  static const String email = 'customerEmail';
  static const String phoneNumber = 'phoneNumber';
  static const String address = 'address';
  static const String debit = 'debit';
  static const String credit = 'credit';
  static const String balance = 'balance';
  static const String photoUrl = 'customerPhotoUrl';
}

class TableTransaction{
  static const String tableName = 'transactionTable';
  static const String id = 'transactionId';
  static const String name = 'transactionName';
  static const String paid = 'transactionPaid';
  static const String customerId = 'customerIdFR';
  static const String productId = 'productIdFR';
}

class TableCategory{
  static const String tableName = "categoryTable";
  static const String title = "categoryTitle";
  static const String id = "categoryId";
  static const String photoUrl = "categoryPhotoUrl";
  static const String description = "categoryDescription";
}