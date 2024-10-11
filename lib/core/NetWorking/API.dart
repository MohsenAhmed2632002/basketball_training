class APIConstants {
    // رابط الأساس لطلبات الطقس
  static const String apiBaseUrl = "https://api.weatherapi.com/v1/";
  static const String apiKey = "f5e657f7a0484ab5b25173533231907";
  
  // مسار الحصول على التوقعات الجوية
  static const String forecast = "forecast.json";

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
