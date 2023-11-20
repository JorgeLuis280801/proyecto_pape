import 'package:flutter/material.dart';

class CrudProductScreen extends StatefulWidget{
  const CrudProductScreen({super.key});

  @override
  State<CrudProductScreen> createState() => _CrudProductScreenState();
}

class _CrudProductScreenState extends State<CrudProductScreen>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(title: const Text('CRUD de productos'),
        ),
      body: Text("Aqui van botones como el crud de tareas"),
    );
  }

}