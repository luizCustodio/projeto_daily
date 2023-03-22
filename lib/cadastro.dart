import 'package:flutter/material.dart';
import 'login.dart';

class cadastro extends StatefulWidget {
const cadastro({super.key});
@override
State<cadastro> createState() => _cadastroState();
}
class _cadastroState extends State<cadastro> {
  TextEditingController _controllerUsuario = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerConfirmarSenha = TextEditingController();
@override
Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text("Faça o seu cadastro"),
  backgroundColor: Colors.blue,
  ),
  body: Container(
  child: SingleChildScrollView(
  padding: EdgeInsets.all(32),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children:<Widget> [
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
            ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                 "Cadastro",textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                )
              ),
            ),
            Container(
               height: 50.0, 
  
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Nome deusuário"),
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
              border: OutlineInputBorder(),
              labelText: "Email"),
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
                    backgroundColor: Color.fromARGB(255, 23, 105, 172),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.all(15),
                  ),
                  child: Text("Cadastrar",
                  style: TextStyle(fontSize: 20),
                  ),
                  onPressed: (){},
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
                  Navigator.push(context, 
              MaterialPageRoute(
                builder: ((context) => const Login())
              )
            );
                 },
                 child: const Text('Faça Login'),
                 ),
               ],
              )
            ]
          )
        ),
      )
    );
  }
}
