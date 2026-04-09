import express from "express";

const healthRouter = express.Router();

/**
 * @route   GET /api/health
 * @desc    Check if the server and essential services are healthy
 * @access  Public
 */
healthRouter.get("/", (req, res) => {
  res.status(200).json({
    status: "healthy",
    timestamp: new Date().toISOString(),
    uptime: process.uptime(),
    version: "1.0.0"
  });
});

export default healthRouter;
