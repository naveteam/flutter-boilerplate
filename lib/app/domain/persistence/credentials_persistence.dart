import 'package:flutter_boilerplate/app/domain/constants/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CredentialsPersistence {
  Future<String?> getCredentials();
  Future<bool> storeCredentials({required String token});
  Future<bool> clearCredentials();
}

class CredentialsPersistenceImpl implements CredentialsPersistence {
  const CredentialsPersistenceImpl(this._lazySharedPreferences);

  final Future<SharedPreferences> _lazySharedPreferences;

  @override
  Future<String?> getCredentials() async {
    return (await _lazySharedPreferences)
        .getString(SharedPreferencesConstants.token);
  }

  @override
  Future<bool> storeCredentials({required String token}) async {
    return await (await _lazySharedPreferences)
        .setString(SharedPreferencesConstants.token, token);
  }

  @override
  Future<bool> clearCredentials() async {
    return await (await _lazySharedPreferences).clear();
  }
}
