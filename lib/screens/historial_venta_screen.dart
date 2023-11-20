import 'package:flutter/material.dart';

class HistorialVentasScreen extends StatefulWidget{
  const HistorialVentasScreen({super.key});

  @override
  State<HistorialVentasScreen> createState() => _HistorialVentasScreenState();
}

class _HistorialVentasScreenState extends State<HistorialVentasScreen>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(title: const Text('Historial de ventas'),
        ),
      body: Text("Nadie te compra we"),
    );
  }

}