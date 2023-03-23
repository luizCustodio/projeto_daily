import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 179, 174, 174),// define a cor de fundo do app
      appBar: AppBar(
        backgroundColor: Colors.cyan[800], // define a cor de fundo do appbar
        title: Text('Faça seu login'), // define o texto do título
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ), 
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            // ignore: sized_box_for_whitespace
            Container(
              height: 350,
              width: double.infinity,
              child: Image.asset('img/logo.png'),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20), // define uma margem superior de 20 pixels
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(height: 10), // alteração marcada em vermelho
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 19,
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: (){}, 
                      child: const Text("Logar"),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 26)
                      ),
                    ),
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