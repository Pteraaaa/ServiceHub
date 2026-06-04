const express = require("express");
const router = express.Router();
const authMiddleware = require("../middleware/auth");

const {
  registerUser,
  testConnection,
  loginUser,
} = require("../controller/authController");

router.post("/register", registerUser);
router.get("/test", testConnection);
router.get("/login", authMiddleware, loginUser);

module.exports = router;
