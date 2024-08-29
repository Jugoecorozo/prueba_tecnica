const mongoose = require('./database');

const tarifaSchema = new mongoose.Schema({
  hotelId: { type: mongoose.Schema.Types.ObjectId, ref: 'Hotel' },
  temporada: String,
  tipo_alojamiento: String,
  tarifa_por_persona: Number
});

const Tarifa = mongoose.model('Tarifa', tarifaSchema);
module.exports = Tarifa;