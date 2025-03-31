
class Customer {
  int? id;
  late String name;
  int? categoryId;
  late String email;
  late String phoneNumber, address;
  late double balance;
 // late bool isDebit;

  Customer(CustomerBuilder builder) {
    id = builder._id;
    name = builder._name;
    categoryId = builder._category;
    email = builder._email;
    phoneNumber = builder._phoneNumber;
    address = builder._address;
    balance = builder._balance;
   // isDebit = builder._isDebit;
  }

  Customer.of(
      {
      required this.categoryId,
      required this.name,
    //  required this.isDebit,
      required this.balance,
      required this.address,
      required this.email,
      required this.phoneNumber});

  factory Customer.fromMap(Map<dynamic, dynamic> json) {
    return Customer.of(
        name: json['customerName'],
        categoryId: json['categoryId'],
        //isDebit: json['isDebit'],
        balance: json['balance'],
        address: json['address'],
        email: json['customerEmail'],
        phoneNumber: json['phoneNumber']
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'customerId': id,
      'customerName': name,
      'categoryId': categoryId,
     // 'isDebit': isDebit,
      'balance': balance,
      'address': address,
      'customerEmail': email,
      'phoneNumber': phoneNumber
    };
  }

}

class CustomerBuilder {
  int? _id;
  late String _name;
  int? _category;
  late String _email;
  late String _phoneNumber, _address;
  late double _balance;
  late bool _isDebit;

  CustomerBuilder(int id, String name, double balance, bool isDebit) {
    _id = id;
    _name = name;
    _balance = balance;
    _isDebit = isDebit;
  }

  CustomerBuilder setCategory(int category) {
    _category = category;
    return this;
  }

  CustomerBuilder setPhone(String phone) {
    _phoneNumber = phone;
    return this;
  }

  CustomerBuilder setEmail(String email) {
    _email = email;
    return this;
  }

  CustomerBuilder setAddress(String address) {
    _address = address;
    return this;
  }

  Customer build() {
    return Customer(this);
  }
}
