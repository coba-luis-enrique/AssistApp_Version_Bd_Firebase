import 'package:asesorias_flutter/model/bd_asesorias.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  FirebaseFirestore _db = FirebaseFirestore.instance;

  //OBTENER TABLA
  Stream<List<Asesoria>> getAsesorias(){
    return _db
      .collection('asesorias')
      .snapshots()
      .map((snapshot) => snapshot.docs
      .map((doc) => Asesoria.fromJson(doc.data()))
      .toList());
  } 

  //CREAR Y/O ACTUALIZAR ASESORIA
  Future<void> setAsesoria(Asesoria asesoria){
    var opcion = SetOptions(merge:true);

    return _db
      .collection('asesorias')
      .doc(asesoria.id)
      .set(asesoria.toMap(),opcion);
  }

  //BORRAR ASESORIA
  Future<void> eliminarAsesoria(String id){
    return _db
      .collection('asesorias')
      .doc(id)
      .delete();
  }

}