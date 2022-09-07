abstract class HttpService {
  Future get<T>({
    required Uri uri,
    Map<String, String>? headers,
    bool decodeResponse = true,
  });
}
