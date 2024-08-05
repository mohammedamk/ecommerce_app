
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../widgets/widgets.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textWidget(text: "Dashboard",color: black,fontSize: 20,fontWeight: FontWeight.w500),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textWidget(text: "Coming Soon",color: black,fontSize: 20,fontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}
