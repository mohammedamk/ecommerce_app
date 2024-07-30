import "package:ecommerce/constants/colors.dart";
import "package:ecommerce/screens/account/account.dart";
import "package:ecommerce/screens/cart/cartPage.dart";
import "package:ecommerce/screens/home/home_page.dart";
import "package:ecommerce/screens/products/products.dart";
import "package:flutter/material.dart";
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";

import "../../favorites/favoriate_page.dart";


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  final PersistentTabController _controller = PersistentTabController();

  List<PersistentTabConfig> _tabs() => [
    PersistentTabConfig(
      screen: const MyHomePage(title: "title"),
      item: ItemConfig(
        icon: const Icon(Icons.home_outlined),
        title: "Home",
        activeForegroundColor: primary,
        inactiveForegroundColor: Colors.grey,
      ),
    ),
    PersistentTabConfig(
      screen: const ProductsScreen(),
      item: ItemConfig(
        icon: const Icon(Icons.shopping_cart_outlined),
        title: "Shop",
        activeForegroundColor: primary,
        inactiveForegroundColor: Colors.grey,
      ),
    ),
    PersistentTabConfig(
      screen: const CartPage(),
      item: ItemConfig(
        icon: const Icon(Icons.shopping_bag_outlined),
        title: "Bag",
        activeForegroundColor: primary,
        inactiveForegroundColor: Colors.grey,
      ),
    ),
    PersistentTabConfig(
      screen: const FavoritesScreen(),
      item: ItemConfig(
        icon: const Icon(Icons.favorite_border),
        title: "Favorites",
        activeForegroundColor: primary,
        inactiveForegroundColor: Colors.grey,
      ),
    ),
    PersistentTabConfig(
      screen: const AccountScreen(),
      item: ItemConfig(
        activeColorSecondary: primary,
        icon: const Icon(Icons.person_outlined),
        title: "Account",
        activeForegroundColor: primary,
        inactiveForegroundColor: Colors.grey,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) => PersistentTabView(
    controller: _controller,
    tabs: _tabs(),
    navBarBuilder: (navBarConfig) => Style1BottomNavBar(
      navBarConfig: navBarConfig,
    ),
  );
}