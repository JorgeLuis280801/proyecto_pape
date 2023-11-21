import 'package:flutter/material.dart';
import 'package:proyecto_local/firebase/firebase_BD.dart';

class AddP_Screen extends StatefulWidget {
  const AddP_Screen({super.key});

  @override
  State<AddP_Screen> createState() => _AddP_ScreenState();
}

class _AddP_ScreenState extends State<AddP_Screen> {

  TextEditingController txtconNombre = TextEditingController();
  TextEditingController txtconDesc = TextEditingController();
  TextEditingController txtconPrecio = TextEditingController();
  Prod_Firebase? prod_firebase;

  @override
  void initState() {
    super.initState();
    prod_firebase = Prod_Firebase();
  }

  @override
  Widget build(BuildContext context) {

    final txtNombre = TextField(
      controller: txtconNombre,
      decoration: const InputDecoration(
        label: Text('Nombre del producto', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255))
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255))
        ),
      ),
      style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
    );

    final txtDesc = TextField(
      controller: txtconDesc,
      decoration: const InputDecoration(
        label: Text('Descripcion del producto', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255))
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255))
        ),
      ),
      style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
    );

    final txtPrecio = TextField(
      controller: txtconPrecio,
      decoration: const InputDecoration(
        label: Text('Precio del producto', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255))
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255))
        ),
      ),
      style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
    );

    final btnGuardar = ElevatedButton(
      onPressed: () async{
        await prod_firebase!.insProduct(txtconNombre.text, txtconDesc.text, double.tryParse(txtconPrecio.text)!).then((_) {
          Navigator.pop(context);
        });
      }, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 255, 255)),
        fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
      ),
      child: const Text('Guardar producto', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),)
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir producto'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 8.0),
            txtNombre,
            const SizedBox(height: 8.0),
            txtDesc,
            const SizedBox(height: 8.0),
            txtPrecio,
            const SizedBox(height: 8.0),
            btnGuardar
          ],
        ),
      ),
    );
  }
}