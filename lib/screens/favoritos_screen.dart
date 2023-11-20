import 'package:flutter/material.dart';

class FavoritosScreen extends StatefulWidget{
  const FavoritosScreen({super.key});

  @override
  State<FavoritosScreen> createState() => _FavoritosScreenState();
}

class _FavoritosScreenState extends State<FavoritosScreen>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(title: const Text('Mis favoritos'),
        ),
      body: Text("Resistol del 500 xddxdx"),
    );
  }

}