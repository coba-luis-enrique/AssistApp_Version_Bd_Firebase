import 'package:asesorias_flutter/services/api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:asesorias_flutter/locator.dart';
import '../asesoria_model.dart';

class crudAsesorias extends ChangeNotifier {

  Api _api = locator<Api>(); 

  List<Asesoria> asesorias;

  Future<List<Asesoria>> fetchAsesorias() async {
    var result = await _api.getDataCollection();
    asesorias = result.docs.map((doc) => Asesoria.fromMap(doc.data(), doc.id)).toList();
    return asesorias;
  }

  Stream<QuerySnapshot> fetchProductAsStream() {
    return _api.streamDataCollection();
  }

  Future<Asesoria> getAsesoriaByID(String id) async {
    var doc = await _api.getDocumentById(id);
    return Asesoria.fromMap(doc.data(), doc.id);
  }

  Future agregarAsesoria(Asesoria data) async {
    var result = await _api.addDocument(data.toJson());
    return;
  }

  Future actualizarAsesoria(Asesoria data, String id) async {
    await _api.updateDocument(data.toJson(), id);
    return;
  }

  Future eliminarAsesoria(String id) async{
    await _api.removeDocument(id);
    return;
  }
}