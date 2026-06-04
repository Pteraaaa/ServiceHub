const express = require("express");
const cors = require("cors");

const workshopRoutes = require("./routes/workshopRoutes");
const authRoutes = require("../src/routes/authRoutes");

const app = express();

app.use(cors());
app.use(express.json());

app.use("/api/workshops", workshopRoutes);
app.use("/api/auth", authRoutes);

app.get("/", (req, res) => {
  res.json({
    message: "Workshop API is running"
  });
});

module.exports = app;