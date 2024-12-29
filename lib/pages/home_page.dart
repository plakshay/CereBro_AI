import 'package:cerebro_ai/widgets/side_navbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        //side navbar
        SideNavbar(),
        //search section
        //footer in a column
      ],
    ));
  }
}
