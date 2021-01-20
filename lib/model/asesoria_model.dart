class Asesoria {

  String id;
  String asesor;
  String materia;
  String tema;
  String fecha;

  Asesoria({this.id, this.asesor, this.materia, this.tema, this.fecha});


  Asesoria.fromMap(Map snapshot, String id) :
    id = id ?? '',
    asesor = snapshot['asesor'] ?? '',
    materia = snapshot['materia'] ?? '',
    tema = snapshot['tema'] ?? '',
    fecha = snapshot['fecha'] ?? '';

   toJson(){
     return {
       'asesor': asesor,
       'materia': materia,
       'tema': tema,
       'fecha': fecha,
     };
   }
}