import 'package:flutter/material.dart';
import 'disponibilidad_screen.dart';
import 'tarifas_screen.dart';
import 'reserva_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sistema de Reservas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DisponibilidadScreen()),
                );
              },
              child: Text('Ver Disponibilidad'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TarifasScreen()),
                );
              },
              child: Text('Ver Tarifas'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReservaScreen()),
                );
              },
              child: Text('Realizar Reserva'),
            ),
          ],
        ),
      ),
    );
  }
}