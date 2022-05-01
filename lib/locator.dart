import 'package:get_it/get_it.dart';
import 'package:medpoint/services/authentication.dart';
import 'package:medpoint/services/firestore_service.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => AuthenticationHelper());
  locator.registerLazySingleton(() => FirestoreService());
}
