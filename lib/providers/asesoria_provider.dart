// import 'package:asesorias_flutter/model/bd_asesorias.dart';
// import 'package:asesorias_flutter/services/firestore_service.dart';
// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';

// class AsesoriaProvider with ChangeNotifier {

//   final firestoreService = FirestoreService();

//   String _id;
//   String _asesor;
//   String _materia;
//   String _tema;
//   String _fecha;
//   var uuid = Uuid();

//   //GETTERS
//   String get asesor => _asesor;
//   String get materia => _materia;
//   String get tema => _tema;
//   String get fecha => _fecha;
//   Stream<List<Asesoria>> get asesorias => firestoreService.getAsesorias();

//   //SETTERS
//   set changeAsesor(String asesor){
//     _asesor = asesor;
//     notifyListeners();
//   }

//   set changeMateria(String materia){
//     _materia = materia;
//     notifyListeners();
//   }

//   set changeTema(String tema){
//     _tema = tema;
//     notifyListeners();
//   }

//   set changeFecha(String fecha){
//     _fecha = fecha;
//     notifyListeners();
//   }

//   //FUNCIONES
//   loadAll(Asesoria asesoria){
//     if(asesoria != null){
//       _id = asesoria.id;
//       _asesor = asesoria.asesor;
//       _materia = asesoria.materia;
//       _tema = asesoria.tema;
//       _fecha = asesoria.fecha;
//     }else{
//       _id = null;
//       _asesor = null;
//       _materia = null;
//       _tema = null;
//       _fecha = null;
//     }
//   }

//   guardarAsesoria(){
//     if(_id == null){
//       //CREAR
//       var nuevaAsesoria = Asesoria(id: uuid.v1(), asesor: _asesor, materia: _materia, tema: _tema, fecha: _fecha);
//       firestoreService.setAsesoria(nuevaAsesoria);
//     }else{
//       //ACTUALIZAR
//       var actualizarAsesoria = Asesoria(id: _id, asesor: _asesor, materia: _materia, tema: _tema, fecha: _fecha);
//       firestoreService.setAsesoria(actualizarAsesoria);
//     }
//   }

//   eliminarAsesoria(String id){
//     firestoreService.eliminarAsesoria(id);
//   }
// }