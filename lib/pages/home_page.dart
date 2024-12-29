import 'package:cerebro_ai/theme/Appcolors.dart';
import 'package:cerebro_ai/widgets/search_section.dart';
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
        Expanded(
          // within a column expanded takes the entire width of the page
          child: Column(
            children: [
              Expanded(child: SearchSection()),
              Container(
                // footer
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  // wrap is used instead of row because if we decrease the size of the screen, all the elements in the row will not go to the next line
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Pro",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Enterprise",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Store",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Blog",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Careers",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "English (eng)",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        //footer in a column
      ],
    ));
  }
}
