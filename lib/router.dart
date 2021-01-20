import 'package:asesorias_flutter/pages/asesorias_disp.dart';
import 'package:asesorias_flutter/pages/forma_asesoria.dart';
import 'package:asesorias_flutter/pages/mis_asesorias.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeAsesoria()
          );
      case '/nuevaAsesoria':
        return MaterialPageRoute(
          builder: (_) => FormTutoria()
          );
      case '/asesoriasDisp':
        return MaterialPageRoute(
          builder: (_) => HomeAsesoriaDisp()
          );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
          )
          );
    }
  }
}