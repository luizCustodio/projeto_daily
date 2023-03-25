import 'package:flutter/material.dart';
import 'cadastro.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerUsuario = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _switchValue = false;
  bool _isDarkModeEnabled = false; // adicionar esta variável

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu aplicativo',
      theme: _isDarkModeEnabled
          ? ThemeData.dark().copyWith(
              primaryColor: Colors.cyan.shade400,
              colorScheme:
                  ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
            )
          : ThemeData(
              primaryColor: Colors.cyan.shade400,
              colorScheme:
                  ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
            ),
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Faça seu login"),
          backgroundColor: Colors.cyan,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),
          actions: [],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Menu'),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                ),
              ),
              ListTile(
                title: Text('Opção 1'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Opção 2'),
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: [
                    Text('Ativar Switch Button'),
                    Spacer(),
                    Switch(
                      value: _switchValue,
                      onChanged: (bool value) {
                        setState(() {
                          _switchValue = value;
                          _isDarkModeEnabled = value; // atualizar valor da variável
                        });
                      },
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 16),
                  child: Image.asset('img/logo.png'),
                ),
              ),
              Text(
                "Digite seu Email e senha",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.all(
                  )
              ),
                
              child: Text(
                "Logar",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {},
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Não possui uma conta?',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push;

                      context;
                      MaterialPageRoute(
                        builder: ((context) => const cadastro()),
                      );
                    //)
                  },
                  child: const Text('Cadastre-se'),
                )
              ],
            ),
          ],
        ),
      )
    ));
  }
}