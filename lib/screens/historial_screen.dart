import 'package:flutter/material.dart';

class HistorialScreen extends StatefulWidget{
  const HistorialScreen({super.key});

  @override
  State<HistorialScreen> createState() => _HistorialScreenState();
}

class _HistorialScreenState extends State<HistorialScreen>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(title: const Text('Historial de compras'),
        ),
      body: Text("Eres pobre we"),
    );
  }

}