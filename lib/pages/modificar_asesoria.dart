import 'package:asesorias_flutter/model/asesoria_model.dart';
import 'package:asesorias_flutter/model/crud/crud_asesorias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModificarAsesoria extends StatefulWidget {
  final Asesoria asesoria;

  ModificarAsesoria({@required this.asesoria});

  @override
  _ModificarAsesoriaState createState() => _ModificarAsesoriaState();
}

class _ModificarAsesoriaState extends State<ModificarAsesoria> {

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
         title: Text('Actualizar Asesoria'),
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
                        initialValue: widget.asesoria.asesor,
                        decoration: InputDecoration(
                          labelText: 'Asesor',
                        ),
                        onSaved: (value) => asesor = value,
                      ),
                      TextFormField(
                        initialValue: widget.asesoria.materia,
                        decoration: InputDecoration(
                          labelText: 'Materia:',
                        ),
                        onSaved: (value) => materia = value,
                      ),
                      TextFormField(
                        initialValue: widget.asesoria.tema,
                        decoration: InputDecoration(
                          labelText: 'Tema',
                        ),
                        onSaved: (value) => tema = value,
                      ),
                      TextFormField(
                        initialValue: widget.asesoria.fecha,
                        decoration: InputDecoration(
                          labelText: 'Fecha ',
                        ),
                        onSaved: (value) => fecha = value,
                      ),
                      SizedBox(height: 20),
                      RaisedButton(
                        splashColor: Colors.blueAccent[400],
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                        child: Text('Actualizar',style: TextStyle(color: Colors.black)),
                        onPressed: () async {
                          if(_formKey.currentState.validate()){
                            _formKey.currentState.save();
                            await asesoriaProvider.actualizarAsesoria(
                              Asesoria(
                                asesor: asesor, materia: materia, tema: tema, fecha: fecha), 
                                widget.asesoria.id
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