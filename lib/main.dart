import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_local/assets/styles_app.dart';
import 'package:proyecto_local/notif_service.dart';
import 'package:proyecto_local/routes.dart';
import 'package:proyecto_local/screens/add_product.dart';
import 'package:proyecto_local/screens/login.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await NotificationService().initNotifications();

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  bool remember = prefs.getBool('Recuerdame') ?? false;
  
  runApp(MyApp(
    remember: remember,
  ));
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseInAppMessaging fiam = FirebaseInAppMessaging.instance;
  
  const MyApp({super.key, required this.remember});

  final bool remember;

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => ThemeChanger(),
      builder: (context, child){
        final theme = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          title: 'Papeleria VIC',
          theme: theme.theme,
          routes: getRoutes(),
          initialRoute: remember ? '/dashboardPape' : '/login',
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
