import 'package:get/get.dart';

import 'package:daily_sales_record/app/modules/add_category/bindings/add_category_binding.dart';
import 'package:daily_sales_record/app/modules/add_category/views/add_category_view.dart';
import 'package:daily_sales_record/app/modules/add_customer/bindings/add_customer_binding.dart';
import 'package:daily_sales_record/app/modules/add_customer/views/add_customer_view.dart';
import 'package:daily_sales_record/app/modules/add_product/bindings/add_product_binding.dart';
import 'package:daily_sales_record/app/modules/add_product/views/add_product_view.dart';
import 'package:daily_sales_record/app/modules/add_transaction/bindings/add_transaction_binding.dart';
import 'package:daily_sales_record/app/modules/add_transaction/views/add_transaction_view.dart';
import 'package:daily_sales_record/app/modules/add_unit/bindings/add_unit_binding.dart';
import 'package:daily_sales_record/app/modules/add_unit/views/add_unit_view.dart';
import 'package:daily_sales_record/app/modules/category/bindings/category_binding.dart';
import 'package:daily_sales_record/app/modules/category/views/category_view.dart';
import 'package:daily_sales_record/app/modules/customer/bindings/customer_binding.dart';
import 'package:daily_sales_record/app/modules/customer/views/customer_view.dart';
import 'package:daily_sales_record/app/modules/home/bindings/home_binding.dart';
import 'package:daily_sales_record/app/modules/home/views/home_view.dart';
import 'package:daily_sales_record/app/modules/login/bindings/login_binding.dart';
import 'package:daily_sales_record/app/modules/login/views/login_view.dart';
import 'package:daily_sales_record/app/modules/product/bindings/product_binding.dart';
import 'package:daily_sales_record/app/modules/product/views/product_view.dart';
import 'package:daily_sales_record/app/modules/splash/bindings/splash_binding.dart';
import 'package:daily_sales_record/app/modules/splash/views/splash_view.dart';
import 'package:daily_sales_record/app/modules/start/bindings/start_binding.dart';
import 'package:daily_sales_record/app/modules/start/views/start_view.dart';
import 'package:daily_sales_record/app/modules/transaction/bindings/transaction_binding.dart';
import 'package:daily_sales_record/app/modules/transaction/views/transaction_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.START;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.START,
      page: () => StartView(),
      binding: StartBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER,
      page: () => CustomerView(),
      binding: CustomerBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION,
      page: () => TransactionView(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.ADD_CATEGORY,
      page: () => AddCategoryView(),
      binding: AddCategoryBinding(),
    ),
    GetPage(
      name: _Paths.ADD_CUSTOMER,
      page: () => AddCustomerView(),
      binding: AddCustomerBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TRANSACTION,
      page: () => AddTransactionView(),
      binding: AddTransactionBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ADD_UNIT,
      page: () => AddUnitView(),
      binding: AddUnitBinding(),
    ),
  ];
}
