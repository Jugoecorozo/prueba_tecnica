const mongoose = require('./database');

const hotelSchema = new mongoose.Schema({
  nombre: String,
  ciudad: String,
  habitaciones_estandar: Number,
  habitaciones_premium: Number,
  habitaciones_vip: Number,
  cupo_maximo: Number
});

const Hotel = mongoose.model('Hotel', hotelSchema);
module.exports = Hotel;