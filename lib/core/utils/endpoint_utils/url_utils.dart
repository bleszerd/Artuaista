abstract class EndpointUtils {
  static Uri createEndpointUrl({
    String? baseUrl,
    required String url,
    Map<String, dynamic>? queryParams,
    List<String>? urlParams,
  }) {
    String query = "";
    String urlParamsStr = "";
    String requestBaseUrl = "";

    if (baseUrl != null) {
      requestBaseUrl = baseUrl;
    }

    if (urlParams != null) {
      for (var urlParam in urlParams) {
        urlParamsStr += "/$urlParam";
      }
    }

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

    Uri finalUrl = Uri.parse("$requestBaseUrl$url$urlParamsStr$query");

    return finalUrl;
  }
}
