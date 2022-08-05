class EndpointUtils {
  static Uri createEndpointUrl({
    required String baseUrl,
    required String url,
    Map<String, dynamic>? queryParams,
  }) {
    String query = "";

    var queryKeys = queryParams?.keys;
    var lastQueryKey = queryKeys?.last;
    var firstQueryKey = queryKeys?.first;

    queryParams?.forEach((key, value) {
      if (firstQueryKey == key) {
        query += "?";
      }

      query += "$key=$value";

      if (lastQueryKey != key) {
        query += "&";
      }
    });

    Uri finalUrl = Uri.parse("$baseUrl$url$query");

    return finalUrl;
  }
}
