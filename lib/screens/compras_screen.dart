import 'package:flutter/material.dart';

class ComprasScreen extends StatefulWidget{
  const ComprasScreen({super.key});

  @override
  State<ComprasScreen> createState() => _ComprasScreenState();
}

class _ComprasScreenState extends State<ComprasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis compras'),
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
                    icon: const Icon(Icons.shopping_cart, size: 65,),
                    label: const Text(''),
                    onPressed: () {
                      Navigator.pushNamed(context, '/carrito');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0), // Bordes cuadrados
                    ),
                  ),
                ),
                const Text('Carrito', style: TextStyle(fontSize: 20),),
                const SizedBox(height: 20), // Espacio entre los botones
                SizedBox(
                  width: 150,
                  height: 150,
                  child: FloatingActionButton.extended(
                    icon: const Icon(Icons.announcement, size: 65,),
                    label: const Text(''),
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                const Text('Otros', style: TextStyle(fontSize: 20),),
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
                    icon: const Icon(Icons.document_scanner, size: 65,),
                    label: const Text(''),
                    onPressed: () {
                      Navigator.pushNamed(context, '/historial');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                const Text('Historial', style: TextStyle(fontSize: 20),),
                const SizedBox(height: 215,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}