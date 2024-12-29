import 'package:cerebro_ai/theme/Appcolors.dart';
import 'package:cerebro_ai/widgets/sidebar_button.dart';
import 'package:flutter/material.dart';

class SideNavbar extends StatefulWidget {
  // converting the stateless widget to the stateful widget in order to expand the navbar sideways
  const SideNavbar({super.key});

  @override
  State<SideNavbar> createState() => _SideNavbarState();
}

class _SideNavbarState extends State<SideNavbar> {
  bool isexpanded = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isexpanded ? 150 : 64,
      color: AppColors.sideNav,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Icon(
            Icons.auto_awesome_mosaic,
            color: AppColors.whiteColor,
            size: isexpanded ? 60 : 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: isexpanded
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 25,
                ),
                SidebarButton(
                    isexpanded: isexpanded, iconData: Icons.add, text: "Home"),
                SidebarButton(
                    isexpanded: isexpanded,
                    iconData: Icons.search,
                    text: "Search"),
                SidebarButton(
                    isexpanded: isexpanded,
                    iconData: Icons.language,
                    text: "Spaces"),
                SidebarButton(
                    isexpanded: isexpanded,
                    iconData: Icons.auto_awesome,
                    text: "Discover"),
                SidebarButton(
                    isexpanded: isexpanded,
                    iconData: Icons.cloud,
                    text: "Library"),
                const Spacer(),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                // setstate facilitates the rebuilding of builder function
                isexpanded = !isexpanded;
              });
            },
            child: Container(
              // the animatedcontainer doesnt animate the icon therefore only container widget will also work the same
              // duration: Duration(milliseconds: 200),
              margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              child: Icon(
                isexpanded
                    ? Icons.keyboard_arrow_left
                    : Icons.keyboard_arrow_right,
                color: AppColors.iconGrey,
                size: 22,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
