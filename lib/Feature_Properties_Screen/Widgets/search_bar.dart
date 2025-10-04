import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'images/Property_Listings/searchBar/filter.png', 
          width: 22,
          height: 22,
          color: Colors.teal,
        ),
        const SizedBox(width: 8),

        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade600, width: 1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(26),
                bottomLeft: Radius.circular(26),
                bottomRight: Radius.circular(26),
              ),
            ),
            child: TextField(
              textAlign: TextAlign.right, 
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "ابحث في عقاراتي",
                hintStyle: TextStyle(color: Colors.grey.shade500),
                border: InputBorder.none,

                contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),

                suffixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    'images/Property_Listings/searchBar/Search_Magnifier.png', 
                    width: 20,
                    height: 20,
                    color: Colors.grey.shade400, 
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
