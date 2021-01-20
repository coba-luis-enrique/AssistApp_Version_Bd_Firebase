import 'package:asesorias_flutter/model/asesoria_model.dart';
import 'package:asesorias_flutter/model/crud/crud_asesorias.dart';
import 'package:asesorias_flutter/pages/modificar_asesoria.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AsesoriaDetalles extends StatelessWidget {
  final Asesoria asesoria;

  AsesoriaDetalles({@required this.asesoria});

  @override
  Widget build(BuildContext context) {
    final asesoriaProvider = Provider.of<crudAsesorias>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('DETALLES DE ASESORIA'),
        actions: [
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.delete_forever),
            onPressed: ()async {
              await asesoriaProvider.eliminarAsesoria(asesoria.id);
              Navigator.pop(context);
            },
          ),
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.edit),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> ModificarAsesoria(asesoria: asesoria,)
              )
              );
            },
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: asesoria.id,
            child: Text('${asesoria.materia}'),
          ),
          SizedBox(
            height: 20
          ),
          Text(
            '${asesoria.asesor}',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                fontStyle: FontStyle.italic),
          ),
           Text(
            '${asesoria.tema}',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                fontStyle: FontStyle.italic),
          ),
           Text(
            '${asesoria.fecha}',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}