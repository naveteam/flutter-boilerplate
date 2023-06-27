import 'package:dio/dio.dart';

abstract class TodosRemoteDataSource {
  Future<List<dynamic>> getAll();
}

class TodosRemoteDataSourceImpl implements TodosRemoteDataSource {
  final Dio _client;

  const TodosRemoteDataSourceImpl(this._client);

  @override
  Future<List<dynamic>> getAll() async {
    final payload = await _client.get('/todos');

    return payload.data ?? [];
  }
}
