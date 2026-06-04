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
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WorkshopService workshopService = WorkshopService();
  List<WorkshopModel> workshops = [];
  List<WorkshopModel> filteredWorkshops = [];
  bool isLoading = true;

  String selectedCategory = "Semua";

  @override
  void initState() {
    super.initState();
    loadWorkshops();
  }

  Future<void> loadWorkshops() async {
    try {
      workshops = await workshopService.getWorkshops();

      filteredWorkshops = workshops;
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);

      setState(() {
        isLoading = false;
      });
    }
  }

  void filterWorkshops(String category) {
    setState(() {
      selectedCategory = category;

      switch (category) {
        case "Terdekat":
          filteredWorkshops = [...workshops];

          filteredWorkshops.sort((a, b) => a.distance.compareTo(b.distance));
          break;

        case "Populer":
          filteredWorkshops = workshops
              .where((workshop) => workshop.badge.toLowerCase() == "populer")
              .toList();
          break;

        case "Semua":
        default:
          filteredWorkshops = workshops;
      }
    });
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

      bottomNavigationBar: const CustomBottomNav(),

      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : workshops.isEmpty
            ? const Center(child: Text("No workshops found"))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const HomeHeader(),
                    const SearchBarWidget(),
                    CategoryChips(
                      selectedCategory: selectedCategory,
                      onCategorySelected: filterWorkshops,
                    ),
                    const SectionHeader(),

                    ...filteredWorkshops.map(
                      (workshop) => WorkshopCard(workshop: workshop),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
