import 'package:basketball_training/core/NetWorking/API.dart';



enum DataSource {
  NO_CONTENT,

  BAD_REQUEST,

  FORBIDDEN,

  UNAUTORISED,
  
  NOT_FOUND,

  INTERNAL_SERVER_ERROR,

  CONNECT_TIMEOUT,

  CANCEL,

  RECIEVE_TIMEOUT,

  SEND_TIMEOUT,

  CACHE_ERROR,

  NO_INTERNET_CONNECTION,

// API_LOGIC_ERROR,
  DEFAULT,
}

class ResponseCode {
  static const int SUCCESS = 200;
  static const int BAD_REQUEST = 400;
  static const int UNAUTORISED = 401;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int NOT_FOUND = 404;
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}


class ResponseMessage {


static const String NO_CONTENT =ApiErrors.noContent;


static const String BAD_REQUEST =ApiErrors.badRequestError; // failure, API rejected re

static const String UNAUTORISED =ApiErrors.unauthorizedError; // failure, user is not a

static const String FORBIDDEN = ApiErrors.forbiddenError;


static const String NOT_FOUND =ApiErrors.notFoundError;


static String CONNECT_TIMEOUT = ApiErrors.timeoutError;

static String CANCEL= ApiErrors.defaultError;

static String RECIEVE_TIMEOUT = ApiErrors.timeoutError;

static String SEND_TIMEOUT= ApiErrors.timeoutError;

static String CACHE_ERROR = ApiErrors.cacheError;

static String NO_INTERNET_CONNECTION = ApiErrors.noInterNetError;

static String DEFAULT =ApiErrors.defaultError;

}
class ApiInternalStatus {
  static const int SUCCESS = 0;

  static const int FAILURE = 1;
}
