import 'package:cerebro_ai/theme/Appcolors.dart';
import 'package:cerebro_ai/widgets/search_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key}); // making constructor

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Unleashing the Power of Intelligent Insights",
          style: GoogleFonts.ibmPlexMono(
              fontSize: 35,
              fontWeight: FontWeight.w400,
              height: 1.2,
              letterSpacing: -0.5),
        ),
        const SizedBox(
          height: 32,
        ),
        Container(
          width: 700,
          decoration: BoxDecoration(
              color: AppColors.searchBar,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.searchBarBorder,
                width: 1.5,
              )),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search anything...",
                    hintStyle:
                        TextStyle(color: AppColors.textGrey, fontSize: 16),
                    border: InputBorder.none,
                    isDense:
                        true, // decrease the padding within or outside the text field / it takes less space
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SearchBarButton(
                      icon: Icons.auto_awesome_outlined,
                      text: "Focus",
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    SearchBarButton(
                        icon: Icons.add_circle_outline_outlined,
                        text: "Attach"),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: AppColors.submitButton,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 16,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
