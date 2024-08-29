import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TarifasScreen extends StatefulWidget {
  @override
  _TarifasScreenState createState() => _TarifasScreenState();
}

class _TarifasScreenState extends State<TarifasScreen> {
  List tarifas = [];

  Future<void> obtenerTarifas() async {
    final response = await http.get(Uri.parse('http://localhost:3000/api/tarifas?hotelId=1&temporada=alta&tipo_alojamiento=estandar&numero_personas=2'));
    if (response.statusCode == 200) {
      setState(() {
        tarifas = json.decode(response.body)['tarifas'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarifas de Hoteles'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: obtenerTarifas,
              child: Text('Obtener Tarifas'),
            ),
            Text('Tarifas: $tarifas'),
          ],
        ),
      ),
    );
  }
}