import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DisponibilidadScreen extends StatefulWidget {
  @override
  _DisponibilidadScreenState createState() => _DisponibilidadScreenState();
}

class _DisponibilidadScreenState extends State<DisponibilidadScreen> {
  List disponibilidad = [];

  Future<void> obtenerDisponibilidad() async {
    final response = await http.get(Uri.parse('http://localhost:3000/api/disponibilidad?fecha_inicio=2023-01-01&fecha_fin=2023-01-10'));
    if (response.statusCode == 200) {
      setState(() {
        disponibilidad = json.decode(response.body)['disponibilidad'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disponibilidad de Hoteles'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: obtenerDisponibilidad,
              child: Text('Obtener Disponibilidad'),
            ),
            Text('Disponibilidad: $disponibilidad'),
          ],
        ),
      ),
    );
  }
}