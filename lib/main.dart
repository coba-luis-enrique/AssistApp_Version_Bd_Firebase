import 'package:asesorias_flutter/locator.dart';
import 'package:asesorias_flutter/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:asesorias_flutter/model/crud/crud_asesorias.dart';
import 'package:asesorias_flutter/router.dart' as rout;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
 setUpLocator();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<crudAsesorias>())
      ],
          child: MaterialApp(
          title: 'Flutter Firebase',
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
          onGenerateRoute: rout.Router.generateRoute,
        ),
    );
  }
}
