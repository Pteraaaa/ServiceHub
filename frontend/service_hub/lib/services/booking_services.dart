import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/booking_models.dart';

class BookingService {
  static const baseUrl = "http://localhost:3000/api/bookings";

  Future<List<String>> getAvailableSlots(int workshopId, DateTime date) async {
    final response = await http.get(
      Uri.parse(
        "$baseUrl/available-slots"
        "?workshopId=$workshopId"
        "&date=${date.toIso8601String().split('T')[0]}",
      ),
    );

    final json = jsonDecode(response.body);

    return List<String>.from(json["slots"]);
  }

  Future<void> createBooking({
    required String firebaseUid,
    required int workshopId,
    required String serviceName,
    required DateTime date,
    required String time,
    required String notes,
  }) async {
    await http.post(
      Uri.parse(baseUrl),

      headers: {"Content-Type": "application/json"},

      body: jsonEncode({
        "firebase_uid": firebaseUid,
        "workshop_id": workshopId,
        "service_name": serviceName,
        "booking_date": date.toIso8601String().split("T")[0],
        "booking_time": time,
        "notes": notes,
      }),
    );
  }
}
