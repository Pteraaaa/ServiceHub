class WorkshopModel {
  final int id;
  final String name;
  final String imageUrl;
  final String address;
  final double distance;
  final double rating;
  final bool isOpen;
  final String badge;
  final List<String> services;

  WorkshopModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.distance,
    required this.rating,
    required this.isOpen,
    required this.badge,
    required this.services,
  });

  factory WorkshopModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return WorkshopModel(
      id: json["id"],
      name: json["name"] ?? "",
      imageUrl: json["image_url"] ?? "",
      address: json["address"] ?? "",
      distance: (json["distance"] ?? 0).toDouble(),
      rating: (json["rating"] ?? 0).toDouble(),
      isOpen: json["is_open"] ?? true,
      badge: json["badge"] ?? "",
      services: json["services"] != null
          ? List<String>.from(json["services"])
          : [],
    );
  }
}