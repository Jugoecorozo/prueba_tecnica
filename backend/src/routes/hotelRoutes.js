const express = require('express');
const Hotel = require('../models/hotel');
const router = express.Router();

// Ruta para obtener todos los hoteles
router.get('/', async (req, res) => {
  const hoteles = await Hotel.find();
  res.json(hoteles);
});

module.exports = router;