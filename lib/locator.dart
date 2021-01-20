import 'package:asesorias_flutter/model/crud/crud_asesorias.dart';
import 'package:asesorias_flutter/services/api.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => Api('asesorias'));
  locator.registerLazySingleton(() => crudAsesorias());
}