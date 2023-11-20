import 'package:flutter/material.dart';

class VentasScreen extends StatefulWidget{
  const VentasScreen({super.key});

  @override
  State<VentasScreen> createState() => _VentasScreenState();
}

class _VentasScreenState extends State<VentasScreen>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(title: const Text('Ventas por realizar'),
        ),
      body: Text("Nadie *sonido de grillos y viento*"),
    );
  }

}