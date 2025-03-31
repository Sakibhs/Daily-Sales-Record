
import 'package:get/get.dart';
import '../../../../common/enums.dart';
import '../../../../data/models/category.dart';
import '../../../../data/models/customer.dart';
import '../../../../data/repository/customerRepo.dart';

class CustomerController extends GetxController {
  var selectedType = CustomerType.customer.obs;
  void setTypeRadioButton(CustomerType type){
    selectedType.value = type;
    update();
  }


  var allCustomers = <Customer>[].obs;
  CustomerRepo customerRepo = CustomerRepo();

  @override
  Future<void> onInit() async {
    super.onInit();
    await getAllCustomers();
  }

  addCustomer(Customer customer, Category category) async{
    //  await productRepo.insertData();
    await customerRepo.add(customer, category);
    getAllCustomers();
  }

  updateCustomer(Customer customer) async{
    await customerRepo.update(customer);
    getAllCustomers();
  }

  deleteCustomer(int id) async{
    await customerRepo.deleteCustomer(id);
    getAllCustomers();
  }

  getAllCustomers() async{
    var products = await customerRepo.getAllCustomer();
    allCustomers.value = products;
  }

}
