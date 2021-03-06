import 'package:asesorias_flutter/model/asesoria_model.dart';
import 'package:asesorias_flutter/model/crud/crud_asesorias.dart';
import 'package:asesorias_flutter/pages/mis_asesorias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormTutoria extends StatefulWidget {
  @override
  _FormTutoriaState createState() => _FormTutoriaState();
}

class _FormTutoriaState extends State<FormTutoria> {

  final _formKey = GlobalKey<FormState>();
  String asesor;
  String materia;
  String tema;
  String fecha;

  @override
  Widget build(BuildContext context) {
    var asesoriaProvider = Provider.of<crudAsesorias>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Nueva Asesoria'),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Form(
            key: _formKey,
                      child: Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Asesor',
                        ),
                        onSaved: (value) => asesor = value,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Materia:',
                        ),
                        onSaved: (value) => materia = value,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Tema',
                        ),
                        onSaved: (value) => tema = value,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Fecha ',
                        ),
                        onSaved: (value) => fecha = value,
                      ),
                      SizedBox(height: 20),
                      RaisedButton(
                        splashColor: Colors.greenAccent[400],
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                        child: Text('Crear',style: TextStyle(color: Colors.black)),
                        onPressed: () async {
                          if(_formKey.currentState.validate()){
                            _formKey.currentState.save();
                            await asesoriaProvider.agregarAsesoria(
                              Asesoria(
                                asesor: asesor, materia: materia, tema: tema, fecha: fecha)
                                );
                          }
                          Navigator.pop(context);
                        },
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(20)),
                        // child: widget.Tutoria == null
                        //     ? Text('Create')
                        //     : Text('Update'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
