import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_local/assets/category_model.dart';
import 'package:proyecto_local/assets/provider.dart';
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
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final modalProvider = Provider.of<ModalValue>(context, listen: false);
      if(modalProvider.theme){
        _showModal(context, modalProvider.theme);
      }
    });
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
      body: Column(
        children: [
          const SizedBox(height: 30,),
          Container(
              child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.4,
              viewportFraction: 1.0,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              autoPlay: true,
            ),
            items: Category.categories.map((category) => HeroCarouselCard(category: category)).toList(),
          )),
          Container(
            
          )
        ],
      ),
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

void _showModal(BuildContext context, bool show){
  showModalBottomSheet(
    context: context, 
    builder: (BuildContext context){
      return SizedBox(
        height: 600,
        child: Center(
          child: Column(
            children: [
              const Text("Gracias por su preferencia", style: TextStyle(fontSize: 22,fontFamily: "Quicksand"),),
              const Text("", style: TextStyle(fontFamily: "Quicksand"),),
              Container(
                child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.1,
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  autoPlay: false,
                ),
                items: Modal.modal.map((modal) => ModalCarouselCard(modal: modal)).toList(),
              )),
              ElevatedButton(
                child: const Text("No volver a mostrar"),
                onPressed: (){
                  final modalProvider = Provider.of<ModalValue>(context, listen: false);
                    if (modalProvider.theme) {
                      modalProvider.setShowModal(false);
                    }
                  Navigator.pop(context);
                },),
            ],
          )),
      );
    });
}

class HeroCarouselCard extends StatelessWidget {
  final Category category;

  const HeroCarouselCard({required this.category });

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: category.imageUrl,
                fit: BoxFit.cover,
                width: 1000.0,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    category.name,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class ModalCarouselCard extends StatelessWidget {
  final Modal modal;

  const ModalCarouselCard({required this.modal });

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.asset(modal.name, fit: BoxFit.cover, width: 1000.0,),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: const Column(
                    children: [
                      Text("")
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}