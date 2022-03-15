import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/app/domain/http/interceptors/authentication_interceptor.dart';
import 'package:flutter_boilerplate/app/domain/http/services/authentication_service.dart';
import 'package:flutter_boilerplate/app/domain/persistence/credentials_persistence.dart';
import 'package:flutter_boilerplate/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_boilerplate/app/presentation/viewmodels/authentication/authentication_viewmodel.dart';
import 'package:flutter_boilerplate/env/env.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class ApplicationContainer {
  static final Dio client = Dio(BaseOptions(baseUrl: Env.baseUrl))
    ..interceptors.addAll([
      AuthenticationInterceptor(credentialsPersistence),
    ]);

  static final AuthenticationService authenticationService =
      AuthenticationServiceImpl(client);

  static const AndroidOptions secureStorageAndroidOptions =
      AndroidOptions(encryptedSharedPreferences: true);

  static const IOSOptions secureStorageIOSOptions =
      IOSOptions(accessibility: IOSAccessibility.first_unlock);

  static const CredentialsPersistence credentialsPersistence =
      CredentialsPersistenceImpl(
    FlutterSecureStorage(
      aOptions: secureStorageAndroidOptions,
      iOptions: secureStorageIOSOptions,
    ),
  );

  static final AuthenticationRepository authenticationRepository =
      AuthenticationRepositoryImpl(
    authenticationService,
    credentialsPersistence,
  );

  static final AuthenticationViewModel authenticationViewModel =
      AuthenticationViewModelImpl(authenticationRepository);
}
