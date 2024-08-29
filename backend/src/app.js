const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('./models/database');
const hotelRoutes = require('./routes/hotelRoutes');
const reservaRoutes = require('./routes/reservaRoutes');
const tarifaRoutes = require('./routes/tarifaRoutes');

const app = express();
app.use(bodyParser.json());

app.use('/api/hoteles', hotelRoutes);
app.use('/api/reservas', reservaRoutes);
app.use('/api/tarifas', tarifaRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor corriendo en el puerto ${PORT}`);
});