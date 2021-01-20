import 'package:asesorias_flutter/model/asesoria_model.dart';
import 'package:asesorias_flutter/model/crud/crud_asesorias.dart';
import 'package:asesorias_flutter/pages/asesoria_detalles.dart';
import 'package:asesorias_flutter/pages/modificar_asesoria.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AsesoriaTile extends StatelessWidget {
  final Asesoria asesoriaDetalles;
  

  AsesoriaTile ({@required this.asesoriaDetalles});

  @override
  Widget build(BuildContext context) {
    var asesoriaProvider = Provider.of<crudAsesorias>(context);
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => ModificarAsesoria(asesoria: asesoriaDetalles)));
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          child: Container(
            height: MediaQuery
            .of(context)
            .size
            .height * 0.10,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.8,
            child: Column(
              children:[
                ListTile(
                  leading: Icon(Icons.note),
                  trailing: IconButton(
            iconSize: 35,
            icon: Icon(Icons.delete,
            color: Colors.red,
            ),
            onPressed: ()async {
              await asesoriaProvider.eliminarAsesoria(asesoriaDetalles.id);
              Navigator.pop(context);
            },
          ),
                  title: Text('Materia: ${asesoriaDetalles.materia} | Asesor: ${asesoriaDetalles.asesor}'),
                  subtitle: Text('Tema: ${asesoriaDetalles.tema} | Fecha: ${asesoriaDetalles.fecha}'),
                )
              ]
            ),
          ),
        ),
        ),
    );
  }
}