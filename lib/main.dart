import 'package:asesorias_flutter/pages/login_page.dart';
import 'package:asesorias_flutter/providers/asesoria_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
          create: (context) => AsesoriaProvider(),
          child: MaterialApp(
        title: 'Flutter Firebase',
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
