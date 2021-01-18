import 'package:flutter/material.dart';
import 'homepage.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              body: SafeArea(
                              child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/logo_itsva.png",
                              fit: BoxFit.fill,
                              scale: 1.5,
                            ),
                          ),
                          Container(
                              //width: double.infinity,
                              //decoration: BoxDecoration(color: Colors.blue[300]),
                              //padding: EdgeInsets.all(10),
                              //elevation: 1.5
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              width: double.infinity,
                              height: 70,
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '" Inicie sesión',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.blue[900],
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: ' para continuar "',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.red[900],
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                              )),
                          SizedBox(height: 20),
                          Card(
                            elevation: 5,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Form(
                                
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    TextFormField(
                                      
                                      validator: (e) {
                                        return e.toLowerCase().trim().isEmpty
                                            ? 'por favor inserta la matricula'
                                            : null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        labelText: 'Matricula',
                                        prefixIcon: Icon(
                                          Icons.email,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      
                                      validator: (e) {
                                        return e.toLowerCase().trim().isEmpty
                                            ? 'por favor inserte la contraseña'
                                            : null;
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        prefixIcon: Icon(
                                          Icons.lock,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    RaisedButton(
                                      onPressed: (){
                                        Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home_Page(),
                                    ),
                                  );
                                      },
                                      child: Text('Ingresar'),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "¿no tienes cuenta? ",
                                style: TextStyle(
                                  letterSpacing: 2,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Regístrate",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    letterSpacing: 2,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );      
  }
}
