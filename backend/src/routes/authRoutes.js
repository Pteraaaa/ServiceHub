const express = require("express");
const router = express.Router();

const {
  registerUser,
  testConnection,
} = require("../controller/authController");

router.post("/register", registerUser);
router.get("/test", testConnection);

module.exports = router;
