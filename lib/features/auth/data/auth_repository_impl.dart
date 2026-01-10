import 'package:language_app/features/auth/domain/auth_repository.dart';
import 'package:pocketbase/pocketbase.dart';

class AuthRepositoryImpl implements AuthRepository {
  final PocketBase pb;

  AuthRepositoryImpl({required this.pb});
  @override
  Future<void> login(String login, String password) async {
    final authData = await pb
        .collection('users')
        .authWithPassword(login, password);
  }
}
