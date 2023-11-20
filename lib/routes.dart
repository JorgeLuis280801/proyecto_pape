import 'package:flutter/material.dart';
import 'package:proyecto_local/screens/compras_screen.dart';
import 'package:proyecto_local/screens/crud_product_screen.dart';
import 'package:proyecto_local/screens/historial_venta_screen.dart';
import 'package:proyecto_local/screens/login.dart';
import 'package:proyecto_local/screens/perfil_screen.dart';
import 'package:proyecto_local/screens/productos_screen.dart';
import 'package:proyecto_local/screens/register.dart';
import 'package:proyecto_local/screens/ventas_screen.dart';

Map<String,WidgetBuilder> getRoutes(){
  return{
    '/reg' : (BuildContext context) => RegisterScreen(),
    '/login' : (BuildContext context) => LoginScreen(),
    '/productos' : (BuildContext context) => ProductosScreen(),
    '/perfil' : (BuildContext context) => PerfilScreen(),
    '/compras' : (BuildContext context) => ComprasScreen(),
    '/crudProd' : (BuildContext context) => CrudProductScreen(),
    '/histVenta' : (BuildContext context) => HistorialVentasScreen(),
    '/ventas' : (BuildContext context) => VentasScreen(),
  };
}