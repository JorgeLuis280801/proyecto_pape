import 'package:flutter/material.dart';
import 'package:proyecto_local/register.dart';

Map<String,WidgetBuilder> getRoutes(){
  return{
    '/reg' : (BuildContext context) => RegisterScreen(),
  };
}