import 'package:flutter/material.dart';
//import 'package:pmsn20232/firebase/favorites_firebase.dart';

class ProductosScreen extends StatefulWidget {
  const ProductosScreen({super.key});

  @override
  State<ProductosScreen> createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {

  //ProductsFirebase? _productsFB;
  TextEditingController txtConFiltro = TextEditingController();

  @override
  void initState() {
    super.initState();
    //_productsFB = ProductsFirebase();
  }

  @override
  Widget build(BuildContext context) {

   final txtFiltro = TextField(
    decoration: const InputDecoration(
        //label: Text('Filtrar:', style: TextStyle(color: Colors.white,)),
        label: Text.rich(TextSpan(text: "", children: [WidgetSpan(child: Icon(Icons.search)),TextSpan(text: " Filtrar:")])),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255))
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))
        ),
    ),
    controller: txtConFiltro,
  );

    return Scaffold(
      appBar:
        AppBar(title: const Text('Nuestros productos', textAlign: TextAlign.center,),
          actions: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 290),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: ()=>Navigator.pushNamed(context, '/carrito')
                        .then((value){
                          setState(() {
                            
                          });
                        }), 
                        icon: const Icon(Icons.shopping_cart)),
                      IconButton(
                        onPressed: ()=>Navigator.pushNamed(context, '/favoritos')
                        .then((value){
                          setState(() {
                            
                          });
                        }), 
                        icon: const Icon(Icons.favorite)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    txtFiltro
                  ],
                )
              ],
            )
          ],
        ),
      body: 
      Column(
        children: [
          Container(
            color: Colors.grey,
            padding: const EdgeInsets.only(top: 5, right: 70, left: 70),
            child: 
              const Text("¡Hasta 20% de descuento en tus compras!", style: TextStyle(fontSize: 22),)
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                txtFiltro,
                const SizedBox(height: 15,),
                //aqui va el carrusel xd
                const SizedBox(height: 30,),
                /*StreamBuilder(
                  stream: _productsFB!.getAllProducts(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index){
                          return GridView.builder(
                            padding: const EdgeInsets.all(10),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            childAspectRatio: .9,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            ), 
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index){
                              Image.network(snapshot.data!.docs[index].get('image'));
                              Text(snapshot.data!.docs[index].get('name'));
                              Text(snapshot.data!.docs[index].get('price'));
                              Text(snapshot.data!.docs[index].get('stock'));
                            });
                        },
                      );
                    }else{
                      if(snapshot.hasError){
                        return const Center(child: Text('Error'),);
                      }else{
                        return const Center(child:CircularProgressIndicator(),);
                      }
                    }
                  },
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}