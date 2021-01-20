import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Api {

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String path;
  CollectionReference ref;

  Api(this.path) {
    ref =  _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.get(); //Future Retorna un solo valor
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots(); //Stream Retorna multiples valores
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.doc(id).get();
  }

  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }

  Future<void> updateDocument(Map data , String id) {
    return ref.doc(id).update(data) ;
  }

  Future<void> removeDocument(String id){
    return ref.doc(id).delete();
  }

}