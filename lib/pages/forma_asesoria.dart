import 'package:asesorias_flutter/model/bd_asesorias.dart';
import 'package:asesorias_flutter/pages/mis_asesorias.dart';
import 'package:asesorias_flutter/providers/asesoria_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormTutoria extends StatefulWidget {

  final Asesoria asesoria;

  FormTutoria({this.asesoria});

  @override
  _FormTutoriaState createState() => _FormTutoriaState();
}

class _FormTutoriaState extends State<FormTutoria> {

  final asesoriaController = TextEditingController();

  @override
  void dispose() {
    asesoriaController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final asesoriaProvider = Provider.of<AsesoriaProvider>(context, listen: false);
    if(widget.asesoria != null){
      //EDITAR
      asesoriaController.text = widget.asesoria.asesoria;
      asesoriaProvider.loadAll(widget.asesoria);
    }else{
      //AGREGAR
      asesoriaProvider.loadAll(null);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final asesoriaProvider = Provider.of<AsesoriaProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Nueva Asesoria'),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Card(
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
                      onChanged: (String value) => asesoriaProvider.changeAsesor = value,
                      controller: asesoriaController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Materia:',
                      ),
                      onChanged: (String value) => asesoriaProvider.changeMateria = value,
                      controller: asesoriaController,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Tema',
                      ),
                      onChanged: (String value) => asesoriaProvider.changeTema = value,
                      controller: asesoriaController,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Fecha ',
                      ),
                      onChanged: (String value) => asesoriaProvider.changeFecha = value,
                      controller: asesoriaController,
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                      child: Text('Guardar',style: TextStyle(color: Colors.green)),
                      onPressed: () {
                        asesoriaProvider.guardarAsesoria();
                        Navigator.of(context).pop(HomeAsesoria());
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
        ],
      ),
    );
  }
}
