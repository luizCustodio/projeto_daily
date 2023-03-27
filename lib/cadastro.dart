import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class cadastro extends StatefulWidget {
  const cadastro({Key? key}) : super(key: key);

  @override
  _cadastroState createState() => _cadastroState();
}

class _cadastroState extends State<cadastro> {
  TextEditingController _controllerUsuario = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerConfirmarSenha = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDarkModeEnabled = false;

  late SharedPreferences _preferences;

  @override
  void initState() {
    super.initState();
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {
      _isDarkModeEnabled = _preferences.getBool('isDarkModeEnabled') ?? false;
    });
  }

  Future<void> _setDarkModeEnabled(bool value) async {
    setState(() {
      _isDarkModeEnabled = value;
    });
    await _preferences.setBool('isDarkModeEnabled', value);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Faça o seu cadastro"),
          backgroundColor: Colors.cyan,
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
            ),
          ],
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Menu'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Dark Mode'),
                        Switch(
                          value: _isDarkModeEnabled,
                          onChanged: (bool value) {
                            setState(() {
                              _isDarkModeEnabled = value;
                            });
                            _setDarkModeEnabled(value);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
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
            ],
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Cadastro",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 50.0,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nome de usuário"),
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  controller: _controllerUsuario,
                ),
                Container(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  controller: _controllerEmail,
                ),
                Container(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Digite uma senha"),
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  controller: _controllerSenha,
                  obscureText: true,
                ),
                Container(
                  height: 8.0,
                ),
                TextField(

                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Confirme sua senha"),
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  controller: _controllerConfirmarSenha,
                  obscureText: true,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.all(15),
                    ),
                    child: Text(
                      "Cadastrar",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Ja possui uma conta?',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const Login())));
                      },
                      child: const Text('Faça Login'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}