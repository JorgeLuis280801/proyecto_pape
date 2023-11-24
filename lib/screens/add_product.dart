import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  TextEditingController txtconStock = TextEditingController();
  Prod_Firebase? prod_firebase;

  File? mediaUpload;

  final FirebaseStorage storage = FirebaseStorage.instance;

  String url="";

  String? dropDownValue = "Sin descuento";
  List<String> dropDownValues = [
    'Sin descuento',
    '10',
    '20',
    '30',
    '40',
    '50'
  ];

  @override
  void initState() {
    super.initState();
    prod_firebase = Prod_Firebase();
  }

  Future<XFile?> getMedia() async{
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<bool> uploadMedia(File image) async{
    final String nameFile = image.path.split("/").last;
    Reference upload = storage.ref().child("images_products").child(nameFile);
    final UploadTask uploadTask = upload.putFile(image);
    final TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);
    url = await snapshot.ref.getDownloadURL();
    print(url);

    return false;
  }

  @override
  Widget build(BuildContext context) {

    final DropdownButton ddDesc = DropdownButton(
    value: dropDownValue,
    items: dropDownValues.map((status) => DropdownMenuItem(
      value: status,
      child: Text(status))
    ).toList(), 
    onChanged: (value){
      dropDownValue = value;
    }
  );

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

    final txtStock = TextField(
      controller: txtconStock,
      decoration: const InputDecoration(
        label: Text('Cantidad en stock', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
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
        if (txtconNombre.text.isEmpty || txtconDesc.text.isEmpty || txtconPrecio.text.isEmpty || txtconStock.text.isEmpty) {
          var snackbar = SnackBar(content: Text('Llene todos los campos porfavor'));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        } else {
          if (mediaUpload == null) {
              return;
            }
          final uploaded = await uploadMedia(mediaUpload!);
          await prod_firebase!.insProduct(txtconNombre.text, txtconDesc.text, double.tryParse(txtconPrecio.text)!, int.tryParse(txtconStock.text)!, dropDownValue!, url).then((_) {
            var snackbar = SnackBar(content: Text('Producto registrado!!'));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
            Navigator.pop(context);
          });
        }
      }, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 255, 255)),
        fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
      ),
      child: const Text('Guardar producto', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),)
    );

    Widget UploadImages = Column(
      children: [
        mediaUpload != null ?
        Image.file(mediaUpload!) :
        Container(
          margin: const EdgeInsets.all(10),
          height: 100,
          width: double.infinity,
          color: Colors.red,
        ),
        ElevatedButton(
          onPressed: () async{
            final mediaSelect = await getMedia();
            setState(() {
              mediaUpload = File(mediaSelect!.path);
            });
          }, 
          child: Text('Seleccione su imagen')
        ),
      ],
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
            txtStock,
            const SizedBox(height: 8.0),
            ddDesc,
            const SizedBox(height: 8.0),
            UploadImages,
            const SizedBox(height: 8.0),
            btnGuardar
          ],
        ),
      ),
    );
  }
}