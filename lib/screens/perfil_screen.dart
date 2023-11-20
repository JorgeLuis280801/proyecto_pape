import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget{
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  TextEditingController txtConNombre = TextEditingController();
  TextEditingController txtConEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {

    const space = SizedBox(height: 20,);

    final txtNomUser = TextField(
      decoration: const InputDecoration(
        label: Text('Nombre:'),
        border: OutlineInputBorder()
      ),
      controller: txtConNombre,
    );

    final txtEmailUser = TextField(
      decoration: const InputDecoration(
        label: Text('Email:'),
        border: OutlineInputBorder(),
        enabled: false
      ),
      controller: txtConEmail,
    );

    final btnFoto= FloatingActionButton.extended(
        icon: const Icon(Icons.image),
        label: const Text('Cambiar foto de perfil'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        onPressed: () { 
          
        },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi perfil'),
      ),
      body: Center( 
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              space,
              txtNomUser,
              space,
              txtEmailUser,
              space,
              btnFoto,
              const SizedBox(height: 250,),
              Row(
                children: [
                  Checkbox(
                    value: false, 
                    onChanged:(value){setState(() {
                      
                    });}),
                    const Text("Susbribirme a notificaciones de descuentos"),
                ],
              ), 
              space,
              Row(
                children: [
                  Checkbox(
                        value: false, 
                        onChanged:(value){setState(() {
                          
                        });}),
                  const Text("Susbribirme a programa de puntos"),
                ],
              ), 
            ],
          ),
        ),
      ),
    );
  }
}