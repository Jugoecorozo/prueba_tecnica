const express = require('express');
const Reserva = require('../models/reserva');
const router = express.Router();

// Ruta para obtener todas las reservas
router.get('/', async (req, res) => {
  const reservas = await Reserva.find();
  res.json(reservas);
});

// Ruta para crear una nueva reserva
router.post('/', async (req, res) => {
  const reserva = new Reserva(req.body);
  await reserva.save();
  res.json({ mensaje: 'Reserva realizada' });
});

module.exports = router;