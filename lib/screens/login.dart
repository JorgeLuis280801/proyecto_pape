import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool? marcado = false;

  final txtConUser = TextEditingController();
  final txtConPwd = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final txtUser = TextField(
      controller: txtConUser,
      decoration: const InputDecoration(
        label: Text('Ingrese su usuario', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))
        ),
      ),
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
    );

    final txtPwd = TextField(
      controller: txtConPwd,
      obscureText: true,
      decoration: const InputDecoration(
        label: Text('Ingrese su contraseña', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))
        ),
      ),
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
    );

    final btnLogin = ElevatedButton(
      onPressed: (){}, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 0, 0)),
        fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
      ),
      child: const Text('Ingresar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
    );

    final btnRegistro = ElevatedButton(
      onPressed: (){
        Navigator.pushNamed(context, '/reg');
      }, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 0, 0)),
        fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
      ),
      child: const Text('Registrate aqui', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar sesion', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/fondo.jpg'))),
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 13, 158, 225).withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset('assets/images/icon_logo.png', height: 90,),
                    const Text('PAPELERIA VIC', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),)
                  ],
                ),
              ),
            ),
            const Divider(
                thickness: 8,
                color: Color.fromARGB(255, 0, 0, 0),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 13, 158, 225).withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Column(
                  children: [
                    const Text('Ingrese sus datos para iniciar sesion', 
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30), 
                      textAlign: TextAlign.center
                    ),
                    const SizedBox(height: 10),
                    txtUser,
                    const SizedBox(height: 10),
                    txtPwd,
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          value: marcado, 
                          activeColor: Colors.black,
                          onChanged: (isMarcado) { 
                            setState(() {
                              marcado = isMarcado;
                            });
                          }
                        ),
                        const Text('Desea mantener su sesion abierta?', 
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    btnLogin,
                  ],
                )
              )
            ),
            const Divider(
                thickness: 8,
                color: Color.fromARGB(255, 0, 0, 0),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 13, 158, 225).withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Column(
                  children: [
                    const Text('Nuevo por aqui?', 
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30), 
                      textAlign: TextAlign.center
                    ),
                    const SizedBox(height: 10),
                    const Text('Registrate para tener acceso a nuestra papeleria y poder comprar todo lo que necesites!', 
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20), 
                      textAlign: TextAlign.center
                    ),
                    const SizedBox(height: 10),
                    btnRegistro
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}