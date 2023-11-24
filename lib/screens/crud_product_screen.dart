import 'package:flutter/material.dart';
import 'package:proyecto_local/firebase/firebase_BD.dart';

class CrudProductScreen extends StatefulWidget{
  const CrudProductScreen({super.key});

  @override
  State<CrudProductScreen> createState() => _CrudProductScreenState();
}

class _CrudProductScreenState extends State<CrudProductScreen>{

  Prod_Firebase? prod_firebase;

  @override
  void initState() {
    super.initState();
    prod_firebase = Prod_Firebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(title: const Text('CRUD de productos'),
        ),
      body: StreamBuilder(
        stream: prod_firebase!.getAllProduct(), 
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Producto: ${snapshot.data!.docs[index].get('nombre')}'),
                            Text('Descripcion: ${snapshot.data!.docs[index].get('descripcion')}'),
                            Text('Precio: ${snapshot.data!.docs[index].get('precio').toString()}'),
                            Text('Cantidad: ${snapshot.data!.docs[index].get('stock').toString()}'),
                            Text('Descuento: ${snapshot.data!.docs[index].get('descuento')}'),
                          ],
                        ),
                        Expanded(child: Container()),
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.white), 
                          onPressed: () async{
                            await Navigator.pushNamed(context, '/updP', arguments: {
                              "id": snapshot.data!.docs[index].id,
                              "nombre" : snapshot.data!.docs[index]['nombre'],
                              "descripcion" : snapshot.data!.docs[index]['descripcion'],
                              "precio" : snapshot.data!.docs[index]['precio'],
                              "stock" : snapshot.data!.docs[index]['stock'],
                              "descuento" : snapshot.data!.docs[index]['descuento'],
                              "URL" : snapshot.data!.docs[index]['URL'],
                            });
                            
                            setState(() {
                              
                            });
                          }
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.white), 
                          onPressed: () async{
                            await showDialog(
                              context: context, 
                              builder: (context){
                                return AlertDialog(
                                  title: Text('¿Desea eliminar el producto ${snapshot.data!.docs[index]['nombre']}'),
                                  actions: [
                                    TextButton(
                                      onPressed: (){
                                        return Navigator.pop(context, false);
                                      }, 
                                      child: const Text("Cancelar", style: TextStyle(color: Colors.red),)
                                    ),
                                    TextButton(
                                      onPressed: (){
                                        prod_firebase!.delProduct(snapshot.data!.docs[index].id);
                                        setState(() {
                                          
                                        });
                                        return Navigator.pop(context, true);
                                      }, 
                                      child: const Text("Eliminar", style: TextStyle(color: Colors.white),)
                                    ),
                                  ],
                                );
                              }
                            );
                          }
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            }else{
              return const Center(
                child: Text('No hay datos :v'),
              );
            }
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await Navigator.pushNamed(context, '/addP');
          setState(() {
            
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

}