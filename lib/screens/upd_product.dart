import 'package:flutter/material.dart';
import 'package:proyecto_local/firebase/firebase_BD.dart';

class UpdP_Screen extends StatefulWidget {
  const UpdP_Screen({super.key});

  @override
  State<UpdP_Screen> createState() => _UpdP_ScreenState();
}

class _UpdP_ScreenState extends State<UpdP_Screen> {

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

    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    txtconNombre.text = arguments['nombre'];
    txtconDesc.text = arguments['descripcion'];
    txtconPrecio.text = arguments['precio'].toString();

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
        await prod_firebase!.updProduct(arguments['id'], txtconNombre.text, txtconDesc.text, double.tryParse(txtconPrecio.text)!).then((_) {
          Navigator.pop(context);
        });
      }, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 255, 255)),
        fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
      ),
      child: const Text('Actualizar producto', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),)
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar producto'),
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