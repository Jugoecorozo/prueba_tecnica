const mongoose = require('./database');

const reservaSchema = new mongoose.Schema({
  fecha_inicio: Date,
  fecha_fin: Date,
  tipo_alojamiento: String,
  numero_personas: Number,
  hotelId: { type: mongoose.Schema.Types.ObjectId, ref: 'Hotel' }
});

const Reserva = mongoose.model('Reserva', reservaSchema);
module.exports = Reserva;