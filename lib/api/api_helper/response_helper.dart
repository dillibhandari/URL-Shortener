import 'package:url_shorter/api/api_client/result.dart';

import 'exception_helper.dart';

class ResponseHelper {
  static AppException error(Result result) {
    int statusCode = result.getErrorMsg().errorCode;
    String errorMessage = "", icon = "images/hotel_logo.png";
    switch (statusCode) {
      case 1517:
        errorMessage =
            "The server responded with malformed data, please retry again.";
        return ServerException(
            errorMessage: errorMessage, statusCode: statusCode, icon: icon);
      case 500:
      case 522:
      case 504:
      case 552:
        errorMessage =
            "The server encountered an error and could not complete your request, please retry again.";
        return ServerException(
            errorMessage: errorMessage, statusCode: statusCode, icon: icon);
      case 1503:
        errorMessage =
            "No Internet Connection, please check your network settings and try again.";
        return NetworkException(
            errorMessage: errorMessage, statusCode: statusCode, icon: icon);
      case 1599:
      case 1525:
        errorMessage =
            "Network unreachable, please check your network settings and try again.";
        return NetworkException(
            errorMessage: errorMessage, statusCode: statusCode, icon: icon);
      case 204:
        errorMessage = "No content found.";
        return NoContentException(
            errorMessage: errorMessage, statusCode: statusCode, icon: icon);
      case 422:
        final DataError error = result.getErrorMsg();
        Map map = error.data["message"] as Map;
        map.forEach((key, value) => errorMessage = map[key][0]);
        return ValidationException(
            errorMessage: errorMessage, statusCode: statusCode, icon: icon);
      default:
        if (result.getErrorMsg().data is Map) {
          errorMessage = result.getErrorMsg().data["message"];
        } else {
          errorMessage = result.getErrorMsg().message;
        }
        return DefaultException(
            errorMessage: errorMessage, statusCode: statusCode, icon: icon);
    }
  }
}
