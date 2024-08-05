import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/controller_const.dart';
import '../../../utils/app_utils.dart';
import '../account/account.dart';
import '../home_screen.dart';
import '../orders/orders.dart';
import '../products/products.dart';

class AdminDashBoardScreen extends StatefulWidget {
  final int currentIndex;
  const AdminDashBoardScreen({super.key, required this.currentIndex});

  @override
  State<AdminDashBoardScreen> createState() => AdminDashBoardScreenState();
}

class AdminDashBoardScreenState extends State<AdminDashBoardScreen> {

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      adminDashboardController.selectedIndex.value = widget.currentIndex;
      initialiseDashboard();
    });
    super.initState();
  }
  void initialiseDashboard() async{
    adminDashboardController.admin.value = await authPreference.getAdminUserModel();
    adminProductController.productList.clear();
    orderController.myOrdersList.clear();

    await adminProductController.productListApi(redirect: "Admin");

    await orderController.orderListByAdminApi();
    logger.d(adminDashboardController.admin.value);
  }

  bool isWeb = GetPlatform.isWeb;
  DateTime lastTimeBackbuttonWasClicked = DateTime.now();

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const AdminProductsScreen(),
    const AdminOrdersScreen(),
    const AdminAccountScreen()
  ];

  List<BottomNavigationBarItem> _navBarsItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home,
            color: adminDashboardController.selectedIndex.value == 0
                ? primary
                : secondary),
        label: 'home'.tr,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.card_giftcard,
            color: adminDashboardController.selectedIndex.value == 1
                ? primary
                : secondary),
        label: 'My Products'.tr,
      ),
      BottomNavigationBarItem(
        icon: Image.asset("assets/icons/ic_orders.png",
            height: 28,
            color: adminDashboardController.selectedIndex.value == 2
                ? primary
                : secondary),
        label: 'my_orders'.tr,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person,
            color: adminDashboardController.selectedIndex.value == 3
                ? primary
                : secondary),
        label: 'account'.tr,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: isWeb
          ? () async {
        if (Navigator.of(context).userGestureInProgress) {
          return false;
        } else {
          return true;
        }
      }
          : () async {
        if (adminDashboardController.selectedIndex.value == 0) {
          if (DateTime.now().difference(lastTimeBackbuttonWasClicked) >=
              const Duration(seconds: 2)) {
            showToast(message: "Press the back button again to go back");
            lastTimeBackbuttonWasClicked = DateTime.now();
            return false;
          } else {
            return true;
          }
        } else {
          return false;
        }
      },
      child: Scaffold(
        // key: scaffoldKey,
        // drawer: Drawers(),
        body: Obx(
              () => Center(
            child: _widgetOptions
                .elementAt(adminDashboardController.selectedIndex.value),
          ),
        ),
        bottomNavigationBar: Obx(
              () => BottomNavigationBar(

              items: _navBarsItems(),
              type: BottomNavigationBarType.fixed,
              currentIndex: adminDashboardController.selectedIndex.value,
              selectedItemColor: primary,
              unselectedItemColor: secondary,
              backgroundColor: white,
              showUnselectedLabels: true,
              iconSize: 25,
              onTap: adminDashboardController.onItemTapped,
              elevation: 5),
        ),
      ),
    );
  }
}
