import 'package:flutter/material.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      "Semua",
      "Mobil",
      "Motor",
      "Body Repair"
    ];

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final selected = index == 0;

          return Container(
            margin: const EdgeInsets.only(left: 12),
            child: Chip(
              backgroundColor: selected
                  ? const Color(0xff7A2E00)
                  : const Color(0xffEEF2FB),
              label: Text(
                categories[index],
                style: TextStyle(
                  color: selected
                      ? Colors.orange
                      : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}