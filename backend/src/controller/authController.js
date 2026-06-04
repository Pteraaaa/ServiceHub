const db = require("../config/tidb");

const registerUser =
async (req, res) => {

  try {

    const {
      firebase_uid,
      full_name,
      email,
      phone
    } = req.body;

    await db.execute(
      `
      INSERT INTO users
      (
        firebase_uid,
        full_name,
        email,
        phone
      )
      VALUES
      (?, ?, ?, ?)
      `,
      [
        firebase_uid,
        full_name,
        email,
        phone
      ]
    );

    res.status(201).json({
        success: true,
        message: "User Registered"
    });

  } catch (error) {

    console.log(error);

    res.status(500).json({
      message: error.message
    });

  }

    };

const testConnection = async (req, res) => {
  try {
    const [rows] = await db.execute("SELECT 1");

    res.status(201).json({
      success: true,
      message: "Database connected",
      rows,
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: error.message,
    });
  }
};

module.exports = { registerUser, testConnection };