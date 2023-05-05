import 'package:flutter_boilerplate/app/constants/secure_storage.dart';
import 'package:flutter_boilerplate/app/data/entities/auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthLocalDataSource {
  Future<Auth?> getAuth();
  Future<void> setAuth(Auth auth);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage _storage;

  const AuthLocalDataSourceImpl(this._storage);

  @override
  Future<Auth?> getAuth() async {
    final values = await Future.wait([
      _storage.read(key: SecureStorageConstants.token),
      _storage.read(key: SecureStorageConstants.refreshToken),
    ]);

    if (values.first == null) {
      return null;
    }

    return Auth(
      token: values.first!,
      refreshToken: values.last,
    );
  }

  @override
  Future<void> setAuth(Auth auth) async {
    await Future.wait([
      _storage.write(key: SecureStorageConstants.token, value: auth.token),
      _storage.write(key: SecureStorageConstants.refreshToken, value: auth.refreshToken),
    ]);
  }
}
