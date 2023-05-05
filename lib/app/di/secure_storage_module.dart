import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageModule {
  static AndroidOptions get aOptions {
    return const AndroidOptions(
      encryptedSharedPreferences: true,
    );
  }

  static IOSOptions get iOptions {
    return const IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    );
  }

  static FlutterSecureStorage get storage {
    return FlutterSecureStorage(
      aOptions: aOptions,
      iOptions: iOptions,
    );
  }
}
