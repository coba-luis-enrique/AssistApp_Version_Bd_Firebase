import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

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
                                    ? 'por favor inserte un nombre de usuario'
                                    : null;
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Nombre de Usuario',
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                              ),
                            ),
                            TextFormField(
                              validator: (e) {
                                return e.toLowerCase().trim().isEmpty
                                    ? 'por favor inserte su correo institucional'
                                    : null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Correo',
                                prefixIcon: Icon(
                                  Icons.email,
                                ),
                              ),
                            ),
                            TextFormField(
                              validator: (e) {
                                return e.toLowerCase().trim().isEmpty
                                    ? 'por favor inserte una contraseña'
                                    : null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Contraseña',
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                              ),
                            ),
                            TextFormField(
                              validator: (e) {
                                return (e.toLowerCase().trim().isEmpty)
                                  ? 'por favor confirma su contraseña'
                                  : null; 
                                },
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Confirmar Contraseña',
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            RaisedButton(
                              onPressed: (){},
                              child: Text('Guardar'),
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
                        "Ya estas registrado ? ",
                        style: TextStyle(
                          letterSpacing: 2,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Ingresa",
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
