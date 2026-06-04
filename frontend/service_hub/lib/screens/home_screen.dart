import 'package:flutter/material.dart';

import '../models/workshop_models.dart';
import '../services/workshop_services.dart';
import '../widgets/category_chip.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/home_header.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/section_header.dart';
import '../widgets/workshop_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final service = WorkshopService();

  List<WorkshopModel> workshops = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    workshops = await service.getWorkshops();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F8),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffFF6B00),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      bottomNavigationBar:
          const CustomBottomNav(),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HomeHeader(),
              const SearchBarWidget(),
              const CategoryChips(),
              const SectionHeader(),

              ...workshops.map(
                (workshop) =>
                    WorkshopCard(
                      workshop: workshop,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}