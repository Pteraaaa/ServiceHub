import '../models/workshop_models.dart';

class WorkshopService {
  Future<List<WorkshopModel>> getWorkshops() async {
    return [
      WorkshopModel(
        id: 1,
        name: "AutoCare Elite Studio",
        imageUrl:
            "https://images.unsplash.com/photo-1487754180451-c456f719a1fc",
        address: "Cilandak",
        distance: 1.2,
        isOpen: false,
        rating: 4.9,
        badge: "Populer",
        services: ["Servis Berkala", "Tune Up"],
      ),
      WorkshopModel(
        id: 2,
        name: "Gloss Pro Detailing",
        imageUrl:
            "https://images.unsplash.com/photo-1503376780353-7e6692767b70",
        address: "Kemang",
        distance: 2.5,
        isOpen: true,
        rating: 4.8,
        badge: "Baru",
        services: ["Wash", "Coating"],
      ),
    ];
  }
}