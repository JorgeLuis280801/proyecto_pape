import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_local/GlobalValues/usr_data.dart';
import 'package:proyecto_local/assets/global_values.dart';
import 'package:proyecto_local/assets/styles_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPapeScreen extends StatefulWidget {
  const DashboardPapeScreen({super.key});

  @override
  State<DashboardPapeScreen> createState() => _DashboardPapeScreenState();
}

class _DashboardPapeScreenState extends State<DashboardPapeScreen> {
  
  String? usr, email, foto;

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      print('Ya jaloo');
      usr = prefs.getString('User') ?? 'Usuario no especificado';
      email = prefs.getString('Email') ?? 'Email no especificado';
      foto = prefs.getString('Foto') ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtwxHjIdPiNd-UXHdVZn9lZP3SLjRXEQSfUw&usqp=CAU';
    });
  }

  @override
  void initState(){
    super.initState();
    loadUserData();
  }

  @override
  Widget build(BuildContext context) {

    final btnProductos= FloatingActionButton.extended(
        icon: const Icon(Icons.shopping_cart),
        label: const Text('Ver productos'),
        onPressed: () { 
          Navigator.pushNamed(context, '/productos'); 
        },
    );

    return Scaffold(
      appBar: 
        AppBar(title: Text('Bienvenido $usr' ?? 'Bienvenido :D'),
        ),
        drawer: createDrawer(context),
      floatingActionButton: btnProductos,
    );
  }

    Widget createDrawer(context){
      final theme = Provider.of<ThemeChanger>(context);
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(foto ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtwxHjIdPiNd-UXHdVZn9lZP3SLjRXEQSfUw&usqp=CAU'),
            ),
            accountName: Text('Usuario: $usr'), 
            accountEmail: Text('Email: $email')
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.contact_phone, color: Colors.white,),
              trailing: const Icon(Icons.chevron_right),
              title: const Text('Perfil'),
              onTap: (){
                Navigator.pushNamed(context, '/perfil');},
              ),
              const SizedBox(height: 20),
              ListTile(
              leading: const Icon(Icons.shop, color: Colors.white,),
              trailing: const Icon(Icons.chevron_right),
              title: const Text('Mis compras'),
              onTap: (){
                Navigator.pushNamed(context, '/compras');
              },
              ),
              ListTile(
              leading: const Icon(Icons.shop_two, color: Colors.white,),
              trailing: const Icon(Icons.chevron_right),
              title: const Text('Mi papeleria'),
              onTap: (){
                Navigator.pushNamed(context, '/miPape');
              },
              ),
              const SizedBox(height: 300),
            Container(
              padding: const EdgeInsets.only(right: 85, left: 85),
              child: ElevatedButton(
                onPressed: () {
                  theme.toogleTheme(context);
                },
                child: const Text("Cambiar tema"),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(right: 35, left: 35),
              child: ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.remove('User');
                  prefs.remove('Email');
                  prefs.remove('Foto');
                  prefs.remove('Recuerdame');
                  Navigator.pushReplacementNamed(context, '/login');
                }, 
                child: const Text('Salir'),),
            ),
        ],
      ),
    );
  }
}