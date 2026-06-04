import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      child: Row(
        children: [
          const Icon(Icons.arrow_back),
          const SizedBox(width: 12),

          const Text(
            "ServiceHub",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),

          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),

          const CircleAvatar(
            backgroundColor: Color(0xff24344D),
            child: Text(
              "JD",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}