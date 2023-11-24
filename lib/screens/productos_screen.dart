import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_local/firebase/firebase_BD.dart';

class ProductosScreen extends StatefulWidget {
  const ProductosScreen({super.key});

  @override
  State<ProductosScreen> createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {

  Prod_Firebase? _productsFB;
  TextEditingController txtConFiltro = TextEditingController();

  @override
  void initState() {
    super.initState();
    _productsFB = Prod_Firebase();
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
        //toolbarHeight: 200,
          actions: [
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
      body: 
        StreamBuilder(
          stream: _productsFB!.getAllProduct(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: () {},
                    child:
                        Container(
                          color: Colors.white,
                          child: Expanded(
                            flex: 10,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container( 
                                      width: 160,
                                      height: 170,
                                      child: FadeInImage(
                                          fit: BoxFit.fill,
                                          fadeInDuration: Duration(milliseconds: 700),
                                          placeholder: AssetImage('assets/GIF/exp.gif'),
                                          image: CachedNetworkImageProvider('${snapshot.data!.docs[index].get('URL') ?? ''}'),
                                        ),
                                    ),
                                    Positioned(
                                      top: 5,
                                      left: 0,
                                      child: 
                                      Icon(Icons.discount, color: snapshot.data!.docs[index].get('descuento') == 'Sin descuento' ? 
                                      const Color.fromARGB(255, 0, 0, 0) : const Color.fromARGB(255, 255, 0, 0), 
                                      size: 50,)),
                                  ],
                                ),
                                const Divider(thickness: 1,color: Color.fromARGB(255, 0, 0, 0),),
                                Text(snapshot.data!.docs[index].get('nombre'), style: const TextStyle(color: Colors.black,),),
                                const Divider(thickness: 1,color: Color.fromARGB(255, 0, 0, 0),),
                                Text("Precio:            \$${snapshot.data!.docs[index].get('precio')?.toString() ?? 'N/A'}", style: const TextStyle(color: Colors.black),),
                                Text("Stock:            ${snapshot.data!.docs[index].get('stock')?.toString() ?? 'N/A'} pzas", style: const TextStyle(color: Colors.black),),
                              ],
                            ),
                          ),
                        )
                    );
                });
            }else{
              if(snapshot.hasError){
                return const Center(child: Text('Error'),);
              }else{
                return const Center(child:CircularProgressIndicator(),);
              }
            }
          },
        ),
    );
  }
}