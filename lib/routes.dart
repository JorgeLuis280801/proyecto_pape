import 'package:flutter/material.dart';
import 'package:proyecto_local/screens/add_product.dart';
import 'package:proyecto_local/screens/carrito_screen.dart';
import 'package:proyecto_local/screens/compras_screen.dart';
import 'package:proyecto_local/screens/crud_product_screen.dart';
import 'package:proyecto_local/screens/crud_screen.dart';
import 'package:proyecto_local/screens/dashboardPape.dart';
import 'package:proyecto_local/screens/historial_screen.dart';
import 'package:proyecto_local/screens/historial_venta_screen.dart';
import 'package:proyecto_local/screens/login.dart';
import 'package:proyecto_local/screens/perfil_screen.dart';
import 'package:proyecto_local/screens/productos_screen.dart';
import 'package:proyecto_local/screens/pwd_recovery.dart';
import 'package:proyecto_local/screens/register.dart';
import 'package:proyecto_local/screens/upd_product.dart';
import 'package:proyecto_local/screens/ventas_screen.dart';

Map<String,WidgetBuilder> getRoutes(){
  return{
    '/reg' : (BuildContext context) => RegisterScreen(),
    '/login' : (BuildContext context) => LoginScreen(),
    '/dashboardPape' : (BuildContext context) => DashboardPapeScreen(),
    '/productos' : (BuildContext context) => ProductosScreen(),
    '/perfil' : (BuildContext context) => PerfilScreen(),
    '/compras' : (BuildContext context) => ComprasScreen(),
    '/miPape' : (BuildContext context) => CrudScreen(),
    '/crudProd' : (BuildContext context) => CrudProductScreen(),
    '/histVenta' : (BuildContext context) => HistorialVentasScreen(),
    '/ventas' : (BuildContext context) => VentasScreen(),
    '/addP' : (BuildContext context) => AddP_Screen(),
    '/updP' : (BuildContext context) => UpdP_Screen(),
    '/carrito' : (BuildContext context) => CarritoScreen(),
    '/historial' : (BuildContext context) => HistorialScreen(),
    '/pwdRec' : (BuildContext context) => PwdRec_Screen(),
  };
}