import 'package:language_app/features/pincode/domain/pincode_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PincodeRepositoryImpl implements PincodeRepository {
  final _key = 'pincode';
  @override
  Future<void> addPincode(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, value);
  }

  @override
  Future<void> delPincode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
