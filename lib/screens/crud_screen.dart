import 'package:flutter/material.dart';

class CrudScreen extends StatefulWidget{
  const CrudScreen({super.key});

  @override
  State<CrudScreen> createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150, // Ancho del botón
                  height: 150, // Altura del botón
                  child: FloatingActionButton.extended(
                    icon: const Icon(Icons.edit_document, size: 65,),
                    label: const Text(''),
                    onPressed: () {
                      Navigator.pushNamed(context, '/crudProd');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0), // Bordes cuadrados
                    ),
                  ),
                ),
                const Text('CRUD productos', style: TextStyle(fontSize: 20),),
                const SizedBox(height: 20), // Espacio entre los botones
                SizedBox(
                  width: 150,
                  height: 150,
                  child: FloatingActionButton.extended(
                    icon: const Icon(Icons.document_scanner_rounded, size: 65,),
                    label: const Text(''),
                    onPressed: () {
                      Navigator.pushNamed(context, '/histVenta');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                const Text('Historial ventas', style: TextStyle(fontSize: 20),),
                const SizedBox(height: 20),
              ],
            ),
            const SizedBox(width: 30,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: FloatingActionButton.extended(
                    icon: const Icon(Icons.sell, size: 65,),
                    label: const Text(''),
                    onPressed: () {
                      Navigator.pushNamed(context, '/ventas');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                const Text('Ventas pendientes', style: TextStyle(fontSize: 20),),
                const SizedBox(height: 215,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}