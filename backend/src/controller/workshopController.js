const db = require("../config/tidb");

const getWorkshops = async (req, res) => {

    try {

    const [rows] = await db.execute(`
        SELECT
        id,
        name,
        image_url,
        address,
        longitude,
        latitude,
        rating,
        badge 
        FROM workshops
        ORDER BY rating DESC
    `);
    return res.status(200).json({
        success: true,
        data: rows
    });

    } catch (error) {
        return res.status(500).json({
            success: false,
            message: error.message,
        });
    }
};

const getWorkshopById = async (req, res) => {
    try {
        const { id } = req.params;
        const [workshop] = await db.execute(
            `
            SELECT *
            FROM workshops
            WHERE id = ?
            `,
            [id]
        );
        if (workshop.length === 0) {
            return res.status(404).json({
                success: false,
                message: "Workshop not found",
            });
        }
        const [services] = await db.execute(
            `
            SELECT service_name
            FROM workshop_services
            WHERE workshop_id = ?
            `,
            [id]
        );
        return res.status(200).json({
            success: true,
            workshop: workshop[0],
            services,
        });
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: error.message,
        });
    }
};

const getNearbyWorkshops = async (req, res) => {
    try {
        const { lat, lng, radius } = req.query;
        const [rows] = await db.execute(
            `
            SELECT *,
            (
                6371 * ACOS(
                COS(RADIANS(?))
                * COS(RADIANS(latitude))
                * COS(RADIANS(longitude) - RADIANS(?))
                + SIN(RADIANS(?))
                * SIN(RADIANS(latitude))
                )
            ) AS distance
            FROM workshops
            HAVING distance <= ?
            ORDER BY distance ASC
            `,
            [
                lat,
                lng,
                lat,
                radius,
            ]
        );

        return res.status(200).json({
            success: true,
            data: rows,
        });

    } catch (error) {
        return res.status(500).json({
            success: false,
            message: error.message,
        });
    }
};
module.exports = {
    getWorkshops,
    getWorkshopById,
    getNearbyWorkshops
};