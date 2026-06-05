const express = require("express");

const router = express.Router();

const {
  createBooking,
  getMyBookings,
  getAvailableSlots,
  cancelBooking,
} = require("../controller/bookingController");

router.post("/", createBooking);

router.get("/my-bookings", getMyBookings);

router.get("/available-slots", getAvailableSlots);

router.patch("/:id/cancel", cancelBooking);

module.exports = router;