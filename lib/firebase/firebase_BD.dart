import 'package:cloud_firestore/cloud_firestore.dart';

class Prod_Firebase {
  
  FirebaseFirestore _firebase = FirebaseFirestore.instance;
  CollectionReference? _productCollection;

  Prod_Firebase(){
    _productCollection = _firebase.collection('Productos');
  }

  Future<void> insProduct(String nombre, descripcion, double precio) async{
    return _productCollection!.doc().set({"nombre" : nombre, "descripcion" : descripcion, "precio" : precio});
  }

  Future<void> updProduct(String id, newnombre, newdescripcion, double newprecio) async {
    return _productCollection!.doc(id).set({"nombre" : newnombre, "descripcion" : newdescripcion, "precio" : newprecio});
  }

  Future<void> delProduct(String id) async {
    return _productCollection!.doc(id).delete();
  }

  Stream<QuerySnapshot> getAllProduct() {
    return _productCollection!.snapshots();
  }

  

}