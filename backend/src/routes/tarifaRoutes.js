const express = require('express');
const Tarifa = require('../models/tarifa');
const router = express.Router();

// Ruta para obtener todas las tarifas
router.get('/', async (req, res) => {
  const tarifas = await Tarifa.find();
  res.json(tarifas);
});

module.exports = router;