abstract class ApiRequests {
  //? Get Method
  Future<dynamic> get({required String endPoint});
  //? Post Method
  Future<dynamic> post({
    required String endPoint,
    Object? data,
  });

  //? Patch Method
  Future<dynamic> patch(
    String endPoint, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  });

  //? Delete Method
  Future<dynamic> delete(
    String endPoint, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  });
}
