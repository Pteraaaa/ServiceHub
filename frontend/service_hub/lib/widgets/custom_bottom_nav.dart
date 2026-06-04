import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: 0,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.explore),
          label: "Explore",
        ),
        NavigationDestination(
          icon: Icon(Icons.calendar_today),
          label: "Bookings",
        ),
        NavigationDestination(
          icon: Icon(Icons.bookmark_border),
          label: "Saved",
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          label: "Profile",
        ),
      ],
    );
  }
}