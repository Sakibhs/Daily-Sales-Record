import 'package:get/get.dart';

import '../../../data/models/category.dart';
import '../../../data/models/product.dart';
import '../../../data/repository/product_repo.dart';

class ProductController extends GetxController {
  var allProducts = <Product>[].obs;
  ProductRepository productRepo = ProductRepository();

  @override
  Future<void> onInit() async {
    super.onInit();
    await getAllProduct();
  }

  addProduct (Product product, Category category) async{
    //  await productRepo.insertData();
    await productRepo.add(product, category);
    getAllProduct();
  }

  updateProduct(Product product) async{
    await productRepo.update(product);
    getAllProduct();
  }

  deleteProduct(int id) async{
    await productRepo.deleteProduct(id);
    getAllProduct();
  }

  getAllProduct() async{
    var products = await productRepo.getAllProduct();
    allProducts.value = products;
  }
}
