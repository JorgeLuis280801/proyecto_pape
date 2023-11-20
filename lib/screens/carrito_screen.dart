import 'package:flutter/material.dart';

class CarritoScreen extends StatefulWidget{
  const CarritoScreen({super.key});

  @override
  State<CarritoScreen> createState() => _CarritoScreenState();
}

class _CarritoScreenState extends State<CarritoScreen>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(title: const Text('Carrito'),
        ),
      body: Text("No pos si xd"),
    );
  }

}