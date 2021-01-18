import 'package:asesorias_flutter/model/bd_asesorias.dart';
import 'package:asesorias_flutter/providers/asesoria_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'forma_asesoria.dart';

class HomeAsesoria extends StatefulWidget {
  final Asesoria asesoria;

  HomeAsesoria({this.asesoria});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeAsesoria> {
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
          title: Text('MIS ASESORIAS'),
        ),
        body: StreamBuilder<List<Asesoria>>(
          stream: asesoriaProvider.asesorias,
          builder: (context, snapshot) {
            return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index){
        return ListTile(
          onTap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeAsesoria(
               asesoria: snapshot.data[index],
             )
             )
             );
          },
          title: Text(snapshot.data[index].asesor),
          subtitle: Text(snapshot.data[index].materia),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              asesoriaProvider.eliminarAsesoria(widget.asesoria.id);
                    Navigator.of(context).pop(HomeAsesoria());
            }
              
            ),
        );
          }
          );
          }
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add
          ),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FormTutoria()));
          },
        ),
    );
               }
}
