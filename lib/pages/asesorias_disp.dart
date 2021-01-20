import 'package:asesorias_flutter/model/asesoria_model.dart';
import 'package:asesorias_flutter/model/crud/crud_asesorias.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'asesoria_tile.dart';
import 'forma_asesoria.dart';

class HomeAsesoriaDisp extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeAsesoriaDisp> {

  List<Asesoria> asesorias;

  @override
  Widget build(BuildContext context) {
    final asesoriaProvider = Provider.of<crudAsesorias>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('ASESORIAS DISPONIBLES'),
          elevation: 0,
        ),
         body: Container(
          child: StreamBuilder(
            stream: asesoriaProvider.fetchProductAsStream(),
            builder: (context, AsyncSnapshot <QuerySnapshot> snapshot){
              if(snapshot.data != null) {
                snapshot.connectionState == ConnectionState.waiting
                  ? Center(child: CircularProgressIndicator())
                  : asesorias = snapshot.data.docs
                    .map((doc) => Asesoria.fromMap(doc.data(), doc.id))
                    .toList();
              return asesorias.length == 0
                ? Center(
                  child: Text(
                          'No se han creado asesorias',
                        ),
                )
                : ListView.builder(
                  itemCount: asesorias.length,
                  itemBuilder: (buildContext, index) =>
                    AsesoriaTile(asesoriaDetalles: asesorias[index])
                  );
              } else {
                return Container();
              }
            
            }),
        ),
        // body: StreamBuilder<List<Asesoria>>(
        //   stream: asesoriaProvider.asesorias,
        //   builder: (context, snapshot) {
        //     return ListView.builder(
        //       scrollDirection: Axis.vertical,
        //   itemCount: snapshot.data.length,
        //   itemBuilder: (context, index){
        // return ListTile(
        //   onTap: (){
        //      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FormTutoria(
        //        asesoria: snapshot.data[index],
        //      )
        //      )
        //      );
        //   },
        //   title: Text(snapshot.data[index].asesor),
        //   subtitle: Text(snapshot.data[index].asesoria),
        //     );  
        //   }
        //   );
        //   }
        // ),
          
    );
  }
}
