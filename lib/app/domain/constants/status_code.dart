enum StatusCode { success, ok, failed, unAuthorized }

extension StatusCodeExtension on StatusCode {
  int get code => [200, 201, 400, 401][index];
}
