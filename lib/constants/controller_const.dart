

import 'package:ecommerce/controllers/customer/product_controller.dart';
import 'package:logger/logger.dart';
import '../controllers/admin/admin_dashboard_controller.dart';
import '../controllers/admin/admin_product_controller.dart';
import '../controllers/common/auth_controller.dart';
import '../controllers/customer/cart_controller.dart';
import '../controllers/customer/dashboard_controller.dart';
import '../controllers/customer/order_controller.dart';
import '../helpers/api_helper.dart';
import '../localization/controller/language_controller.dart';
import 'local_data/auth_preference.dart';




/// ======================== Common Controllers =========================
AuthController authController = AuthController();
AuthPreference authPreference = AuthPreference();
ApiHelper apiHelper = ApiHelper();
Logger logger = Logger();

/// ======================= Customer Controllers ========================

DashboardController dashboardController = DashboardController();
OrderController orderController = OrderController();
LanguageController languageController = LanguageController();
CartController cartController = CartController();
ProductController productController = ProductController();

/// ======================= Admin Controllers ========================
AdminDashboardController adminDashboardController = AdminDashboardController();
AdminProductController adminProductController = AdminProductController();