import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReservaScreen extends StatefulWidget {
  @override
  _ReservaScreenState createState() => _ReservaScreenState();
}

class _ReservaScreenState extends State<ReservaScreen> {
  final _formKey = GlobalKey<FormState>();
  String hotelId = '1';
  String fechaInicio = '2023-01-01';
  String fechaFin = '2023-01-10';
  String tipoAlojamiento = 'estandar';
  int numeroPersonas = 2;

  Future<void> realizarReserva() async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/api/reservas'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'hotelId': hotelId,
        'fecha_inicio': fechaInicio,
        'fecha_fin': fechaFin,
        'tipo_alojamiento': tipoAlojamiento,
        'numero_personas': numeroPersonas,
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Reserva realizada')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al realizar la reserva')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Realizar Reserva'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'ID del Hotel'),
                initialValue: hotelId,
                onChanged: (value) {
                  setState(() {
                    hotelId = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Fecha de Inicio'),
                initialValue: fechaInicio,
                onChanged: (value) {
                  setState(() {
                    fechaInicio = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Fecha de Fin'),
                initialValue: fechaFin,
                onChanged: (value) {
                  setState(() {
                    fechaFin = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tipo de Alojamiento'),
                initialValue: tipoAlojamiento,
                onChanged: (value) {
                  setState(() {
                    tipoAlojamiento = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Número de Personas'),
                initialValue: numeroPersonas.toString(),
                onChanged: (value) {
                  setState(() {
                    numeroPersonas = int.parse(value);
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: realizarReserva,
                child: Text('Realizar Reserva'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}