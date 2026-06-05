import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final bool showBackButton;

  const HomeHeader({super.key, this.showBackButton = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          if (showBackButton)
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),

          if (showBackButton) const SizedBox(width: 12),

          const Text(
            "ServiceHub",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const Spacer(),

          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
    );
  }
}
