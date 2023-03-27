import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  bool _isDarkModeEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  void _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkModeEnabled = prefs.getBool('isDarkModeEnabled') ?? false;
    });
  }

  void _saveThemePreference(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkModeEnabled', value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        
        theme: _isDarkModeEnabled
            ? ThemeData.dark().copyWith(
                primaryColor: Colors.cyan.shade400,
                colorScheme: ColorScheme.fromSwatch()
                    .copyWith(secondary: Colors.white),
              )
            : ThemeData(
                primaryColor: Colors.cyan.shade400,
                colorScheme: ColorScheme.fromSwatch()
                    .copyWith(secondary: Colors.white),
              ),
        home: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text("Faça seu login"),
            backgroundColor: Colors.cyan,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () =>
                    _scaffoldKey.currentState!.openEndDrawer(),
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
            value: _switchValue,
            onChanged: (bool value) {
              setState(() {
                _switchValue = value;
                _isDarkModeEnabled = value;
                _saveThemePreference(value);
              });
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
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "Digite seu email"),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerUsuario,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Digite sua senha"),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerSenha,
                obscureText: true,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.all(15),
                  ),
                  child: Text(
                    "Logar",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                ),
              ),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const cadastro()));

                    //)
                  },
                  child: const Text('Cadastre-se'),
                )
              ],
            ),
          
        ]),
      )
    ));
  }
} 