import 'package:get_it/get_it.dart';
import 'package:language_app/features/auth/data/auth_repository_impl.dart';
import 'package:language_app/features/auth/domain/auth_repository.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setUp() async {
  final prefs = await SharedPreferences.getInstance();

  final store = AsyncAuthStore(
    save: (String data) async => prefs.setString('pb_auth', data),
    initial: prefs.getString('pb_auth'),
  );
  getIt.registerLazySingleton<PocketBase>(
    () => PocketBase('http://127.0.0.1:8090/', authStore: store),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(pb: getIt()),
  );
}
