class APIConstants {
  // static const String apiBaseUrl = "https://api.weatherapi.com/v1/";
  static const String apiBaseUrl =
      "https://api.weatherapi.com/v1/forecast.json?key=870b411017d94da8afe174640241210&q=30.0444,31.2357&days=8";
  // static const String apiKey = "870b411017d94da8afe174640241210";
  // static const String forecast = "forecast.json";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";

  static const String noContent = "noContent";

  static const String forbiddenError = "forbiddenError";

  static const String unauthorizedError = "unauthorizedError";

  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";

  static const String internalServerError = "internalServer Error";

  static const String unknownError = "unknownError";

  static const String timeoutError = "defaultError";
  static const String defaultError = "timeoutError";

  static const String cacheError = "cacheError";
  static const String noInterNetError = "noInterNetError";

  static const String loadingMessage = "loading_message";

  static const String retryAgainMessage = "retry_again_message";

  static const String ok = "Ok";
}
