import 'package:flutter_boilerplate/app/domain/constants/secure_storage_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class CredentialsPersistence {
  Future<String?> getCredentials();
  Future<void> storeCredentials({required String token});
  Future<void> clearCredentials();
}

class CredentialsPersistenceImpl implements CredentialsPersistence {
  const CredentialsPersistenceImpl(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  @override
  Future<String?> getCredentials() async {
    return await _secureStorage.read(
      key: SecureStorageConstants.token,
    );
  }

  @override
  Future<void> storeCredentials({required String token}) async {
    return await _secureStorage.write(
      key: SecureStorageConstants.token,
      value: token,
    );
  }

  @override
  Future<void> clearCredentials() async {
    return await _secureStorage.delete(
      key: SecureStorageConstants.token,
    );
  }
}
